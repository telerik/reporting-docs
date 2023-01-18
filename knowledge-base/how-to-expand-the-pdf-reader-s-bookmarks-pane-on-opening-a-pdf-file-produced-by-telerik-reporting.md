---
title: How to Expand the PDF Reader's Bookmarks pane on opening a PDF file produced by Telerik Reporting
description: How to Open the PDF Reader's Bookmarks pane when opening a PDF file created using Telerik Reporting.
type: how-to
page_title: How to Display the PDF Reader's Bookmarks pane wgen a PDF created with Telerik Reporting is opened
slug: how-to-expand-the-pdf-reader-s-bookmarks-pane-on-opening-a-pdf-file-produced-by-telerik-reporting
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Rendering Format</td>
		<td>PDF</td>
	</tr>
	<tr>
		<td>3rd Party Application</td>
		<td>Adobe Acrobat, Adobe Reader</td>
	</tr>
</table>

## Description
  
When you create Telerik Reports you can provide internal navigation in the report via [Document Map]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/document-map/overview%}). This interactivity feature is supported by Adobe PDF Readers and it can be controlled by adding Adobe JavaScript in the PDF produced by the Reporting engine.  
  
## Solution

- The Adobe JavaScript that is needed is as follows:

```js
app.execMenuItem('ShowHideBookmarks')
```

- To add it in the PDF file that will be produced by Telerik Reporting, you need to pass it through the [JavaScript device setting of the PDF rendering mechanism]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings%}).  
  
 This can be done by: 
- When you [export programmatically]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}) - pass the Adobe JavaScipt as a device info ([Set rendering parameters programmatically]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}#set-rendering-parameters-programmatically)):  


````C#
var deviceInfo = new System.Collections.Hashtable();
deviceInfo["JavaScript"] = "app.execMenuItem('ShowHideBookmarks')";
````
````VB
Dim deviceInfo As New System.Collections.Hashtable()
deviceInfo.Add("JavaScript",  "app.execMenuItem('ShowHideBookmarks')")
````

- When you export through a Report Viewer - [declare a Telerik Reporting section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}) in the application's configuration file and set the JavaScript parameter of the [PDF extension]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}):  
  
```xml
<configuration>
  <configSections>
    <section
        name="Telerik.Reporting"
        type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
        allowLocation="true"
        allowDefinition="Everywhere"/>
  </configSections>
  …
  <Telerik.Reporting>
    <extensions>
      <render>
        <extension name="PDF" >
          <parameters>
            <parameter name="JavaScript" value="app.execMenuItem('ShowHideBookmarks')"/>
          </parameters>
        </extension>
      </render>
    </extensions>
  </Telerik.Reporting>
  …
</configuration>
```

In the above code snippet, you need to replace **x.x.x.x** with your version of Telerik Reporting e.g. **15.1.21.512**.

## Notes

The configuration settings valid for your Telerik Reporting version can be checked in the local help resources (CHM file) of the corresponding version.
