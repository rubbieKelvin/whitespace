import QtQuick 2.15
import QtQuick.Controls 2.12
import "../../components/svg/" as SvgLib

Rectangle {
	id: root
	color: "transparent"
	property alias subtitle: subtitle
	property alias title: title
	property alias svg: svg

	signal clicked

	Rectangle{
		id: overlay
		opacity: .15
		visible: false
		anchors.fill: parent
		color: "#333333"
	}

	SvgLib.SvgSource {
		id: svg
		x: 5
		width: visible ? 26 : 0
		height: visible ? 26 : 0
		anchors.verticalCenter: parent.verticalCenter
	}

	Column {
		height: 32
		anchors.verticalCenter: parent.verticalCenter
		anchors.left: svg.right
		anchors.right: parent.right
		anchors.rightMargin: 5
		anchors.leftMargin: 5
		spacing: 0

		Label {
			id: title
			text: qsTr("Label")
			color: "#fff"
			font.pixelSize: 12
			verticalAlignment: (subtitle.visible && subtitle.text.length > 0) ? Text.AlignBottom : Text.AlignVCenter
			width: parent.width
			height: (subtitle.visible && subtitle.text.length > 0) ? parent.height * .65 : parent.height
		}

		Label {
			id: subtitle
			color: "#fff"
			text: qsTr("sub Label")
			font.pixelSize: 10
			height: (visible && text.length > 0) ? parent.height * .35 : 0
		}
	}

	MouseArea {
		anchors.fill: parent
		cursorShape: Qt.PointingHandCursor
		hoverEnabled: true
		onClicked: root.clicked()
		onEntered: overlay.visible = true
		onExited: overlay.visible = false
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorColor:"#000000";height:60;width:300}
}
##^##*/

