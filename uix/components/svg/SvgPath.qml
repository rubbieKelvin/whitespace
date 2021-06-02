import QtQuick 2.5

QtObject{
	id: root
	property string d: ""
	property color fill: "transparent"
	property color stroke: "transparent"
	property string fillRule: ""
	property string clipRule: ""

	function compile(){
		let res = `<path d='${d}' fill='${fill}' stroke='${stroke}'`;
		if (fillRule!=="") res += ` fill-rule="${fillRule}"`;
		if (clipRule!=="") res += ` clip-rule="${clipRule}"`;
		return `${res}/>`;
	}
}
