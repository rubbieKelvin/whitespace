import QtQuick 2.5
import "../../components/images" as ImgLib
import QtQuick.Controls 2.5

Rectangle {
	id: rectangle
	height: 60

	ImgLib.RoundImage {
		id: image
		y: 8
		width: 44
		height: 44
		radius: width / 2
		anchors.left: parent.left
		source: "../../images/v350joJG2Sk.png"
		anchors.leftMargin: 10
		fillMode: Image.PreserveAspectCrop
	}

	Column {
		id: column
		y: 8
		height: 44
		anchors.left: image.right
		anchors.right: parent.right
		anchors.rightMargin: 10
		anchors.leftMargin: 10

		Label {
			id: label
			height: parent.height * .6
			text: qsTr("Classname")
			font.pixelSize: 14
			verticalAlignment: Text.AlignVCenter
		}

		Label {
			id: label1
			text: qsTr("class description")
			font.pixelSize: 10
		}
	}
}



