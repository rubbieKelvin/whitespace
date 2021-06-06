import QtQuick 2.5
import QtQuick.Controls 2.5
import "../svg/" as LibSvg

TextField {
	id: root
	property alias rightButton: rightButton
	property alias leftButton: leftButton
	leftPadding: (leftButton.visible) ? leftButton.width : 0
	rightPadding: (rightButton.visible) ? rightButton.width : 0

	Button {
		id: leftButton
		flat: true
		height: parent.height
		visible: false
		anchors.verticalCenter: parent.verticalCenter
		padding: 0
		enabled: false
		opacity: enabled ? .7 : 1
	}

	Button {
		id: rightButton
		flat: true
		anchors.right: parent.right
		padding: 0
		anchors.rightMargin: 0
		height: parent.height
		visible: false
		anchors.verticalCenter: parent.verticalCenter
	}
}

/*##^##
Designer {
	D{i:0;width:300}
}
##^##*/

