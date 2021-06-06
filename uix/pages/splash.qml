import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.0
import "../lib/color.js" as ColorJS
import "../components/app/" as AppUtils
import "../components/form" as FormComponents

AppUtils.MobilePage {
	id: root
	clip: true
	name: "splash"
	background: Rectangle {
		color: "black"
	}
	on_backButtonPressed: null
	on_loaded: function () {
		statusbar.color = "black"
		statusbar.theme = Material.Dark
	}

	Image {
		anchors.verticalCenter: parent.verticalCenter
		source: "../images/whitespace-banner.svg"
		anchors.horizontalCenter: parent.horizontalCenter
	}

	Column {
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.bottom: parent.bottom
		padding: 30
		spacing: 20

		FormComponents.UiButton {
			width: parent.width - (parent.padding * 2)
			height: 60
			text: "Login to account"
			ui_radius: 12
			ui_stroke: 1
			ui_strokeColor: ColorJS.color(ColorJS.primary)
			ui_color: ColorJS.color(ColorJS.primary)

			onClicked: app_stack.push("./login.qml")
		}

		FormComponents.UiButton {
			width: parent.width - (parent.padding * 2)
			height: 60
			text: "Create an account"
			ui_elevation: 6
			ui_radius: 12
			ui_bgColor: ColorJS.color(ColorJS.primary)
			ui_elevationColor: ColorJS.color(ColorJS.primary, "66")

			onClicked: app_stack.push("./signup.qml")
		}
	}

	// TODO: remove this or set visible:false
	// use to test network ping
	Button {
		visible: false
		enabled: visible
		anchors.bottom: parent.bottom
		width: parent.width
		height: 100
		text: "Test ping : <status>"
		onClicked: {
			// new RestLib.Requests("http://192.168.43.153:8000/api/test/ping/", {}).onload(function (xhr) {
			// 	text = `Test ping : <${xhr.status}>`
			// }).onerror(function () {
			// 	text = `"Test ping : <${error}>"`
			// }).call()
		}
	}
}

/*##^##
Designer {
	D{i:0;formeditorZoom:0.5;height:850;width:400}
}
##^##*/

