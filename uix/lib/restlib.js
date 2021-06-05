.pragma library

const BASEURL = "http://192.168.122.1:8000/api"

class Requests {
	constructor (url, options) {
		this.url = `${BASEURL}${url}`
		this.method = options.method || "GET"
		this.headers = options.headers || {}
		this.useCredentials = options.useCredentials || false
		this.responseType = options.responseType || "json"
		this.body = options.body || null

		this.xhr = new XMLHttpRequest()

		this.$onerror = function () {}
		this.$onload = function () {}
	}

	onload(callback){
		this.$onload = callback;
		return this;
	}

	call(){
		this.xhr.withCredentials = this.useCredentials

		this.xhr.open(this.method, this.url)
		this.xhr.responseType = this.responseType;

		this.xhr.setRequestHeader("Content-Type", "application/json")
		Object.keys(this.headers).forEach(
			key => {
				this.xhr.setRequestHeader(key, this.headers[key])
			}
		)

		this.xhr.onload = function () {
			this.$onload(this.xhr)
		}

		this.xhr.onerror = function () {
			this.$onerror(this.xhr)
		}

		if (this.body===null){
			this.xhr.send()
		}else{
			if (typeof this.body == 'object'){
				this.xhr.send(
					JSON.stringify(this.body)
				)
			}else{
				this.xhr.send(this.body)
			}
		}
		return this.xhr
	}
}
