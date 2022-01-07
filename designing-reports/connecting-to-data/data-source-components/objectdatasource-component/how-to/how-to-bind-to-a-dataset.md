---
title: How to Bind to a DataSet
page_title: How to Bind to a DataSet | for Telerik Reporting Documentation
description: How to Bind to a DataSet
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-dataset
tags: how,to,bind,to,a,dataset
published: True
position: 4
---

# How to Bind to a DataSet



The following example illustrates how to use a DataSet as the source for an ObjectDataSource component.

In the code snippet below a DataSet object is filled with three tables and then used for the DataSource property of the ObjectDataSource component. The DataMemeber property of the ObjectDataSource component is set to indicate to which one of the three tables to bind to. Additionally a sample calculated field is added which can be used in the report definition in the same way as a regular field.

## 

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToDataSetSnippet}}
````C#
private void Form5_Load(object sender, EventArgs e)
{
    // Creating and configuring the ObjectDataSource component:
    var objectDataSource = new Telerik.Reporting.ObjectDataSource();
    objectDataSource.DataSource = GetAllData(); // GetData returns a DataSet with three tables
    objectDataSource.DataMember = "Product"; /// Indicating the exact table to bind to. If the DataMember is not specified the first data table will be used.
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

    // Calling the RefreshReport method (only in WinForms applications).
    reportViewer1.RefreshReport();
}

static DataSet GetAllData()
{
    const string connectionString =
        "Data Source=(local)\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True";

    string selectCommandText = "SELECT Name, ProductCategoryID FROM Production.ProductCategory;" +
        "SELECT Name, ProductCategoryID FROM Production.ProductSubcategory;" +
        "SELECT Name, ProductNumber FROM Production.Product;";

    SqlDataAdapter adapter = new SqlDataAdapter(selectCommandText, connectionString);
    DataSet dataSet = new DataSet();

    // The data set will be filled with three tables: ProductCategory, ProductSubcategory
    // and Product as the select command contains three SELECT statements.
    adapter.Fill(dataSet);

    // Giving meaningful names for the tables so that we can use them later.
    dataSet.Tables[0].TableName = "ProductCategory";
    dataSet.Tables[1].TableName = "ProductSubcategory";
    dataSet.Tables[2].TableName = "Product";
    return dataSet;
}
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToDataSetSnippet}}
````VB
Private Sub Form5_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)

    ' Creating and configuring the ObjectDataSource component:
    Dim objectDataSource As New Telerik.Reporting.ObjectDataSource()
    objectDataSource.DataSource = GetAllData() ' GetData returns a DataSet with three tables
    objectDataSource.DataMember = "Product" ' Indicating the exact table to bind to. If the DataMember is not specified the first data table will be used.
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
    reportViewer1.RefreshReport()

End Sub


Shared Function GetAllData() As DataSet
    Const connectionString As String =
        "Data Source=(local)\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"

    Dim selectCommandText As String =
        "SELECT Name, ProductCategoryID FROM Production.ProductCategory;" _
        + "SELECT Name, ProductCategoryID FROM Production.ProductSubcategory;" _
        + "SELECT Name, ProductNumber FROM Production.Product;"

    Dim adapter As New SqlDataAdapter(selectCommandText, connectionString)
    Dim dataSet As New DataSet()

    'The data set will be filled with three tables: ProductCategory, ProductSubcategory
    'and Product as the select command contains three SELECT statements.
    adapter.Fill(dataSet)

    'Giving meaningful names for the tables so that we can use them later.
    dataSet.Tables(0).TableName = "ProductCategory"
    dataSet.Tables(1).TableName = "ProductSubcategory"
    dataSet.Tables(2).TableName = "Product"

    Return dataSet
End Function
````


