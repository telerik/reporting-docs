---
title: How to modify table with preset styles and width dynamically
description: Change table columns count without changing table width
type: how-to
page_title: Preserve table styles and width after modifying its data source
slug: how-to-modify-table-with-preset-styles-and-width-dynamically
position: 
tags: 
ticketid: 
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td></td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Description
Sometimes you would like to change dynamically the Table Data Source, hence the count and names of the columns, without modifying entire Table width and using the preset Styles.

## Solution
The first step is to create a .trdp/x report definition containing all the necessary report items, including the Table.
Set the Width and the Styles (as StyleNames described in the StyleRules in the Report StyleSheets) of the Table. Leave only one column in the Table - we will use it to carry the Styles of the header and detail cells.
Use the following sample code to add DataSource and the necessary columns to the Table:

```csharp
SampleCodeForTheMainMethod()
{

	.....
	
	// The collection of column names to be assigned to the Table
    IList<string> columnNames = ListWithTheNamesOfTableColumns;

	// Deserialize the initial report definition (assuming it is a .trdx file which path/name is stored in the variable trdxFileName)
    Report report = DeserializeReport(trdxFileName);
	
	// Get the Detail Section
    var detailSection = (DetailSection)report.Items.FindItem(typeof(DetailSection));
	
	// Get the Table from the Detail Section (assuming it is placed there)
    var table = (Table)detailSection.Items.FindItem(typeof(Table));
	
	// Assign DataSource to the Table. The DataSource should have all the properties from the columNames above
    table.DataSource = myDataSource;

	//Add columns to the Table
    FormatTableBasedOnColumnNames(table, columnNames);

	// Save updated report as .trdx file under newTrdxFileName
    SerializeReport(report, newTrdxFileName);
	
	.....
	
}

private static void FormatTableBasedOnColumnNames(Table table, IList<string> columnNames)
{
    string tableHeaderStyleName = table.ColumnGroups[0].ReportItem.StyleName;
    string tableBodyStyleName = table.Items[0].StyleName;
    float columnnWidthValue = table.Width.Value / columnNames.Count();
    Telerik.Reporting.Drawing.Unit columnnWidth = new Telerik.Reporting.Drawing.Unit(columnnWidthValue, table.Width.Type);

    table.ColumnGroups.Clear();
    table.Body.Columns.Clear();
    for (int i = 0; i < columnNames.Count(); i++)
    {
        string columnName = columnNames[i];
        Telerik.Reporting.TableGroup tableGroup = new Telerik.Reporting.TableGroup();
        Telerik.Reporting.TextBox textBoxHeader = new Telerik.Reporting.TextBox();
        Telerik.Reporting.TextBox textBoxDetail = new Telerik.Reporting.TextBox();

        tableGroup.Name = $"newTableGroup{i}";
        tableGroup.ReportItem = textBoxHeader;
        table.ColumnGroups.Add(tableGroup);

        table.Body.Columns.Add(new Telerik.Reporting.TableBodyColumn(columnnWidth));
        table.Body.SetCellContent(0, i, textBoxDetail);

        // 
        // textBoxHeader
        // 
        textBoxHeader.Name = $"textBoxHeader{2 * i}";
        textBoxHeader.Size = new Telerik.Reporting.Drawing.SizeU(columnnWidth, Telerik.Reporting.Drawing.Unit.Inch(0.2395833283662796D));
        textBoxHeader.StyleName = tableHeaderStyleName;
        textBoxHeader.Value = columnName;
        // 
        // textBoxDetail
        // 
        textBoxDetail.Name = $"textBoxDetail{2 * i}";
        textBoxDetail.Size = new Telerik.Reporting.Drawing.SizeU(columnnWidth, Telerik.Reporting.Drawing.Unit.Inch(0.2395833283662796D));
        textBoxDetail.StyleName = tableBodyStyleName;
        textBoxDetail.Value = $"= Fields.{columnName}";
    }
}

private static Report DeserializeReport(string trdxFileName)
{
    System.Xml.XmlReaderSettings settings = new System.Xml.XmlReaderSettings();
    settings.IgnoreWhitespace = true;

    using (System.Xml.XmlReader xmlReader = System.Xml.XmlReader.Create(trdxFileName, settings))
    {
        Telerik.Reporting.XmlSerialization.ReportXmlSerializer xmlSerializer =
            new Telerik.Reporting.XmlSerialization.ReportXmlSerializer();

        Report report = (Report)
            xmlSerializer.Deserialize(xmlReader);

        return report;
    }
}

private static void SerializeReport(Report report, string reportName)
{
    using (System.Xml.XmlWriter xmlWriter = System.Xml.XmlWriter.Create(reportName))
    {
        Telerik.Reporting.XmlSerialization.ReportXmlSerializer xmlSerializer =
            new Telerik.Reporting.XmlSerialization.ReportXmlSerializer();

        
        xmlSerializer.Serialize(xmlWriter, report);
    }
}

```

The exported report definition should contain the desired Table with the necessary columns.