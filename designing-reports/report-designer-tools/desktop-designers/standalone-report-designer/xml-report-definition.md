---
title: Declarative Report Definition
page_title: Declarative Report Definitions Explained
description: "Learn more about the Telerik Reporting Declarative Report Definition, the logic behind its schema and how you may identify it."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/xml-report-definition
tags: xml,report,definition,json
published: True
position: 4
previous_url: /upgrading-xml-report-definition-versioning, /faq-xml-support
reportingArea: General
---

# Declarative Report Definition Overview

The Standalone Report Designer supports:
* `trdx` and `trbp` file formats that contain report and report book definitions serialized in XML.
* `trdj` file format, which contains a report definition serialized in JSON. The format was introduced in [2026 Q3 (20.2.26.812)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q3-(20-2-26-812)).
* `trdp` file format, which contains a packed trdx or trdj report definition with images contained in separate files inside the zip archive.

For more information about XML and JSON report definitions, see [Serializing and Deserializing Report Definitions](slug:telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml) and [Packaging and Unpackaging Report Definitions](slug:telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition).

## Report Definition Versions

A report definition file specifies the Telerik Reporting XML namespace for the version of the report definition schema that is used by the Telerik Reporting XML serializer (Standalone Report Designer) to identify the XML content. The trdj (JSON) report definition uses the same schema version, stored under the `$schema` key at the root of the JSON document, instead of an XML namespace attribute.

## Upgrade Declarative Reports

The Standalone Report Designer can open report container files created for a previous namespace. If the report is changed and saved the upgraded report definition is converted and saved with the newer schema. This is the only way to upgrade an report definition but it's not required because the report viewers, the report server and the [ReportProcessor](/api/Telerik.Reporting.Processing.ReportProcessor) can handle all previous report definition versions. The report definition itself is not upgraded when uploaded on the Report Server.

The previous statements are valid only for reports authored in Standalone Report Designer. The compiled type reports authored in Visual Studio are upgraded with Upgrade Wizard. For more information, see [Upgrade Overview](slug:telerikreporting/upgrade/overview).

## Identifying the report definition schema version

The schema version is used by the Standalone Report Designer to identify supported report definitions. The Standalone Report Designer supports the current XML schema version at the time of the designer release and all previous ones.

1. Open the report definition:

	+ For trdx extension: use an application such as Notepad in which you can view the XML.
	+ For trdj extension: use an application such as Notepad in which you can view the JSON. The schema version is stored under the `$schema` key at the root of the document instead of an XML namespace.
	+ For trdp and trbp extensions:

		1. Make a backup of the report definition.
		1. Open the report definition with archiving program that supports zip.
		1. Right-click the report.
		1. Select __Open with...__ option.
		1. Choose a zip manager. For example, the free 7-Zip application.
		1. Use an application such as Notepad in which you can view the XML or JSON to open the __definition.xml__ or __definition.json__ file, depending on the format the definition was packaged with.

1. Check the xmlns attribute part of the Report element It should look like this: http://schemas.telerik.com/reporting/2017/3.1. The above xmlns attribute means that this definition is introduced in 2017 R3 SP1. For more information see [the following section](#xml-schema-versioning).

## XML Schema Versioning

The XML schema versioning prior to 2017 R3 is incremental. To check when specific XML schema version is introduced see the following table:

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
|http://schemas.telerik.com/reporting/2012/4.2|2017 R1|

From 2017 R3 on, the version numbering corresponds with the product release it was introduced in. The format is: `http://schemas.telerik.com/reporting/[year]/[release].[sp]`

For example, the version introduced in 2017 R3 will look as following: `http://schemas.telerik.com/reporting/2017/3.0`

## See Also

* [Package Report Definition](slug:telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition)
* [ReportPackager](/api/Telerik.Reporting.ReportPackager)
