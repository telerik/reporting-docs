---
title: Html5 Report Viewer toolbar icons not rendered in IE browser
description: Html5 Viewer toolbar icons appear blank in IE browser when loaded from cache
type: troubleshooting
page_title: Html5 Viewer toolbar icon fonts are not loaded correctly from IE browser cache
slug: html5-viewer-toolbar-icons-not-shown-in-ie-browser
position: 
tags: 
ticketid: 1174780
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>12.1.18.620</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>HTML5 Viewer</td>
	</tr>
	<tr>
		<td>Browser Version</td>
		<td>IE11</td>
	</tr>
</table>


## Description
With some versions of Internet Explorer browser the Html5 Report Viewer Toolbar icons are missing.

## Error Message
CSS3117: @font-face failed cross-origin request. Resource access is restricted.

## Cause\Possible Cause(s)
The problem is related to caching - in some versions of IE (see _Notes_ section) when the fonts for the icons of the Toolbar are loaded from the browser cache an error with the message specified in _Error Message_ section is thrown (check the browser console in developers mode). When the cache is cleared and the fonts are loaded from the real resources the Toolbar is displayed correctly.  

## Suggested Workarounds
Upgrade the Internet Explorer browser. Check for an appropriate version under _Notes_ section.

## Notes
* IE version that did not experience the problem on our side :
    + 11.1155.15063.0.

* IE versions where the issue has been observed by us or our users :
    - 11.0.15063.0    
    - 11.2339.14393.0
