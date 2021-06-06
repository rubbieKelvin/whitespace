import QtQuick 2.15
import "../../lib/restlib.js" as Rest

QtObject{
	id: root

	// user states
	property string token: ""
	property bool loggedIn: token.length > 1

	// user props
	property int uid: -1
	property string email: ""
	property string last_name: ""
	property string first_name: ""
	property bool is_staff: false
	property bool is_active: false
	property bool is_superuser: false
	property var last_login: null
	property var date_joined: null
	property int phone: 0

	signal requiresLogin

	function getTokenFromXtorage(){
		// try to fetch the token
		console.debug("getting token from storage...")
		let data = xtorage.text

		try{
			data = JSON.parse(data)

			// fetch token
			token = data.token || ""

			// offline user data
			let user_data = data.user || {}
			fromJson(user_data)

		}catch(e){
			// data has been tampered with
			// delete token and null user
			xtorage.text = "{}"
			nullify()
		}

		return token
	}

	function update(callback, error_callback){
		if (token.length < 1){
			requiresLogin()
			return null
		}

		const endpoint = new Rest.Request(Rest.BASEURL+"/authentication/users/me/", {
			method: "GET",
			headers: {
				Authorization: `Token ${token}`
			}
		})


		endpoint.onload(function(){
			if (endpoint.xhr.status === 200){
				const data = endpoint.xhr.response
				console.debug("got user data: "+ JSON.stringify(data))

				// fill up user
				fromJson(data)

				// update user data in xtorage
				// ...for offline use
				let xtorage_data = xtorage.text

				try{
					xtorage_data = JSON.parse(xtorage_data)
					xtorage_data.user = toJson()
					xtorage.text = JSON.stringify(xtorage_data)
				}catch(e){
					// data has been tampered with
					// delete token and null user
					xtorage.text = "{}"
					nullify()
				}

				// callback
				if (callback) callback()
			}else{
				requiresLogin()
			}
		})

		endpoint.onerror(function () {
			if (error_callback) error_callback()
		})
		
		return endpoint.call()
	}

	function login(password, callback, error_callback) {
		const endpoint = new Rest.Request(Rest.BASEURL+"/authentication/token/login", {
			method: "POST",
			body: {email, password}
		})

		endpoint.onload(function() {
			if (endpoint.xhr.status === 200){
				// here's our token
				token = endpoint.xhr.response.auth_token

				// save the token to xtorage
				// get xtorage content
				let data = xtorage.text

				try{
					// write to the token key
					data = JSON.parse(data)
					data.token = token
					xtorage.text = JSON.stringify(data)
				}catch(e){
					// data has been tampered with
					// just write the entire xtorage
					xtorage.text = JSON.stringify({token})
				}

				// callback
				if (callback) callback(endpoint.xhr)
			}else{
				if (error_callback) error_callback()
			}
		})

		endpoint.onerror(function(){
			if (error_callback) error_callback()
		})

		return endpoint.call()
	}

	function signup(password, callback, error_callback) {
		const endpoint = new Rest.Request(Rest.BASEURL+"/authentication/users/", {
			method: "POST",
			body: {email, password}
		})

		endpoint.onload(function(){
			if (endpoint.xhr.status === 201){
				if (callback) callback(endpoint.xhr)
			}else{
				if (error_callback)	error_callback()
			}
		})

		endpoint.onerror(function(){
			if (error_callback) error_callback()
		})

		return endpoint.call()
	}

	function toJson(){
		return {
			id:uid,
			email,
			last_name,
			first_name,
			is_staff,
			is_active,
			is_superuser,
			last_login,
			date_joined,
			phone
		}
	}

	function fromJson(data){
		uid = data.id || -1
		last_login = data.last_login ? new Date(data.last_login) : null
		date_joined = data.date_joined ? new Date(data.date_joined) : null
		last_name = data.last_name || ""
		first_name = data.first_name || ""
		is_staff = !!data.is_staff
		is_active = !!data.is_active
		is_superuser = !!data.is_superuser
		phone = data.phone || 0
	}

	function nullify(){
		// clear user data
		// excluding email
		uid = -1
		last_login = null
		is_superuser = false
		is_staff = false
		is_active = false
		date_joined = null
		first_name = ""
		last_name = ""
		phone = 0
	}

	Component.onCompleted: {
		getTokenFromXtorage()
	}

	onTokenChanged: {
		update()
	}

	onRequiresLogin: {
		xtorage.text = "{}"
		token = ""
	}
}
