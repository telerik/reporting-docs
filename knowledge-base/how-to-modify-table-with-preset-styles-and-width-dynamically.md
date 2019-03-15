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
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Description
Sometimes you would like to change dynamically Table *DataSource*, hence the count and names of the *Columns*, but keep the Table *Width* and *Styles*.

## Solution
The suggested approach is to use an initial report definition containing just the outlines of the Table (and all other report items not related to the Table), to add dynamically the needed columns to the Table, and to save the modified report definition.

Step by step instructions follow:

1. Create in the Standalone report designer a **.TRDX** report definition containing all the necessary report items, including the Table. For example use the code of the sample deserialized *BlankReport* report below (save it as *.trdx* file). The report definition contains Style Rules that could be chosen when creating Table with the report designer *Table Wizard*:

  ```xml
  <?xml version="1.0" encoding="utf-8"?>
  <Report Width="4.39999993642171in" Name="BlankReport" xmlns="http://schemas.telerik.com/reporting/2017/3.0">
    <Items>
      <PageHeaderSection Height="0.5in" Name="pageHeaderSection1">
        <Style BackgroundColor="128, 255, 128" />
        <Items>
          <TextBox Width="3.50000071525574in" Height="0.19999997317791in" Left="0.449999650319417in" Top="0.150000015894572in" Value="PAGE HEADER" Name="textBox4">
            <Style TextAlign="Center" VerticalAlign="Middle" />
          </TextBox>
        </Items>
      </PageHeaderSection>
      <DetailSection Height="1.19999995827675in" Name="detail">
        <Style BackgroundColor="128, 255, 255" />
        <Items>
          <Table Width="4.39992141723633in" Height="0.400000005960464in" Left="0.00003941853841146in" Top="0.399999936421712in" Name="table1" StyleName="Civic.TableNormal">
            <Body>
              <Cells>
                <TableCell RowIndex="0" ColumnIndex="0" RowSpan="1" ColumnSpan="1">
                  <ReportItem>
                    <TextBox Width="4.39992141723633in" Height="0.200000002980232in" Left="0in" Top="0in" Name="textBox3" StyleName="Civic.TableBody" />
                  </ReportItem>
                </TableCell>
              </Cells>
              <Columns>
                <Column Width="4.39992141723633in" />
              </Columns>
              <Rows>
                <Row Height="0.200000002980232in" />
              </Rows>
            </Body>
            <Corner />
            <RowGroups>
              <TableGroup>
                <Groupings>
                  <Grouping />
                </Groupings>
              </TableGroup>
            </RowGroups>
            <ColumnGroups>
              <TableGroup>
                <ReportItem>
                  <TextBox Width="4.39992141723633in" Height="0.200000002980232in" Left="0in" Top="0in" Name="textBox1" StyleName="Civic.TableHeader" />
                </ReportItem>
              </TableGroup>
            </ColumnGroups>
          </Table>
          <TextBox Width="3.50000063578288in" Height="0.199999968210856in" Left="0.449999650319417in" Top="0.899999936421712in" Value="OTHER DETAIL SECTION CONTENT" Name="textBox2">
            <Style BackgroundColor="Yellow" TextAlign="Center" VerticalAlign="Middle" />
          </TextBox>
          <TextBox Width="3.50000071525574in" Height="0.19999997317791in" Left="0.449999650319417in" Top="0.10003924369812in" Value="OTHER DETAIL SECTION CONTENT" Name="textBox6">
            <Style BackgroundColor="Yellow" TextAlign="Center" VerticalAlign="Middle" />
          </TextBox>
        </Items>
      </DetailSection>
      <PageFooterSection Height="1in" Name="pageFooterSection1">
        <Style BackgroundColor="Lime" />
        <Items>
          <TextBox Width="3.50000071525574in" Height="0.19999997317791in" Left="0.449999650319417in" Top="0.100000063578288in" Value="PAGE FOOTER" Name="textBox5">
            <Style TextAlign="Center" VerticalAlign="Middle" />
          </TextBox>
        </Items>
      </PageFooterSection>
    </Items>
    <PageSettings PaperKind="Letter">
      <Margins>
        <MarginsU Left="1in" Right="1in" Top="1in" Bottom="1in" />
      </Margins>
    </PageSettings>
    <StyleSheet>
      <StyleRule>
        <Style>
          <Padding Left="2pt" Right="2pt" />
        </Style>
        <Selectors>
          <TypeSelector Type="TextItemBase" />
          <TypeSelector Type="HtmlTextBox" />
        </Selectors>
      </StyleRule>
      <StyleRule>
        <Style Color="Black">
          <Font Name="Georgia" Size="9pt" />
          <BorderStyle Default="Solid" />
          <BorderColor Default="Black" />
          <BorderWidth Default="1px" />
        </Style>
        <Selectors>
          <StyleSelector Type="Table" StyleName="Civic.TableNormal" />
        </Selectors>
      </StyleRule>
      <StyleRule>
        <Style BackgroundColor="White">
          <Font Name="Georgia" Size="9pt" />
          <BorderStyle Default="Solid" />
          <BorderColor Default="Black" />
          <BorderWidth Default="1px" />
        </Style>
        <Selectors>
          <DescendantSelector>
            <Selectors>
              <TypeSelector Type="Table" />
              <StyleSelector Type="ReportItem" StyleName="Civic.TableBody" />
            </Selectors>
          </DescendantSelector>
        </Selectors>
      </StyleRule>
      <StyleRule>
        <Style BackgroundColor="LightBlue" Color="228, 238, 243" VerticalAlign="Middle">
          <Font Name="Georgia" Size="10pt" />
          <BorderStyle Default="Solid" />
          <BorderColor Default="Black" />
          <BorderWidth Default="1px" />
        </Style>
        <Selectors>
          <DescendantSelector>
            <Selectors>
              <TypeSelector Type="Table" />
              <StyleSelector Type="ReportItem" StyleName="Civic.TableHeader" />
            </Selectors>
          </DescendantSelector>
        </Selectors>
      </StyleRule>
    </StyleSheet>
  </Report>
  ```
2. Set Table **Width** and **Styles** (as *StyleNames* defined in the *StyleRules* in the report *StyleSheet* property). Leave only one column in the Table - we will use it to carry the *Styles* of the header and detail cells. Check the [Creating Style Rules](../style-creating-style-rules) article for details on style rules.
3. Use the following sample code to add DataSource and the necessary columns to the Table:

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
