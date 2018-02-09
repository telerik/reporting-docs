---
title: How to pass culture via AJAX call from the HTML5 Report Viewer
description: How to pass the desired culture through an AJAX call from the HTML5 Report Viewer client to the server
type: how-to
page_title: How to pass culture via AJAX call from the HTML5 Report Viewer
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
How to pass the desired culture through an AJAX call from the HTML5 Report Viewer client to the server

## Solution
The culture that is respected server side is taken from the *deviceInfo["CurrentCulture"]* property. If this property is not provided, the culture would be taken from the culture settings of the server. Currently, this property could be modified in the event [jQuery.ajaxPrefilter](http://api.jquery.com/jquery.ajaxprefilter/) that changes the options of the AJAX request before sending it. The culture is added only in the request for [creating the document](https://docs.telerik.com/reporting/telerik-reporting-rest-documents-api-request-document). The following code adds a handler for the *jQuery.ajaxPrefilter* event that sets the culture to the desired one. The *PlaceCultureStringHere* variable should be a string representing a valid culture.

```javascript
$.ajaxPrefilter(function (options, originalOptions, jqXHR) {
    var str = originalOptions.url;
    var documentsSuffix = "documents";
    var isDocumentsUrl = (str.indexOf(documentsSuffix) == str.length - documentsSuffix.length);

    if (isDocumentsUrl) {
        var d = JSON.parse(originalOptions.data);
        d.deviceInfo["CurrentCulture"] = PlaceCultureStringHere;
        options.data = JSON.stringify(d);
    }
});
```

The code should be placed in an HTML5 Report Viewer <script> tag.