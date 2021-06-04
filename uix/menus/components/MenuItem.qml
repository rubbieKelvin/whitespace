import QtQuick 2.15
import QtQuick.Controls 2.12
import "../../components/svg/" as SvgLib

Rectangle {
	id: root
	color: "transparent"
	property alias subtitle: subtitle
	property alias title: title
	property alias svg: svg

	SvgLib.SvgSource {
		id: svg
		x: 5
		width: visible ? 32 : 0
		height: visible ? 32 : 0
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
			verticalAlignment: Text.AlignBottom
			width: parent.width
			height: (subtitle.visible
					 && subtitle.text.length > 0) ? parent.height * .65 : parent.height
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
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorColor:"#000000";height:60;width:300}
}
##^##*/

