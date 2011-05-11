// ==UserScript==
// @name		Grid Helper
// @namespace	http://sixtwothree.org
// @description	Grid Helper adds a keyboard shortcut and grid image (located at ~/images/grid.png)
// @include		*
// @author		Grid Helper by Jason Garber (http://sixtwothree.org)
// ==/UserScript==

window.gridhelper = {
	isCtrl: false,
	
	init: function() {
		document.addEventListener( "keyup", function( e ) {
			if ( e.which == 17 ) {
				gridhelper.isCtrl = false;
			}
		}, true );
		
		document.addEventListener( "keydown", function( e ) {
			if ( e.which == 17 ) {
				gridhelper.isCtrl = true;
			}
			
			if ( gridhelper.isCtrl && e.which == 71 ) {
				if ( !document.getElementById( "__grid" ) ) {
					d = document.createElement( "div" );
					d.setAttribute( "id", "__grid" );
					d.setAttribute( "style", "background: url('http://" + window.location.hostname + "/images/grid.png') repeat-y 50% 0; height: " + document.height + "px; left: 0; position: absolute; top: 0; width: 100%; z-index: 16000000;" );

					document.body.appendChild( d );
				} else {
					document.body.removeChild( document.getElementById( "__grid" ) );
				}
			}
		}, true );
	}
};

window.gridhelper.init();