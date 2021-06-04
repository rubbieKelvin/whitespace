import QtQuick 2.5

QtObject {
	id: root
	property string d: ""
	property string fillRule: ""
	property string clipRule: ""
	property double strokeWidth: -1.0
	property color fill: "transparent"
	property color stroke: "transparent"
	property string strokeLinecap: ""
	property string strokeLinejoin: ""

	function compile() {
		let res = `<path d='${d}' fill='${fill}' stroke='${stroke}'`

		if (fillRule.trim() !== "")
			res += ` fill-rule="${fillRule}"`
		if (clipRule.trim() !== "")
			res += ` clip-rule="${clipRule}"`
		if (strokeWidth >= 0)
			res += ` stroke-width="${strokeWidth}"`
		if (strokeLinecap.trim() !== "")
			res += ` stroke-linecap="${strokeLinecap}"`
		if (strokeLinejoin.trim() !== "")
			res += ` stroke-linejoin="${strokeLinejoin}"`

		return `${res}/>`
	}
}
