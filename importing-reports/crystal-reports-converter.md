---
title: SAP Crystal Reports
page_title: Converting reports created with SAP Crystal Reports 
description: "Learn how to convert an existing report, created with the 'SAP Crystal Reports' reporting solution, into a 'Telerik Reporting' report definition."
slug: telerikreporting/designing-reports/converting-reports-from-other-reporting-solutions/crystal-reports-converter
tags: telerik, reporting, importing, reports, crystal, reports, converter
published: True
position: 1
previous_url: /crystal-reports-converter
---

# Converting SAP Crystal Reports


This article explains how to convert a report created with SAP Crystal Reports to Telerik Reporting report definition.

## Changes Information

The Telerik Crystal Reports Converter is built against Crystal Reports 13.0.20.2399. In case you need to convert a Crystal Reports definition that has version lower than 13.0.2000, please use Telerik Reporting R3 2019 or earlier and check this KB article for more details: [Converting reports from various versions of CrystalReports]({%slug converting-reports-from-various-versions-of-crystalreports%}).

![Image of the Report Converter tool showing a list of the available converters, a description of the currently selected converter, and a field for the source of the report definition to convert.](images/Designer/crystal-reports-converter.png)

## Conversion Process

The converter iterates through all the items in a Crystal Report (CR) instance and tries to map each report object to its corresponding item in Telerik Reporting. Unfortunately, the.NET model classes that represent the native Crystal Reports objects often do not expose all the properties of its underlying objects, which makes the complete conversion unattainable. The size, location and styling of each CR object are converted as close as possible to the original. The specific object properties are listed below:

* __Report structure__ - the header, footer and details report sections are converted to their exact equivalents in Telerik Reporting. The visibility and suppression of the sections is not converted. The group headers and footers are converted into group sections in Telerik Reporting.

* __Data connections__ – the supported connection types are OLEDB and ODBC. The converter creates a new SQLDataSource instance for each command created in Database Expert and sets its attributes like connection string, command text and parameters. If the data connection used in the source report does not have dedicated command or stored procedure, the converter will generate a *select * from {tableName}* statement for the SqlDataSource instance's CommandText property.

* __Report parameters__ – if the data command used in Crystal report has parameters, they will be converted as report parameters, regarding their type, visibility and default values.

* __Field objects__ – data-bound fields are converted to Telerik Reporting TextBox instances with their respective database field expressions, preserving the formatting.

* __Text objects__ – converted into Telerik Reporting TextBox instances with static text, preserving the formatting.

* __Summary fields__ – converted into Telerik Reporting TextBox instances. The converter recognizes and converts the following Crystal Reports summary expressions: *Sum, Count, Distinct Count, Minimum, Maximum, Average*.

* __Cross-Tab objects__ – the provided.NET model does not contain any properties that would allow to examine the Cross-Tab definition. The converted Telerik Reporting CrossTab item will have the same size and location, but default structure containing empty cells.

* __SubReport objects__ – the converter will create a Telerik Reporting SubReport item, preserving the size and location. The ReportSource property must be manually set.

* __Line and Box objects__ – converted to Telerik Reporting Shape items.

* __PictureBox objects__ – converted to Telerik Reporting PictureBox items. The converter will convert only PictureBox objects that obtain their image data from a database field.

* __Chart objects__ – converted to Telerik Reporting Graph items. Supported chart types are: column, pie, doughnut, line, area, scatter. The provided.NET model does not contain all the properties necessary to completely convert the chart item and default values are used instead. Such properties include stacked/clustered for column series and horizontal/vertical orientation of column charts.

* __Barcode__ – the default barcode implementation in Crystal Reports is achieved through text objects with specific barcode font that allows to create Code39-encoded barcodes. The converter generates Telerik Reporting Barcode items only for Crystal Reports text objects with font name that contains Code39 string.

* __Special fields__ - The converter recognizes and converts the following Crystal Reports special fields: *PrintDate, PrintTime, ModificationDate, ModificationTime, DataDate, DataTime, RecordNumber, PageNumber, TotalPageCount, Page N of M*.

## Configuring the Report Designer to Use the Converter

