---
title: Serialize Report Definition in XML
page_title: Serialize Report Definition in XML 
description: Serialize Report Definition in XML
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml
tags: serialize,report,definition,in,xml
published: True
position: 7
---

# Serialize Report Definition in XML

__Telerik Reporting__ supports serialization/deserialization of the report definition as plain __XML__. This is useful in various different scenarios and opens many possibilities that are not easily accomplished otherwise. For example, this allows adding or modifying reports in your application without recompiling or redeploying it. Another typical scenario is saving/loading of dynamically generated report definitions or transferring them over the network. 

> In order to better handle report definition resources we also provide a [ReportPackager](/reporting/api/Telerik.Reporting.ReportPackager) that serializes the report definition in XML and packages it together with its resources in a file with zip compression. For more information see: [Package Report Definition]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}). 

## Class Report Definition

The __XML__ serialization/deserialization of report definitions is achieved through the dedicated [ReportXmlSerializer](/reporting/api/Telerik.Reporting.XmlSerialization.ReportXmlSerializer) class. To illustrate how a report is serialized and deserialized, let us start with a simple dynamically generated class report definition: 

{{source=CodeSnippets\CS\API\Telerik\Reporting\XmlSerializationSnippets.cs region=ReportDefinitionSnippet}}
````C#
var report = new Report1();

report.Width = Telerik.Reporting.Drawing.Unit.Inch(4);

var detailSection = new Telerik.Reporting.DetailSection();

detailSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0.2);
report.Items.Add(detailSection);

var numberTextBox = new Telerik.Reporting.TextBox();

numberTextBox.Value = "=Fields.ProductNumber";
numberTextBox.Left = Telerik.Reporting.Drawing.Unit.Inch(0);
numberTextBox.Top = Telerik.Reporting.Drawing.Unit.Inch(0);
numberTextBox.Width = Telerik.Reporting.Drawing.Unit.Inch(2);
numberTextBox.Height = Telerik.Reporting.Drawing.Unit.Inch(0.2);
detailSection.Items.Add(numberTextBox);

var nameTextBox = new Telerik.Reporting.TextBox();

nameTextBox.Value = "=Fields.Name";
nameTextBox.Left = Telerik.Reporting.Drawing.Unit.Inch(2);
nameTextBox.Top = Telerik.Reporting.Drawing.Unit.Inch(0);
nameTextBox.Width = Telerik.Reporting.Drawing.Unit.Inch(2);
nameTextBox.Height = Telerik.Reporting.Drawing.Unit.Inch(0.2);
detailSection.Items.Add(nameTextBox);

var dataSource = new Telerik.Reporting.SqlDataSource();

dataSource.ConnectionString = "Data Source=.\\SqlExpress;Initial Catalog=AdventureWorks;Integrated Security=True";
dataSource.SelectCommand = "select ProductNumber, Name from Production.Product";
report.DataSource = dataSource;
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\XmlSerializationSnippets.vb region=ReportDefinitionSnippet}}
````VB
Dim report As New Report1()

report.Width = Telerik.Reporting.Drawing.Unit.Inch(4)

Dim detailSection As New Telerik.Reporting.DetailSection()

detailSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0.2)
report.Items.Add(detailSection)

Dim numberTextBox As New Telerik.Reporting.TextBox()

numberTextBox.Value = "=Fields.ProductNumber"
numberTextBox.Left = Telerik.Reporting.Drawing.Unit.Inch(0)
numberTextBox.Top = Telerik.Reporting.Drawing.Unit.Inch(0)
numberTextBox.Width = Telerik.Reporting.Drawing.Unit.Inch(2)
numberTextBox.Height = Telerik.Reporting.Drawing.Unit.Inch(0.2)
detailSection.Items.Add(numberTextBox)

Dim nameTextBox As New Telerik.Reporting.TextBox()

nameTextBox.Value = "=Fields.Name"
nameTextBox.Left = Telerik.Reporting.Drawing.Unit.Inch(2)
nameTextBox.Top = Telerik.Reporting.Drawing.Unit.Inch(0)
nameTextBox.Width = Telerik.Reporting.Drawing.Unit.Inch(2)
nameTextBox.Height = Telerik.Reporting.Drawing.Unit.Inch(0.2)
detailSection.Items.Add(nameTextBox)

