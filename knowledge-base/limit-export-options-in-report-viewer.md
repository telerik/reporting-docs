---
title: How to limit export options in the report viewer
description: How to show certain formats in report viewer's dropdown menu
type: how-to
page_title: Hide Export Formats in Report Viewer Dropdown
slug: limit-export-options-in-report-viewer
position: 
tags: reportviewer,configuration,export,formats
ticketid: 1453239
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
By default, the report viewer shows all the supported rendering extensions in its export dropdown. The available rendering extensions 
are listed in the [Rendering Extensions](../configuring-rendering-extensions) help article.

Sometimes, it is neccessary to limit export formats to certain formats only.

## Solution
In Telerik Reporting, device information settings are used to pass rendering parameters to a rendering extension. 
You can use the <Telerik.Reporting> configuration section to specify rendering parameters globally. Programmatically, 
you can use the [ReportProcessor.RenderReport() method](../overload-telerik-reporting-processing-reportprocessor-renderreport).

For Windows and WPF applications the configuration file is **app.config** and for ASP.NET applications – **web.config**. Both files are XML-based.
The example below shows an XML-based configuration file that hides the RTF rendering extension:

```xml
<?xml version="1.0" encoding="utf-8" ?>
<configuration>
  <!-- The configSectins element should be the first child element of configuration -->
  <configSections>
      <section
        name="Telerik.Reporting"
        type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting, Version=13.0.19.222, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
        allowLocation="true"
        allowDefinition="Everywhere"/>
  </configSections>
  <!-- Substitute Version=13.0.19.222 with the assembly version you are using -->
   <Telerik.Reporting>
    <extensions>
      <render>
        <extension name="RTF" visible="false">       
        </extension>
      </render>
    </extensions>
  </Telerik.Reporting>
</configuration>
```

.NET Core applications support a JSON-based file usually named **appSettings.json** for storing information about configurations. 
For .NET Core console applications both configuration types are supported, but appSettings.json has precedence over app.config. The 
example below shows an JSON-based configuration file that hides the RTF rendering extension:

```
 "telerikReporting": {
    "extensions": [
      {
        "name": "RTF",
        "visible": "false"
      }
    ]
  }
  ```

### See Also
[Configuring Telerik Reporting](../configuring-telerik-reporting)
