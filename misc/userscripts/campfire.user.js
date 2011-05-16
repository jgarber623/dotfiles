// ==UserScript==
// @name           Campfire
// @namespace      http://sixtwothree.org
// @description    CSS enhancements to my Campfire Fluid app
// @include        *.campfirenow.com*
// @author         Campfire by Jason Garber (http://sixtwothree.org)
// ==/UserScript==

var h = document.getElementsByTagName( "head" )[0],
	s = document.createElement( "style" ),
	css = "";

// css += ".enter_message span, .leave_message span, .kick_message span { opacity: 0.5; }";
css += "table.chat tr.leave_message td, table.chat tr.enter_message td, table.chat tr.kick_message td { background-color: rgba( 217, 231, 251, 0.5 ); color: rgba( 51, 51, 51, 0.5 ); }";
css += "#SidebarTop, .system_message, #guest_access, #conference, #corner_logo { display: none; }";
css += ".Left .col, .Full .col, .Left .bottom, .Full .bottom { background-image: none; }";

s.innerHTML = css;
h.appendChild( s );