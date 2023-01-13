---
title: How to get the report definition of the processing report
description: How to obtain the final report definition when it is modified with code in a custom project
type: how-to
page_title: Get the final state of a programmatically changed report definition
slug: how-to-get-report-definition-of-processing-report
position: 
tags: 
ticketid: 1349662
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
When report definition is modified with code its final state is generally unknown. It is actually the report definition of the Processing Report. For debugging purposes it is helpful to know its layout after all modifications in the code. This KB explains how to get it.

## Solution
We may use the _ItemDataBound_ event of the Report to [serialize the report definition]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}#serialize-to-xml) and save it to a TRDX/XML file, or pack it into a TRDP file. Here is a sample code :
  

``` CSharp
private void Report1_ItemDataBound(object sender, EventArgs e)
{
    var procReport = (Telerik.Reporting.Processing.Report)sender;
    var definition = procReport.Report.ItemDefinition;
 
    string trdxFileName = "PathToSaveReportHere";
    SerializeReportDefinitionInTrdxFile(definition, trdxFileName);
}
 
private static void SerializeReportDefinitionInTrdxFile(ReportItemBase definition, string trdxFileName)
{
    using (System.Xml.XmlWriter xmlWriter = System.Xml.XmlWriter.Create(trdxFileName))
    {
        Telerik.Reporting.XmlSerialization.ReportXmlSerializer xmlSerializer = new Telerik.Reporting.XmlSerialization.ReportXmlSerializer();
 
        xmlSerializer.Serialize(xmlWriter, definition);
    }
}
```
The generated report definition can be opened with the Standalone Report Designer. It may be necessary to adjust the _ObjectDataSources_.
