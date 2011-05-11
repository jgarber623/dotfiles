// ==UserScript==
// @name		Read Later
// @namespace	http://sixtwothree.org
// @description	Read Later adds a keyboard shortcut to Instapaper's "Read Later" bookmarklet.
// @include		*
// @author		Read Later by Jason Garber (http://sixtwothree.org) after Marco Arment (http://www.marco.org)
// ==/UserScript==

window.readlater = {
	isCtrl: false,
	
	init: function() {
		if ( typeof( window.iprl5 ) != "function" ) {
			window.iprl5 = function(){
				var d = document, z = d.createElement( "scr" + "ipt" ), b = d.body;

				try {
					if ( !b ) throw( 0 );
					
					d.title = "(Saving...) " + d.title;
					z.setAttribute( "src", "http://www.instapaper.com/j/38LxZc2Vkpre?u=" + encodeURIComponent( d.location.href ) + "&t=" + ( new Date().getTime() ) );
					b.appendChild( z );
				} catch( e ) {
					alert( "Please wait until the page has loaded." );
				}
			};
		}
		
		document.onkeyup = function( e ) {
			if ( e.which == 17 ) {
				readlater.isCtrl = false;
			}
		};

		document.onkeydown = function( e ) {
			if ( e.which == 17 ) {
				readlater.isCtrl = true;
			}
			
			if ( readlater.isCtrl && e.which == 80 ) {
				iprl5();
			}
		};
	}
};

window.readlater.init();