.pragma library

const BASEURL = "http://192.168.43.153:8000/api"

// Restlib
class Request {
	constructor (url, options) {
		this.url = url
		this.method = options.method || "GET";
		this.headers = options.headers || {}
		this.useCredentials = options.useCredentials || false
		this.responseType = options.responseType || "json"
		this.body = options.body || null

		this.xhr = new XMLHttpRequest()

		this.$onerror = function () {}
		this.$onload = []
	}

	onload(callback){
		this.$onload.push(callback);
		return this;
	}

	onerror(callback){
		this.$onerror = callback;
		return this;
	}

	call(){
		const xhr = this.xhr;
		const self = this;

		xhr.withCredentials = this.useCredentials

		xhr.open(this.method, this.url)
		xhr.responseType = this.responseType;

		xhr.setRequestHeader("Content-Type", "application/json")
		Object.keys(this.headers).forEach(
			key => {
				xhr.setRequestHeader(key, this.headers[key])
			}
		)

		xhr.onload = function () {
			self.$onload.forEach(function(handler){
				handler(xhr);
			})
		}

		xhr.onerror = function () {
			self.$onerror(xhr)
		}

		if (this.body===null){
			xhr.send()
		}else{
			if (typeof this.body == 'object'){
				xhr.send(
					JSON.stringify(this.body)
				)
			}else{
				xhr.send(this.body)
			}
		}
		return xhr
	}
}
