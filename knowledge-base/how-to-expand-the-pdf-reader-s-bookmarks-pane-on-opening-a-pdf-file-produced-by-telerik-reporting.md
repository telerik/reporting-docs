---
title: How to Expand the PDF Reader's Bookmarks pane on opening a PDF file produced by Telerik Reporting
description: How to Expand the PDF Reader's Bookmarks pane on opening a PDF file produced by Telerik Reporting.
type: how-to
page_title: How to Expand the PDF Reader's Bookmarks pane on opening a PDF file produced by Telerik Reporting
slug: how-to-expand-the-pdf-reader-s-bookmarks-pane-on-opening-a-pdf-file-produced-by-telerik-reporting
res_type: kb
---

## Description
  
When you create Telerik Reports you can provide internal navigation in the report via [Document Map](../designing-reports-document-map). This interactivity feature is supported by Adobe PDF Readers and it can be controlled by adding Adobe JavaScript in the PDF produced by the Reporting engine.  
  
## Solution

The Adobe JavaScript you need is as follows:

```js
app.execMenuItem('ShowHideBookmarks')
```

To add it in the PDF file that will be produced by Telerik Reporting, you need to pass it through the [JavaScript device setting of the PDF rendering mechanism](../device-information-settings-pdf).  
  
 This can be done by: 
- When you [export programmatically](../programmatic-exporting-report) - pass the Adobe JavaScipt as a device info ([Set rendering parameters programmatically](../configuring-telerik-reporting-extensions#set-rendering-parameters-programmatically)):  


````C#
var deviceInfo = new System.Collections.Hashtable();
deviceInfo["JavaScript"] = "app.execMenuItem('ShowHideBookmarks')";
````
````VB
Dim deviceInfo As New System.Collections.Hashtable()
deviceInfo.Add("JavaScript",  "app.execMenuItem('ShowHideBookmarks')")
````

- When you export through a Report Viewer - [declare a Telerik Reporting section](../configuring-telerik-reporting) in the application's configuration file and set the JavaScript parameter of the [PDF extension](../configuring-telerik-reporting-extensions):  
  
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

The configuration settings valid for your Telerik Reporting version can be checked in the local help resources (CHM file) of the corresponding version.
