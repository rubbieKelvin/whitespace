import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12

Button {
	id: root
	property color ui_bgColor: "#000000"
	property color ui_color: "#ffffff"
	property color ui_strokeColor: "transparent"
	property color ui_elevationColor: "#bdbdbd"
	property int ui_elevation: 0
	property int ui_stroke: 0
	property int ui_radius: 0

	background: Rectangle {
		color: ui_bgColor
		width: parent.width
		height: parent.height
		radius: ui_radius
		border.width: ui_stroke
		border.color: ui_strokeColor
		opacity: root.enabled ? 1 : .4
		layer.enabled: ui_elevation > 0
		layer.effect: DropShadow {
			transparentBorder: true
			horizontalOffset: 0
			verticalOffset: ui_elevation
			radius: 25
			samples: 15
			color: ui_elevationColor
		}

		Rectangle {
			color: "#44ffffff"
			anchors.fill: parent
			visible: root.hovered || root.down
			radius: parent.radius
		}
	}

	contentItem: Label {
		text: root.text
		anchors.fill: parent
		font: root.font
		opacity: root.enabled ? 1 : .4
		color: ui_color
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
	}
}

/*##^##
Designer {
	D{i:0;height:44;width:16}
}
##^##*/

