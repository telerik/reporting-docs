---
title: XML Report Definition
page_title: XML Report Definition | for Telerik Reporting Documentation
description: XML Report Definition
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/xml-report-definition
tags: xml,report,definition
published: True
position: 4
---

# XML Report Definition



The Standalone Report Designer supports trdp, trbp, trdx file formats          that contain report and report book definitions serialized in XML.       

## XML Reports Versions

A report definition file specifies the Telerik Reporting XML namespace for the version of the report           definition schema that is used by the Telerik Reporting XML serializer (Standalone Report Designer)           to identify the XML content.         

## Upgrade XML Reports

The Standalone Report Designer can open report container files created for a previous namespace.           If the report is changed and saved the upgraded report definition is converted and saved with the newer schema.           This is the only way to upgrade an XML report definition but it's not required because           the report viewers, the report server and the             [ReportProcessor](/reporting/api/Telerik.Reporting.Processing.ReportProcessor)             can handle all previous XML report versions.           The report definition itself is not upgraded when uploaded on the Report Server.         

The previous statements are valid only for reports authored in Standalone Report Designer.           The compiled type reports authored in Visual Studio are upgraded with Upgrade Wizard. For more information,           see [Overview]({%slug telerikreporting/upgrade/overview%})

## Report Definition Containers

The report definitions can be in plain text format or compressed in a zip archive:         

* Telerik Report Definition XML (.trdx) is a plain text file with XML content.               It's easier to review the report definition with simple text editors but all               embedded resources like images are encoded with Base64 encoding and don't support localization.             

* Telerik Report Definition Package (.trdp) are compressed in a zip - XML report definition and its resources.               It's smaller in size, optimized for resources handling and supports [report localization]({%slug telerikreporting/designing-reports/localizing-reports%}).             

* Telerik Report Book Package (.trbp) is compressed in a zip archive report book XML definition.             

## How to: Identify the report definition schema version

The schema version is used by the Standalone Report Designer to identify supported report definitions.            The Standalone Report Designer supports the current XML schema version at the time of the designer            release and all previous ones.          

1. Open the report definition:

   + For trdx extension: use an application such as Notepad in which you can view the XML.                 

   + For trdp and trbp extensions:                 

   1. Make a backup of the report definition.                     

   1. Open the report definition with archiving program that supports zip.                     

   1. Right-click the report.                         

   1. Select __Open with...__  option.                         

   1. Choose a zip manager. For example, the free 7-Zip application.                         

   1. Use an application such as Notepad in which you can view the XML to open the __definition.xml__  file.                     

1. Check the xmlns attribute part of the Report element               It should look like this: http://schemas.telerik.com/reporting/2017/3.1.               The above xmlns attribute means that this definition is introduced in 2017 R3 SP1.               For more information see [the following section](#xml-schema-versioning)

## XML Schema Versioning

The XML schema versioning prior to 2017 R3 is incremental.           To check when specific XML schema version is introduced see the following table:         


| Schema | Introduced in release |
| ------ | ------ |
|v1|2012 Q1|
|http://schemas.telerik.com/reporting/2012/2|2012 Q2|
|http://schemas.telerik.com/reporting/2012/3|2013 Q1 (19 Feb 2013)|
|http://schemas.telerik.com/reporting/2012/3.1|2013 Q1 (18 Mar 2013)|
|http://schemas.telerik.com/reporting/2012/3.2|2013 Q1 (16 Apr 2013)|
|http://schemas.telerik.com/reporting/2012/3.3|2013 Q2|
|http://schemas.telerik.com/reporting/2012/3.4|2013 Q3|
|http://schemas.telerik.com/reporting/2012/3.5|2014 Q1|
|http://schemas.telerik.com/reporting/2012/3.6|2014 Q2|
|http://schemas.telerik.com/reporting/2012/3.7|2014 Q3|
|http://schemas.telerik.com/reporting/2012/3.8|2015 Q1|
|http://schemas.telerik.com/reporting/2012/3.9|2016 Q1|
|http://schemas.telerik.com/reporting/2012/4.0|2016 R2|
|http://schemas.telerik.com/reporting/2012/4.1|2016 R3|
|http://schemas.telerik.com/reporting/2012/4.2|2017 R|




From 2017 R3 on, the version numbering corresponds with the product release it was introduced in.           The format is:           http://schemas.telerik.com/reporting/[year]/[release].[sp]

For example, the version introduced in 2017 R3 will look as following: http://schemas.telerik.com/reporting/2017/3.0 

# See Also


 * [Package Report Definition]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}) * [ReportPackager](/reporting/api/Telerik.Reporting.ReportPackager) 
