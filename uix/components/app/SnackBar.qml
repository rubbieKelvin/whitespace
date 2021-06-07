import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.12
import "../../lib/color.js" as ColorJS

Pane {
	id: root
	visible: opacity !== 0
	padding: 8
	opacity: 0
	anchors.bottomMargin: 20
	anchors.leftMargin: 20
	anchors.rightMargin: 20
	Material.theme: Material.Dark
	Material.foreground: "#ffffff"
	Material.accent: ColorJS.color(ColorJS.primary)
	Material.elevation: 6

	property alias label: label
	property alias button: button
	property var clickHandler: function () {}

	Row {
		id: row
		anchors.fill: parent

		Label {
			id: label
			text: "This is a snack bar"
			verticalAlignment: Text.AlignVCenter
			width: (button.visible) ? parent.width * .75 : parent.width
			height: parent.height
		}

		Button {
			id: button
			enabled: visible
			flat: true
			text: "Click"
			width: visible ? parent.width - label.width : 0
			height: parent.height
			Material.foreground: ColorJS.color(ColorJS.primary)
			onClicked: clickHandler()
		}
	}

	function show(text, buttonText, buttonAction) {
		label.text = text || ''
		button.text = buttonText || ''
		button.visible = !!buttonText
		clickHandler = buttonAction || function () {
			root.hide()
		}
		anim.from = root.opacity
		anim.to = 1
		timer.restart()
		p_anim.restart()
		anim.restart()
	}

	function hide() {
		anim.from = root.opacity
		anim.to = 0
		timer.stop()
		p_anim.stop()
		anim.restart()
	}

	Timer {
		id: timer
		interval: 3000
		onTriggered: root.hide()
	}

	ProgressBar {
		id: progressBar
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.bottom: parent.bottom
		value: 0
		from: 0
		to: 100
		anchors.margins: -root.padding
	}

	NumberAnimation {
		id: anim
		target: root
		property: "opacity"
		duration: 200
	}

	NumberAnimation {
		id: p_anim
		target: progressBar
		property: "value"
		duration: timer.interval
		easing.type: Easing.InOutQuad
		from: 0
		to: 100
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:2;height:50;width:300}
}
##^##*/

