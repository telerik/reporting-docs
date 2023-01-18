---
title: Print functionality in the HTML5 report viewer is not working with PDF/A compliance level
description: Html5 viewer printing functionality throws "The used Compliance Level is not supported with immediate print" when PDF compliance level is not the default (None)
type: troubleshooting
page_title: Printing from Html5 Viewer fails with an exception due to PDF/A compliance
slug: html5-viewer-print-fails-due-to-pdfa-compliance-level
position: 
tags: 
ticketid: 1381450
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>HTML5</td>
	</tr>
</table>


## Description
The printing functionality of the Html5 Report Viewer uses PDF with injected custom JavaScript to force the Print dialog of the browser PDF plug-in to pop up - [Printing Reports]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports%}).  
PDF/A standards do \*not\* support JavaScript in the PDF document (check for example [PDF/A Wikipedia article](https://en.wikipedia.org/wiki/PDF/A)). Therefore, an error would be thrown when PDF rendering extension compliance level is different from the default (_None_).

## Error Message
{"message":"","exceptionMessage":"The used Compliance Level is not supported with immediate print. The immediate print requires script inclusion.","exceptionType":"Telerik.Reporting.Services.Engine.DocumentRenderException"...}

## Solution
The avoid the problem it is necessary to configure a second entry for PDF/A rendering using the approach explained in the [Configuring Multiple Entries for a Rendering Extension]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}#configuring-multiple-entries-for-a-rendering-extension) article section.  
  
The following configuration code will introduce a new Export entry (_PdfExport_ that will appear as 'PDF/A' under Viewer Toolbar -\> Export), and will hide the original PDF export option. The latter is used for Printing and its compliance level should be kept to _None_ (the default value) to allow JavaScript.   
  
```xml
<extensions>
  <render>
    <extension name="PdfExport"
               type="Telerik.Reporting.ImageRendering.PdfReport, Telerik.Reporting, Version=12.2.18.1129, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
               description="PDF/A">
      <parameters>
        <parameter name="ComplianceLevel" value="PDF/A-3b"></parameter>
      </parameters>
    </extension>
    <extension name="PDF" visible="false"></extension>
      ....
  </render>
</extensions>
```
