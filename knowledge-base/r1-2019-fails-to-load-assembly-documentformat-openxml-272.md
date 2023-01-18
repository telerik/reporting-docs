---
title: Telerik Reporting R1 2019 fails to load assembly DocumentFormat.OpenXml 2.7.2+
description: Telerik Reporting R1 2019 does not resolve correctly the OpenXml assemblies when using DocumentFormat.OpenXml version 2.7.2 and higher with Telerik.Reporting.OpenXmlRendering.2.7.2
type: troubleshooting
page_title: Exporting to OpenXML formats does not work in R1 2019 when DocumentFormat.OpenXml 2.7.2 and higher is used
slug: r1-2019-fails-to-load-assembly-documentformat-openxml-272
position: 
tags: 
ticketid: 1383305
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>13.0.19.116</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
If DocumentFormat.OpenXML version 2.7.2 or higher is referenced in an application, the OpenXML rendering extensions are not available in the report viewers or an exception is thrown when a report is being programmatically exported to any OpenXML format.

**Note:** The issue is fixed in internal build **13.0.19.118**.

## Solution
Remove the current OpenXML references:
* DocumentFormat.OpenXml version 2.7.2 or higher
* Telerik.Reporting.OpenXmlRendering.2.7.2.dll

Add references to the following assemblies:
* DocumentFormat.OpenXml version prior to 2.7.2 (i.e. 2.0.5022.0 - 2.5.5631.0)
* Telerik.Reporting.OpenXmlRendering.dll

## See Also
* [Deploy Telerik Reporting with newer OpenXML SDK version](https://www.telerik.com/support/kb/reporting/details/deploy-telerik-reporting-with-newer-openxml-sdk-version)
* [Open XML SDK for Microsoft Office]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%})