In order to load the Crystal Reports assemblies needed for the conversion, proper binding redirects need to be added to the configuration file of the report designer application. When using the Standalone Report Designer, this file is *Telerik.ReportDesigner.exe.config* , placed in the *\Report Designer* subfolder of the product installation category. When using the Visual Studio Report Designer, this file is *devenv.exe.config* , placed in the *\Common7\Ide* subfolder of Visual Studio installation directory. The binding redirects need to point to the version of Crystal Reports runtime installed on the machine.

The Crystal Reports assemblies are stored in machine’s GAC (Global Assembly Cache). The GAC folder for.NET Framework v.4.0 and later is *%windir%\Microsoft.NET\assembly* , and for earlier versions is *%windir%\assembly*. Search the GAC for assemblies named *CrystalDecisions.Shared.dll* or *CrystalDecisions.CrystalReports.Engine.dll*. The assembly version can be obtained either from the assembly subfolder name, or by using the [gacutil.exe](https://docs.microsoft.com/en-us/dotnet/framework/tools/gacutil-exe-gac-tool):
	
```
 C:\WINDOWS\system32>gacutil -l CrystalDecisions.Shared
 Microsoft (R).NET Global Assembly Cache Utility. Version 4.0.30319.0
 Copyright (c) Microsoft Corporation. All rights reserved.
 The Global Assembly Cache contains the following assemblies:
   CrystalDecisions.Shared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304, processorArchitecture=MSIL
```

The output from the *gacutil.exe* above shows that the current version of the installed Crystal Reports runtime assemblies is __13.0.3500.0__. Here is how the configuration file with added binding redirects will look like:

	
````xml
<runtime>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
...
        <dependentAssembly>
          <assemblyIdentity name="CrystalDecisions.CrystalReports.Engine" publicKeyToken="692fbea5521e1304" culture="neutral"/>   
          <bindingRedirect oldVersion="0.0.0.0-13.0.3500.0" newVersion="13.0.3500.0"/>
        </dependentAssembly>
        <dependentAssembly>
          <assemblyIdentity name="CrystalDecisions.Shared" publicKeyToken="692fbea5521e1304" culture="neutral"/>
          <bindingRedirect oldVersion="0.0.0.0-13.0.3500.0" newVersion="13.0.3500.0"/>
        </dependentAssembly>
        <dependentAssembly>
          <assemblyIdentity name="CrystalDecisions.ReportAppServer.DataDefModel" publicKeyToken="692fbea5521e1304" culture="neutral"/>
          <bindingRedirect oldVersion="0.0.0.0-13.0.3500.0" newVersion="13.0.3500.0"/>
        </dependentAssembly>
        <dependentAssembly>
          <assemblyIdentity name="CrystalDecisions.ReportAppServer.ReportDefModel" publicKeyToken="692fbea5521e1304" culture="neutral"/>
          <bindingRedirect oldVersion="0.0.0.0-13.0.3500.0" newVersion="13.0.3500.0"/>
        </dependentAssembly>
        <dependentAssembly>
          <assemblyIdentity name="CrystalDecisions.ReportAppServer.DataDefModel" publicKeyToken="692fbea5521e1304" culture="neutral"/>
          <bindingRedirect oldVersion="0.0.0.0-13.0.3500.0" newVersion="13.0.3500.0"/>
        </dependentAssembly>
        <dependentAssembly>
          <assemblyIdentity name="CrystalDecisions.ReportAppServer.ReportDefModel" publicKeyToken="692fbea5521e1304" culture="neutral"/>
          <bindingRedirect oldVersion="0.0.0.0-13.0.3500.0" newVersion="13.0.3500.0"/>
        </dependentAssembly>	    
...
    </assemblyBinding>
</runtime>
````

During the conversion process the engine outputs warnings and information messages for the converted items in the Summary page. After reviewing the messages, the produced report can be edited further to achieve the desired functionality.

## See Also

* [Crystal Reports Product Matrix](https://wiki.scn.sap.com/wiki/display/BOBJ/Crystal+Reports+v.+9.1+to+SAP+Crystal+Reports+2013%2C+Runtime+Distribution+and+Supported+Operating+Systems)
