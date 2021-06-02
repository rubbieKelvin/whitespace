import QtQuick 2.5

Image{
	property int svgWidth: 24
	property int svgHeight: 24
	property list<SvgPath> paths
	property string viewbox: "0 0 24 24"
	property color fill: "#00000000"
	
	source: {
		let res = `data:image/svg+xml;utf8, <svg width="${svgWidth}" height="${svgHeight}" viewbox="${viewbox}" fill="${fill}">`;
		for (let i=0; i<paths.length; i++){
			res += paths[i].compile();
		}
		return res + "</svg>"
	}
}

// <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
// <path d="M10 10.0367L8.00002 10.0367L8 16.0367L14 16.0367L14 14.0367L11.4143 14.0366L16.7438 8.7071L15.3296 7.29289L10 12.6224L10 10.0367Z" fill="black"/>
// <path fill-rule="evenodd" clip-rule="evenodd" d="M23 12C23 18.0751 18.0751 23 12 23C5.92487 23 1 18.0751 1 12C1 5.92487 5.92487 1 12 1C18.0751 1 23 5.92487 23 12ZM21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12Z" fill="black"/>
// </svg>