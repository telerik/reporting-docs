---
title: How to Bind to a DataAdapter
page_title: How to Bind to a DataAdapter 
description: How to Bind to a DataAdapter
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-dataadapter
tags: how,to,bind,to,a,dataadapter
published: True
position: 3
---

# How to Bind to a DataAdapter



The following example illustrates how to use a __DataAdapter__ as the source for an __ObjectDataSource__ component.         

The __ObjectDataSource__ component allows you             to use directly a class that implements the __System.Data.IDataAdapter__ interface. In the sample code             below an instance of the __SqlDataAdapter__           class is created and passed to the __DataSource__           property of the __ObjectDataSource__ component.             When the __DataAdapter__ encounters multiple             result sets, it creates multiple tables and each table is given an             incremental default name of TableN, starting with "Table" for Table0.             In this case you have to set the __DataMember__           property of the __ObjectDataSource__ component             to indicate exactly which table to bind to. Additionally a sample             calculated field is added that can be used in the report definition             in the same way as a regular field.         

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToDataAdapterSnippet}}
````C#
void Form4_Load(object sender, EventArgs e)
{
    // Creating and configuring the ObjectDataSource component:
    var objectDataSource = new Telerik.Reporting.ObjectDataSource();
    objectDataSource.DataSource = GetMyData(); // GetData returns a SqlDataAdapter object which has a select command with three SELECT statements.
    objectDataSource.DataMember = "Table2"; /// Indicating the exact table to bind to. If the DataMember is not specified the first data table will be used.
    objectDataSource.CalculatedFields.Add(new Telerik.Reporting.CalculatedField("FullName", typeof(string), "=Fields.Name + ' ' + Fields.ProductNumber")); // Adding a sample calculated field.

    // Creating a new report
    var report = new Report1();

    // Assigning the ObjectDataSource component to the DataSource property of the report.
    report.DataSource = objectDataSource;

    // Use the InstanceReportSource to pass the report to the viewer for displaying
    var reportSource = new Telerik.Reporting.InstanceReportSource();
    reportSource.ReportDocument = report;

    // Assigning the report to the report viewer.
    reportViewer1.ReportSource = reportSource;

    // Calling the RefreshReport method in case this is a WinForms application.
    reportViewer1.RefreshReport();
}

static IDataAdapter GetMyData()
{
    const string connectionString =
        "Data Source=(local)\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True";

    string selectCommandText = "SELECT Name, ProductCategoryID FROM Production.ProductCategory;" +
        "SELECT Name, ProductCategoryID FROM Production.ProductSubcategory;" +
        "SELECT Name, ProductNumber FROM Production.Product;";

    return new SqlDataAdapter(selectCommandText, connectionString);
}
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToDataAdapterSnippet}}
````VB
Private Sub Form4_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
    ' Creating and configuring the ObjectDataSource component:
    Dim objectDataSource As New Telerik.Reporting.ObjectDataSource()
    objectDataSource.DataSource = GetMyData() ' GetData returns a SqlDataAdapter object which has a select command with three SELECT statements.
    objectDataSource.DataMember = "Table2" ' Indicating the exact table to bind to. If the DataMember is not specified the first data table will be used.
    objectDataSource.CalculatedFields.Add(New Telerik.Reporting.CalculatedField("FullName", GetType(String), "=Fields.Name + ' ' + Fields.ProductNumber")) ' Adding a sample calculated field.

    'Creating a new report
    Dim report As New Report1()

    ' Assigning the ObjectDataSource component to the DataSource property of the report.
    report.DataSource = objectDataSource

    ' Use the InstanceReportSource to pass the report to the viewer for displaying.
    Dim reportSource As New InstanceReportSource
    reportSource.ReportDocument = report

    ' Assigning the report to the report viewer.
    reportViewer1.ReportSource = reportSource

    ' Calling the RefreshReport method in case this is a WinForms application.
    Me.reportViewer1.RefreshReport()
End Sub

Shared Function GetMyData() As IDataAdapter
    Const connectionString As String =
        "Data Source=(local)\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"

    Dim selectCommandText As String =
        "SELECT Name, ProductCategoryID FROM Production.ProductCategory;" _
        + "SELECT Name, ProductCategoryID FROM Production.ProductSubcategory;" _
        + "SELECT Name, ProductNumber FROM Production.Product;"

    Return New SqlDataAdapter(selectCommandText, connectionString)
End Function
````


