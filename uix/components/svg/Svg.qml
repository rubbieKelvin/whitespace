import QtQuick 2.5

Image {
	property int svgWidth: 24
	property int svgHeight: 24
	property list<SvgPath> paths
	property string viewbox: "0 0 24 24"
	property color fill: "#00000000"

	function get_source() {
		let res = `data:image/svg+xml;utf8, <svg width="${svgWidth}" height="${svgHeight}" viewbox="${viewbox}" fill="${fill}">`
		for (var i = 0; i < paths.length; i++) {
			res += paths[i].compile()
		}
		return res + "</svg>"
	}

	Component.onCompleted: redraw()

	function redraw() {
		source = get_source()
	}
}
