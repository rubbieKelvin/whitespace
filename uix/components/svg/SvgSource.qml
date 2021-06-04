import QtQuick 2.5

Image{
	property string svgsource: "<svg></svg>"
	source: "data:image/svg+xml;utf8, " + svgsource
}