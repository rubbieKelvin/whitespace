import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.0
import "../components/svg" as LibSvg
import "../lib/color.js" as ColorJS
import "../components/form" as FormComponents
import "../components/app" as AppUtils

AppUtils.MobilePage {
	name: "login"
	id: root
	clip: true
	background: Rectangle {
		color: "black"
	}

	function do_login() {
		app_stack.push("./home.qml")
	}

	on_backButtonPressed: function () {
		app_stack.pop()
	}

	on_loaded: function () {
		statusbar.color = "black"
		statusbar.theme = Material.Dark
	}

	Rectangle {
		color: "#ffffff"
		radius: 20
		anchors.fill: bottom_panel
		anchors.bottomMargin: -15
	}

	Column {
		id: bottom_panel
		y: 617
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.bottom: parent.bottom
		spacing: 20
		padding: 30
		anchors.leftMargin: 0
		anchors.rightMargin: 0
		anchors.bottomMargin: 0

		Column {
			id: column
			width: parent.width - (parent.padding * 2)
			spacing: 4

			Label {
				text: qsTr("email address")
			}

			FormComponents.TextInput {
				id: email_input
				anchors.left: parent.left
				anchors.right: parent.right
				anchors.rightMargin: 0
				anchors.leftMargin: 0
				topPadding: bottomPadding
				placeholderText: "Email address..."
				//left
				leftButton.flat: true
				leftButton.visible: true
				leftButton.height: 32
				leftButton.width: 32
				leftButton.icon.source: __0.source
				background: Rectangle {
					color: "white"
					border.width: 1
					border.color: parent.focus ? ColorJS.color(
													 ColorJS.primary) : "#CDCDCD"
					radius: 12
					anchors.fill: parent
				}

				LibSvg.Svg {
					id: __0
					visible: false
					fill: "#00000000"
					paths: [
						LibSvg.SvgPath {
							fillRule: "evenodd"
							clipRule: "evenodd"
							d: "M16.9394 3C18.2804 3 19.5704 3.53 20.5194 4.481C21.4694 5.43 22.0004 6.71 22.0004 8.05V15.95C22.0004 18.74 19.7304 21 16.9394 21H7.0604C4.2694 21 2.0004 18.74 2.0004 15.95V8.05C2.0004 5.26 4.2594 3 7.0604 3H16.9394ZM18.5304 9.54L18.6104 9.46C18.8494 9.17 18.8494 8.75 18.5994 8.46C18.4604 8.311 18.2694 8.22 18.0704 8.2C17.8604 8.189 17.6604 8.26 17.5094 8.4L13.0004 12C12.4204 12.481 11.5894 12.481 11.0004 12L6.5004 8.4C6.1894 8.17 5.7594 8.2 5.5004 8.47C5.2304 8.74 5.2004 9.17 5.4294 9.47L5.5604 9.6L10.1104 13.15C10.6704 13.59 11.3494 13.83 12.0604 13.83C12.7694 13.83 13.4604 13.59 14.0194 13.15L18.5304 9.54Z"
							fill: email_input.focus ? ColorJS.color(
														  ColorJS.primary) : "#CDCDCD"
						}
					]
				}

				onAccepted: password_input.focus = true
				onFocusChanged: __0.redraw()
			}
		}

		Column {
			id: column1
			width: parent.width - (parent.padding * 2)
			Label {
				text: qsTr("password")
			}

			FormComponents.TextInput {
				id: password_input
				anchors.left: parent.left
				anchors.right: parent.right
				leftButton.height: 32
				LibSvg.Svg {
					id: __1
					visible: false
					fill: "#00000000"
					paths: [
						LibSvg.SvgPath {
							fill: password_input.focus ? ColorJS.color(
															 ColorJS.primary) : "#CDCDCD"
							fillRule: "evenodd"
							clipRule: "evenodd"
							d: "M17.5227 7.39601V8.92935C19.2451 9.46696 20.5 11.0261 20.5 12.8884V17.8253C20.5 20.1308 18.5886 22 16.2322 22H7.7688C5.41136 22 3.5 20.1308 3.5 17.8253V12.8884C3.5 11.0261 4.75595 9.46696 6.47729 8.92935V7.39601C6.48745 4.41479 8.95667 2 11.9848 2C15.0535 2 17.5227 4.41479 17.5227 7.39601ZM12.0051 3.73904C14.0678 3.73904 15.7445 5.37871 15.7445 7.39601V8.7137H8.25553V7.37613C8.26569 5.36878 9.94232 3.73904 12.0051 3.73904ZM12.8891 16.4549C12.8891 16.9419 12.4928 17.3294 11.9949 17.3294C11.5072 17.3294 11.1109 16.9419 11.1109 16.4549V14.2488C11.1109 13.7718 11.5072 13.3843 11.9949 13.3843C12.4928 13.3843 12.8891 13.7718 12.8891 14.2488V16.4549Z"
						}
					]
				}
				background: Rectangle {
					color: "#ffffff"
					radius: 12
					border.color: parent.focus ? ColorJS.color(
													 ColorJS.primary) : "#CDCDCD"
					border.width: 1
					anchors.fill: parent
				}
				anchors.leftMargin: 0
				leftButton.width: 32
				leftButton.icon.source: __1.source
				leftButton.visible: true
				leftButton.flat: true
				placeholderText: "Password..."
				anchors.rightMargin: 0
				topPadding: bottomPadding

				onAccepted: do_login()
				onFocusChanged: __1.redraw()
			}
			spacing: 4
		}

		Column {
			width: parent.width - (parent.padding * 2)

			Label {
				text: "forgot Password?"
				color: ColorJS.color(ColorJS.primary)

				MouseArea {
					id: mouseArea1
					anchors.fill: parent
				}
			}

			Row {
				spacing: 6
				Label {
					text: "Dont have an account?"
				}

				Label {
					text: "signup instead"
					color: ColorJS.color(ColorJS.primary)

					MouseArea {
						id: mouseArea
						anchors.fill: parent
						onClicked: app_stack.push("./signup.qml")
					}
				}
			}
		}

		FormComponents.UiButton {
			width: parent.width - (parent.padding * 2)
			height: 60
			text: "Login"
			ui_elevation: 6
			ui_radius: 12
			ui_bgColor: ColorJS.color(ColorJS.primary)
			ui_elevationColor: ColorJS.color(ColorJS.primary, "66")
			onClicked: do_login()
		}
	}

	Item {
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.top: parent.top
		anchors.bottom: bottom_panel.top
		anchors.bottomMargin: 0

		Image {
			id: image
			y: 98
			anchors.verticalCenter: parent.verticalCenter
			source: "../images/whitespace-login-banner.svg"
			anchors.horizontalCenter: parent.horizontalCenter
			fillMode: Image.PreserveAspectFit
		}
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:0.75;height:806;width:414}D{i:10}D{i:3}
}
##^##*/

