import QtQuick 2.0
import QtQuick.Controls 2.12

QtObject {
	id: root
	property var handler: null

	function on_triggered(event) {
		if (handler === null) {
			console.log("quiting app..")
			event.accepted = true
		} else {
			event.accepted = false
			handler(event)
		}
	}
}
