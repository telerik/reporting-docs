---
title: How to Bind to a DataView
page_title: How to Bind to a DataView | for Telerik Reporting Documentation
description: How to Bind to a DataView
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-dataview
tags: how,to,bind,to,a,dataview
published: True
position: 2
---

# How to Bind to a DataView



The following example illustrates how to use a __DataView__  as the source       for an __ObjectDataSource__  component.

## 

The sample code below shows how to pass a __DataView__       object to the __DataSource__       property of the __ObjectDataSource__  component. __DataView__  is usually used when we       want to work only with a subset of data from the __DataTable__ . Additionally a       sample calculated field is added that can be used in the report definition in       the same way as a regular field.      

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToDataViewSnippet}}
````C#
	
	        void Form3_Load(object sender, EventArgs e)
	        {
	            // Creating and configuring the ObjectDataSource component:
	            var objectDataSource = new Telerik.Reporting.ObjectDataSource();
	            objectDataSource.DataSource = GetData("Name LIKE 'Mountain%'"); // GetData returns a DataView with the specified row filter.
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
	
	        static DataView GetData(string rowFilter)
	        {
	            const string connectionString =
	                "Data Source=(local)\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True";
	
	            string selectCommandText =
	                "SELECT Name, ProductNumber FROM Production.Product;";
	
	            SqlDataAdapter dataAdapter = new SqlDataAdapter(selectCommandText, connectionString);
	            DataTable dataTable = new DataTable();
	
	            dataAdapter.Fill(dataTable);
	
	            DataView dataView = dataTable.DefaultView;
	            dataView.RowFilter = rowFilter; // View only those records that match a certain criteria.
	
	            return dataView;
	        }
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToDataViewSnippet}}
````VB
	
	    Private Sub Form3_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
	        ' Creating and configuring the ObjectDataSource component:
	        Dim objectDataSource As New Telerik.Reporting.ObjectDataSource()
	        objectDataSource.DataSource = GetData("Name LIKE 'Mountain%'") ' GetData returns a DataView with the specified row filter.
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
	
	    Shared Function GetData(ByVal rowFilter As String) As DataView
	        Const connectionString As String =
	            "Data Source=(local)\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"
	
	        Dim selectCommandText As String =
	            "SELECT Name, ProductNumber FROM Production.Product;"
	
	        Dim dataAdapter = New SqlDataAdapter(selectCommandText, connectionString)
	        Dim dataTable As New DataTable()
	        dataAdapter.Fill(dataTable)
	
	        Dim dataView = dataTable.DefaultView
	        dataView.RowFilter = rowFilter
	
	        Return dataView
	    End Function
	
````



# See Also