Dim dataSource As New Telerik.Reporting.SqlDataSource()

dataSource.ConnectionString = "Data Source=.\SqlExpress;Initial Catalog=AdventureWorks;Integrated Security=True"
dataSource.SelectCommand = "select ProductNumber, Name from Production.Product"
report.DataSource = dataSource
````

## Serialize to XML

The following sample code snipped demonstrates how to serialize the above report definition to an XML file:

{{source=CodeSnippets\CS\API\Telerik\Reporting\XmlSerializationSnippets.cs region=XmlWriterSerializationSnippet}}
````C#
using (System.Xml.XmlWriter xmlWriter = System.Xml.XmlWriter.Create("SerializedReport.xml"))
{
    Telerik.Reporting.XmlSerialization.ReportXmlSerializer xmlSerializer =
        new Telerik.Reporting.XmlSerialization.ReportXmlSerializer();

    xmlSerializer.Serialize(xmlWriter, report);
}
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\XmlSerializationSnippets.vb region=XmlWriterSerializationSnippet}}
````VB
Using xmlWriter As System.Xml.XmlWriter = System.Xml.XmlWriter.Create("SerializedReport.xml")
    Dim xmlSerializer As New Telerik.Reporting.XmlSerialization.ReportXmlSerializer()

    xmlSerializer.Serialize(xmlWriter, report)
End Using
````

## Deserialize from XML

The corresponding code that can be used to deserialize the report definition from the file is shown below:

{{source=CodeSnippets\CS\API\Telerik\Reporting\XmlSerializationSnippets.cs region=XmlReaderDeserializationSnippet}}
````C#
System.Xml.XmlReaderSettings settings = new System.Xml.XmlReaderSettings();
settings.IgnoreWhitespace = true;

using (System.Xml.XmlReader xmlReader = System.Xml.XmlReader.Create("Report1.xml", settings))
{
    Telerik.Reporting.XmlSerialization.ReportXmlSerializer xmlSerializer =
        new Telerik.Reporting.XmlSerialization.ReportXmlSerializer();

    Telerik.Reporting.Report report = (Telerik.Reporting.Report)
        xmlSerializer.Deserialize(xmlReader);
}
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\XmlSerializationSnippets.vb region=XmlReaderDeserializationSnippet}}
````VB
Dim settings As New XmlReaderSettings()
settings.IgnoreWhitespace = True

Using xmlReader As System.Xml.XmlReader = System.Xml.XmlReader.Create("Report1.xml", settings)
    Dim xmlSerializer As New Telerik.Reporting.XmlSerialization.ReportXmlSerializer()

    Dim report As Telerik.Reporting.Report = DirectCast(xmlSerializer.Deserialize(xmlReader), Telerik.Reporting.Report)
End Using
````

and the resulting XML file would look like this:

## XML Report Definition

{{source=CodeSnippets\CS\Report1.xml}}
````XML
<Report DataSourceName="sqlDataSource1" Width="4in" Name="userReport1" xmlns="http://schemas.telerik.com/reporting/2012/2">
  <DataSources>
    <SqlDataSource ConnectionString="Data Source=.\SqlExpress;Initial Catalog=AdventureWorks;Integrated Security=True" SelectCommand="select ProductNumber, Name from Production.Product" Name="sqlDataSource1" />
  </DataSources>
  <Items>
    <DetailSection Height="0.2in" Name="detailSection1">
      <Items>
        <TextBox Value="=Fields.ProductNumber" Size="2in, 0.2in" Location="0in, 0cm" Name="textBox1" />
        <TextBox Value="=Fields.Name" Size="2in, 0.2in" Location="2in, 0cm" Name="textBox2" />
      </Items>
    </DetailSection>
  </Items>
  <PageSettings>
    <PageSettings PaperKind="Letter" Landscape="False">
      <Margins>
        <MarginsU Left="1in" Right="1in" Top="1in" Bottom="1in" />
      </Margins>
    </PageSettings>
  </PageSettings>
</Report>
````

