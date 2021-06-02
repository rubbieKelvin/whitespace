import QtQuick 2.5
import QtQuick.Controls 2.5

ApplicationWindow {
	id: window
	width: 320
	height: 680
	visible: true
	font.pixelSize: 14
	font.family: poppins.name

	FontLoader{
		id: poppins
		source: "./fonts/Poppins/Poppins-Regular.ttf"
	}

	StackView {
		id: app_stack
		initialItem: "./pages/login.qml"
		anchors.fill: parent
	}
}
