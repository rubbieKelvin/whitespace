import QtQuick 2.12
import StatusBar 0.1
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12
import "./components/hardware/" as HWDummy

ApplicationWindow {
	id: window
	width: 400
	height: 720
	visible: true
	font.pixelSize: 14
	font.family: poppins.name
	flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint

	property bool drawer_opened: false

	Material.background: "black"
	Material.theme: Material.Light
	Material.accent: "#2F80ED"

	function toggle_drawer(forceclose) {
		forceclose = (forceclose === null
					  || forceclose === undefined) ? false : true

		function _open() {
			menu_anim_w.from = 0
			menu_anim_w.to = 60
			menu_anim_h.from = 100
			menu_anim_h.to = 60
			drawer_opened = true
			app_stack.enabled = false
			sidemenu_stack.enabled = true
			statusbar.color = "black"
			statusbar.theme = StatusBar.Dark
		}

		function _close() {
			menu_anim_w.to = 0
			menu_anim_w.from = a_s_value.x
			menu_anim_h.to = 100
			menu_anim_h.from = a_s_value.height
			drawer_opened = false
			app_stack.enabled = true
			sidemenu_stack.enabled = false
			statusbar.color = "white"
			statusbar.theme = StatusBar.Light
		}

		if (forceclose) {
			_close()
		} else {
			if (!drawer_opened)
				_open()
			else
				_close()
		}

		menu_anim_w.restart()
		menu_anim_h.restart()
	}

	StatusBar {
		id: statusbar
		color: "black"
	}

	FontLoader {
		id: poppins
		source: "./fonts/Poppins/Poppins-Regular.ttf"
	}

	MouseArea {
		anchors.fill: parent
		onClicked: toggle_drawer(true)
	}

	StackView {
		id: sidemenu_stack
		width: parent.width * .6
		height: parent.height
		initialItem: "./menus/main.qml"
		enabled: visible
		visible: drawer_opened
	}

	StackView {
		id: app_stack
		clip: true
		x: (a_s_value.x / 100) * window.width
		width: parent.width
		height: (a_s_value.height / 100) * window.height
		anchors.verticalCenter: parent.verticalCenter
		anchors.verticalCenterOffset: 0
		initialItem: "./pages/splash.qml"

		onCurrentItemChanged: {
			let m_page = currentItem
			backbutton.handler = m_page.on_backButtonPressed || null
			if (m_page.on_loaded !== undefined)
				m_page.on_loaded()
		}
	}

	//app stack values
	QtObject {
		id: a_s_value
		property int x: 0
		property int height: 100
	}

	NumberAnimation {
		id: menu_anim_w
		target: a_s_value
		property: "x"
		easing.type: Easing.InSine
		duration: 100
	}

	NumberAnimation {
		target: a_s_value
		id: menu_anim_h
		property: "height"
		duration: 100
		easing.type: Easing.InOutQuad
	}

	HWDummy.BackButtonDummy {
		id: backbutton
	}

	Connections {
		target: window
		function onClosing(event) {
			return backbutton.on_triggered(event)
		}
	}
}
