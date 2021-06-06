import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.12
import "../components/svg/svg.js" as SvgJS
import "../components/images" as ImgLib
import "./components/" as Components
import "../components/app" as AppUtils
import "../components/form" as FormComponents
import "../lib/color.js" as ColorJS
import "../components/networking"

AppUtils.MobilePage {
	id: root
	clip: true
	name: "home"
	background: Rectangle {color: "white"}
	header: Rectangle {
		id: rectangle
		height: 60

		Button {
			id: menu_toggle_btn
			flat: true
			x: 20
			padding: 0
			width: 30
			icon.source: SvgJS.svg(
							 `<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M2 6C2 5.44772 2.44772 5 3 5H21C21.5523 5 22 5.44772 22 6C22 6.55228 21.5523 7 21 7H3C2.44772 7 2 6.55228 2 6Z" fill="black"/><path d="M2 12.0322C2 11.4799 2.44772 11.0322 3 11.0322H21C21.5523 11.0322 22 11.4799 22 12.0322C22 12.5845 21.5523 13.0322 21 13.0322H3C2.44772 13.0322 2 12.5845 2 12.0322Z" fill="black"/><path d="M3 17.0645C2.44772 17.0645 2 17.5122 2 18.0645C2 18.6167 2.44772 19.0645 3 19.0645H21C21.5523 19.0645 22 18.6167 22 18.0645C22 17.5122 21.5523 17.0645 21 17.0645H3Z" fill="black"/></svg>`)
			anchors.verticalCenter: parent.verticalCenter
			onClicked: window.toggle_drawer()
		}

		Label {
			text: {
				let first = toTitle(api.user.first_name)
				let last = toTitle(api.user.last_name)
				if (api.user.first_name || api.user.last_name) 
					return `${first} ${last}`
				return qsTr("Whitespace")
			}
			anchors.verticalCenter: parent.verticalCenter
			anchors.left: menu_toggle_btn.right
			font.pixelSize: 20
			anchors.leftMargin: 20

			function toTitle(string){
				return string[0].toUpperCase() + string.slice(1)
			}
		}

		ImgLib.RoundImage {
			source: "../images/v350joJG2Sk.png"
			anchors.rightMargin: 20
			fillMode: Image.PreserveAspectCrop
			width: 40
			height: 40
			radius: width / 2
			anchors.right: parent.right
			anchors.verticalCenter: parent.verticalCenter
		}
	}

	property WhitespaceApi api: whitespaceapi

	on_loaded: function () {
		statusbar.color = "white"
		statusbar.theme = Material.Light
	}
	on_backButtonPressed: function (event) {
		if (window.drawer_opened) {
			window.toggle_drawer(true)
		} else {
			event.accepted = true
		}
	}

	ListView {
		id: listView
		anchors.fill: parent
		anchors.rightMargin: 20
		anchors.topMargin: 10
		anchors.leftMargin: 20
		model: 20
		delegate: Components.SubSpaceListItem {
			height: 65
			width: (parent || {
						"width": 0
					}).width
		}
	}

	RoundButton {
		id: fab
		text: "+"
		anchors.right: parent.right
		anchors.bottom: parent.bottom
		radius: width / 2
		anchors.margins: 30
		width: 80
		height: 80
		font.pixelSize: 24
		Material.elevation: 0
		Material.background: "black"
		Material.foreground: "white"
		onClicked: create_or_join_menu.open()
	}

	Dialog {
		id: create_or_join_menu
		x: (parent.width - width) / 2
		y: (parent.height - height) / 2
		width: Math.min(parent.width, parent.height) * .6
		parent: Overlay.overlay
		Material.foreground: "black"
		Material.background: "white"

		Column {
			spacing: 10
			padding: 5
			width: parent.width

			Label {
				text: "Choose Action"
				font.pixelSize: 16
			}

			Column {
				spacing: 5
				width: parent.width - (parent.padding * 2)

				FormComponents.UiButton {
					text: "Create a space"
					width: parent.width
					ui_bgColor: "transparent"
					ui_stroke: 1
					ui_strokeColor: (down || hovered) ? ColorJS.color(ColorJS.primary) : "#888888"
					ui_radius: 5
					ui_color: ui_strokeColor
					ui_overlayColor: "#11000000"
					height: 55
				}

				FormComponents.UiButton {
					flat: true
					text: "Join a space"
					width: parent.width
					ui_bgColor: "transparent"
					ui_stroke: 1
					ui_strokeColor: (down || hovered) ? ColorJS.color(ColorJS.primary) : "#888888"
					ui_radius: 5
					height: 55
					ui_color: ui_strokeColor
					ui_overlayColor: "#11000000"
				}
			}
		}
	}
}
/*##^##
Designer {
	D{i:0;height:1000;width:400}
}
##^##*/

