---
title: Passing Culture Via AJAX Call From HTML5 Report Viewer
description: "Learn how to pass the desired culture through an AJAX call from the HTML5 Report Viewer client to the server in Telerik Reporting."
type: how-to
page_title: Passing Culture from the HTML5 Report Viewer via AJAX call
slug: how-to-send-culture-from-client-to-service
position: 
tags: viewer,ajax,culture,rest
ticketid: 1142220
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>Web Application</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>HTML5 Viewer</td>
	</tr>
</table>


## Description

How to pass the desired culture through an AJAX call from the HTML5 Report Viewer client to the server.

## Solution

The culture that is respected server side is taken from the `deviceInfo["CurrentCulture"]` and `deviceInfo["CurrentUICulture"]` properties. If any of these properties are not provided, its value will be taken from the culture settings of the server. Currently, the properties could be modified in the event [jQuery.ajaxPrefilter](http://api.jquery.com/jquery.ajaxprefilter/) that changes the options of the AJAX request before sending it. The culture is added only in the request for [creating the document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/resolve-document%}). The following code adds a handler for the `jQuery.ajaxPrefilter` event that sets the culture to the desired one. The `PlaceCultureStringHere` variable should be a string representing a valid culture.

````JavaScript
<script>
	$.ajaxPrefilter(function (options, originalOptions, jqXHR) {
		var str = originalOptions.url;
		var documentsSuffix = "documents";
		var isDocumentsUrl = (str.indexOf(documentsSuffix) == str.length - documentsSuffix.length);

		if (isDocumentsUrl) {
			var d = JSON.parse(originalOptions.data);
			d.deviceInfo["CurrentCulture"] = PlaceCultureStringHere;
			d.deviceInfo["CurrentUICulture"] = PlaceCultureStringHere;
			options.data = JSON.stringify(d);
		}
	});
</script>
````

The code could be placed in HTML5 Report Viewer's page.
