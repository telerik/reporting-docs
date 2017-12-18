---
title: How to send the culture with an AJAX request from the client with an HTML5 Report Viewer to the server?
description: Send culture from HTML5 Report Viewer to the server using AJAX call
type: how-to
page_title: How to send the culture with an AJAX request from the client with an HTML5 Report Viewer to the server?
slug:
position:
tags: HTML5 Report Viewer, AJAX, Culture, REST Service
teampulseid:
ticketid: 1142220
pitsid:
res_type: kb

---

## Environment
<table>
 <tr>
  <td>Product</td>
  <td>Progress® Telerik® Reporting </td>
 </tr>
 <tr>
  <td>Operating System</td>
  <td>Windows 10 64bit</td>
 </tr>
 <tr>
  <td>Browser</td>
  <td></td>
 </tr>
 <tr>
  <td>Browser Version</td>
  <td></td>
 </tr>
 <tr>
  <td>.Net framework</td>
  <td>Version 4.6</td>
 </tr>
 <tr>
  <td>Visual Studio version</td>
  <td>Visual Studio 2015</td>
 </tr>
 <tr>
  <td>Preferred Language</td>
  <td>C Sharp</td>
 </tr>
 <tr>
  <td>Project Type</td>
  <td>Web Application</td>
 </tr>
 <tr>
  <td>Viewer</td>
  <td>HTML5 Viewer</td>
 </tr>
 <tr>
  <td>OS Language</td>
  <td>English (United Kingdom)</td>
 </tr>
 <tr>
  <td>Rendering Format</td>
  <td>HTML5 Viewer</td>
 </tr>
</table>


## Description
How to pass the desired culture through an AJAX call from the HTML5 Report Viewer (client) to the server

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

## Suggested Workarounds

## Notes

## See Also
