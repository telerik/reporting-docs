---
title: The report cannot be opened in the Standalone Report Designer
description: The report cannot be opened in the Standalone Report Designer
type: troubleshooting
page_title: The report cannot be opened in the Standalone Report Designer
slug: report-cannot-be-opened-in-standalone-report-designer
position: 
tags: vs designer
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
When you try to open the report, it throws the following error: 
```XML
Telerik.Reporting.Xml.XmlSerializerExcepion: An error has occurred during xml serialization. The xml serializer cannot resolve type with name: Report. 
```

## Solution
You may be trying to open a report that is created with a later [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) version. Each Telerik Reporting installation provides its own Standalone Report Designer application that is installed by default under __[InstallDir]/Report Designer__ directory. The reports that are created in XML format are marked with a specific data schema and are saved with a .TRDP or .TRDX extension. 
You need to find the data schema (XML version) that is used for your Telerik Reporting version and replace the current schema in the report you are trying to open. All versions are available in the [Upgrade]({% slug telerikreporting/upgrade/overview %}) articles. 

## See Also
[How to: Identify the report definition schema version]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/xml-report-definition%}#how-to-identify-the-report-definition-schema-version)  

[XML Schema Versioning]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/xml-report-definition%}#xml-schema-versioning)
