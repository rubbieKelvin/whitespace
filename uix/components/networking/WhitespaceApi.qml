import QtQuick 2.15
import "../../lib/restlib.js" as Rest

QtObject{
	id: root
	readonly property string baseurl: Rest.BASEURL
	readonly property User user: User{}

	function path(p){
		return `${baseurl}${p}`
	}
}
