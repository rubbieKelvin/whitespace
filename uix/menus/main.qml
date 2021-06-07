import QtQuick 2.12
import QtQuick.Controls 2.5
import "../components/svg/svg.js" as SvgJS
import "./components" as Components
import "../components/networking"

Page {
	id: root
	background: Rectangle {
		color: "transparent"
	}

	signal menuAction (string action)
	property WhitespaceApi api: whitespaceapi

	Row {
		id: row
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.rightMargin: 10
		anchors.leftMargin: 10

		Image {
			source: SvgJS.svg('<svg width="73" height="73" viewBox="0 0 73 73" fill="none" xmlns="http://www.w3.org/2000/svg"><g filter="url(#filter0_d)"><rect x="14" y="14" width="45" height="45" rx="12" fill="white"/><g clip-path="url(#clip0)"><path fill-rule="evenodd" clip-rule="evenodd" d="M36.2751 51.8V36.275H20.7501V36.2207C20.75 36.2388 20.75 36.2569 20.75 36.275C20.75 44.8493 27.7008 51.8 36.275 51.8H36.2751Z" fill="#E2E2E2"/><path fill-rule="evenodd" clip-rule="evenodd" d="M36.2749 51.8V36.275H51.7999V36.2207C51.8 36.2388 51.8 36.2569 51.8 36.275C51.8 44.8493 44.8492 51.8 36.275 51.8H36.2749Z" fill="#D5D5D5"/><path d="M51.8 20.75H36.275V36.275H51.8V20.75Z" fill="#C5C5C5"/><path d="M27.995 29.03L36.275 20.75V36.275H20.75L27.995 29.03Z" fill="#A0A0A0"/><path d="M23.855 26.96C25.5698 26.96 26.96 25.5699 26.96 23.855C26.96 22.1402 25.5698 20.75 23.855 20.75C22.1401 20.75 20.75 22.1402 20.75 23.855C20.75 25.5699 22.1401 26.96 23.855 26.96Z" fill="#2F80ED"/></g></g><defs><filter id="filter0_d" x="0" y="0" width="73" height="73" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"/><feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/><feMorphology radius="1" operator="dilate" in="SourceAlpha" result="effect1_dropShadow"/><feOffset/><feGaussianBlur stdDeviation="6.5"/><feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/><feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow"/><feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape"/></filter><clipPath id="clip0"><rect width="31.05" height="31.05" fill="white" transform="translate(20.75 20.75)"/></clipPath></defs></svg>')
		}

		Label {
			id: label
			color: "#ddffffff"
			text: qsTr("Whitespace")
			anchors.verticalCenter: parent.verticalCenter
			font.pixelSize: 16
		}
	}

	ListView {
		id: listView
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.top: row.bottom
		anchors.bottom: parent.bottom
		anchors.margins: 14
		spacing: 5
		model: ListModel{

			ListElement{
				text: "Profile"
				description: ""
				icon: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M11.9848 15.3462C8.11716 15.3462 4.8143 15.931 4.8143 18.2729C4.8143 20.6148 8.0962 21.2205 11.9848 21.2205C15.8524 21.2205 19.1543 20.6348 19.1543 18.2938C19.1543 15.9529 15.8733 15.3462 11.9848 15.3462Z" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path fill-rule="evenodd" clip-rule="evenodd" d="M11.9848 12.0059C14.5229 12.0059 16.58 9.94779 16.58 7.40969C16.58 4.8716 14.5229 2.81445 11.9848 2.81445C9.44667 2.81445 7.38858 4.8716 7.38858 7.40969C7.38001 9.93922 9.42382 11.9973 11.9524 12.0059H11.9848Z" stroke="white" stroke-width="1.42857" stroke-linecap="round" stroke-linejoin="round"/></svg>'
			}

			ListElement{
				text: "Settings"
				description: ""
				icon: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M10.3302 16.5929H4.02945" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M13.1405 6.90036H19.4412" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path fill-rule="evenodd" clip-rule="evenodd" d="M8.72629 6.84625C8.72629 5.5506 7.66813 4.5 6.36314 4.5C5.05816 4.5 4 5.5506 4 6.84625C4 8.14191 5.05816 9.19251 6.36314 9.19251C7.66813 9.19251 8.72629 8.14191 8.72629 6.84625Z" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path fill-rule="evenodd" clip-rule="evenodd" d="M20 16.5538C20 15.2581 18.9427 14.2075 17.6377 14.2075C16.3319 14.2075 15.2737 15.2581 15.2737 16.5538C15.2737 17.8494 16.3319 18.9 17.6377 18.9C18.9427 18.9 20 17.8494 20 16.5538Z" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>'
			}

			ListElement{
				text: "Logout"
				description: ""
				icon: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M15.016 7.38948V6.45648C15.016 4.42148 13.366 2.77148 11.331 2.77148H6.45597C4.42197 2.77148 2.77197 4.42148 2.77197 6.45648V17.5865C2.77197 19.6215 4.42197 21.2715 6.45597 21.2715H11.341C13.37 21.2715 15.016 19.6265 15.016 17.5975V16.6545" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M21.8095 12.0214H9.76849" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M18.8812 9.10626L21.8092 12.0213L18.8812 14.9373" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>'
			}
		}

		delegate: Components.MenuItem {
			width: parent.width
			height: 55
			title.text: text
			subtitle.text: description
			svg.svgsource: icon

			onClicked: {
				menuAction(text.toLowerCase())
				window.toggle_drawer(true)
			}
		}
	}

	onMenuAction: {
		if (action=="logout"){
			console.debug("logging out")
			api.user.logout()
		}
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorColor:"#000000";height:650;width:300}D{i:5}
}
##^##*/

