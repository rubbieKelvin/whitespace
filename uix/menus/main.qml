import QtQuick 2.15
import QtQuick.Controls 2.5
import "../components/svg/svg.js" as SvgJS
import "./components" as Components

Page {
	id: root
	background: Rectangle {
		color: "transparent"
	}

	Row {
		id: row
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.rightMargin: 10
		anchors.leftMargin: 10

		Image {
			source: SvgJS.svg(
						'<svg width="73" height="73" viewBox="0 0 73 73" fill="none" xmlns="http://www.w3.org/2000/svg"><g filter="url(#filter0_d)"><rect x="14" y="14" width="45" height="45" rx="12" fill="white"/><g clip-path="url(#clip0)"><path fill-rule="evenodd" clip-rule="evenodd" d="M36.2751 51.8V36.275H20.7501V36.2207C20.75 36.2388 20.75 36.2569 20.75 36.275C20.75 44.8493 27.7008 51.8 36.275 51.8H36.2751Z" fill="#E2E2E2"/><path fill-rule="evenodd" clip-rule="evenodd" d="M36.2749 51.8V36.275H51.7999V36.2207C51.8 36.2388 51.8 36.2569 51.8 36.275C51.8 44.8493 44.8492 51.8 36.275 51.8H36.2749Z" fill="#D5D5D5"/><path d="M51.8 20.75H36.275V36.275H51.8V20.75Z" fill="#C5C5C5"/><path d="M27.995 29.03L36.275 20.75V36.275H20.75L27.995 29.03Z" fill="#A0A0A0"/><path d="M23.855 26.96C25.5698 26.96 26.96 25.5699 26.96 23.855C26.96 22.1402 25.5698 20.75 23.855 20.75C22.1401 20.75 20.75 22.1402 20.75 23.855C20.75 25.5699 22.1401 26.96 23.855 26.96Z" fill="#2F80ED"/></g></g><defs><filter id="filter0_d" x="0" y="0" width="73" height="73" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"/><feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/><feMorphology radius="1" operator="dilate" in="SourceAlpha" result="effect1_dropShadow"/><feOffset/><feGaussianBlur stdDeviation="6.5"/><feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/><feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow"/><feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape"/></filter><clipPath id="clip0"><rect width="31.05" height="31.05" fill="white" transform="translate(20.75 20.75)"/></clipPath></defs></svg>')
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
		model: 6
		spacing: 5
		delegate: Components.MenuItem {
			width: parent.width
			height: 55
			svg.svgsource: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M16 13H14C14 14.1046 13.1046 15 12 15C10.8954 15 10 14.1046 10 13H8C8 15.2091 9.79086 17 12 17C14.2091 17 16 15.2091 16 13Z" fill="white"/><path d="M10 10C10 10.5523 9.55228 11 9 11C8.44772 11 8 10.5523 8 10C8 9.44771 8.44772 9 9 9C9.55228 9 10 9.44771 10 10Z" fill="white"/><path d="M15 11C15.5523 11 16 10.5523 16 10C16 9.44771 15.5523 9 15 9C14.4477 9 14 9.44771 14 10C14 10.5523 14.4477 11 15 11Z" fill="white"/><path fill-rule="evenodd" clip-rule="evenodd" d="M22 12C22 17.5228 17.5228 22 12 22C6.47715 22 2 17.5228 2 12C2 6.47715 6.47715 2 12 2C17.5228 2 22 6.47715 22 12ZM20 12C20 16.4183 16.4183 20 12 20C7.58172 20 4 16.4183 4 12C4 7.58172 7.58172 4 12 4C16.4183 4 20 7.58172 20 12Z" fill="white"/></svg>'
		}
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorColor:"#000000";height:650;width:300}D{i:5}
}
##^##*/

