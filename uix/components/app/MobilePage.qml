import QtQuick 2.15
import QtQuick.Controls 2.12

Page {
	required property string name
	required property var on_backButtonPressed
	required property var on_loaded
	title: name
}
