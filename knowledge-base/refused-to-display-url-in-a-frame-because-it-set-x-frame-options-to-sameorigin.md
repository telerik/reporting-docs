---
title: Refused to display ‘http://localhost:12345/api/reports/clients/clientId/instances/instanceId/documents/documentId?response-content-disposition=inline’ in a frame because it set ‘X-Frame-Options’ to ‘sameorigin’.
description: This article elaborates on how the mentioned error could be resolved when clicking on the print button in Web-based viewer.
type: troubleshooting
page_title: Refused to display ‘http://localhost:12345/api/reports/clients/clientId/instances/instanceId/documents/documentId?response-content-disposition=inline’ in a frame because it set ‘X-Frame-Options’ to ‘sameorigin’.
slug: refused-to-display-url-in-a-frame-because-it-set-x-frame-options-to-sameorigin
position: 
tags: HTML5Viewer
ticketid: 1408494
res_type: kb
---

## Environment
<table>
    <tbody>
	    <tr>
	    	<td>Product</td>
	    	<td>Progress® Telerik® Reporting</td>
	    </tr>
	    <tr>
	    	<td>Project Type</td>
	    	<td>Web Application</td>
	    </tr>
	    <tr>
	    	<td>Report Viewer</td>
	    	<td>Web-based Viewers</td>
	    </tr>
    </tbody>
</table>


## Error Message
*Refused to display ‘http://localhost:12345/api/reports/clients/clientId/instances/instanceId/documents/documentId?response-content-disposition=inline’ in a frame because it set ‘X-Frame-Options’ to ‘sameorigin’.*

## Cause\Possible Cause(s)
The error indicates that either the application has set an X-Frame-Options header to SAMEORIGIN or Chrome browser did. This means that the application has disallowed loading of the resource in an iframe outside of its domain. For more information see The [X-Frame-Options response header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options) on MDN.

## Solution
There are two possible approaches that might fix the issue:

1. Change the [X-Frame-Option](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options) to **ALLOW FROM  &lt;address&gt;**;

2. Change the HTML5 Viewer's **printMode** option to download the PDF file with the additional settings (*telerikReportViewer.PrintModes.FORCE_PDF_FILE*) - [Printing Reports](../html5-report-viewer-direct-print).
