---
title: How to Bind to a DataTable
page_title: How to Bind to a DataTable | for Telerik Reporting Documentation
description: How to Bind to a DataTable
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-datatable
tags: how,to,bind,to,a,datatable
published: True
position: 1
---

# How to Bind to a DataTable



The following example illustrates how to use a __DataTable__  as the        source for an __ObjectDataSource__  component. The code below additionally        creates a calculated field that can be used in the report definition in        the same way as a regular field.

## 

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToDataTableSnippet}}
````C#
	
	        void Form2_Load(object sender, EventArgs e)
	        {
	            // Creating and configuring the ObjectDataSource component:
	            var objectDataSource = new Telerik.Reporting.ObjectDataSource();
	            objectDataSource.DataSource = GetData(); // GetData returns a DataTable
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
	
	        static DataTable GetData()
	        {
	            const string connectionString =
	                "Data Source=(local)\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True";
	
	            string selectCommandText =
	                "SELECT Name, ProductNumber FROM Production.Product;";
	
	            SqlDataAdapter dataAdapter = new SqlDataAdapter(selectCommandText, connectionString);
	            DataTable dataTable = new DataTable();
	
	            dataAdapter.Fill(dataTable);
	
	            return dataTable;
	        }
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToDataTableSnippet}}
````VB
	
	    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
	        ' Creating and configuring the ObjectDataSource component:
	        Dim objectDataSource As New Telerik.Reporting.ObjectDataSource()
	        objectDataSource.DataSource = GetData() ' GetData returns a DataTable
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
	
	    Shared Function GetData() As DataTable
	        Const connectionString As String =
	            "Data Source=(local)\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"
	
	        Dim selectCommandText As String =
	            "SELECT Name, ProductNumber FROM Production.Product;"
	
	        Dim dataAdapter = New SqlDataAdapter(selectCommandText, connectionString)
	        Dim dataTable As New DataTable()
	        dataAdapter.Fill(dataTable)
	
	        Return dataTable
	    End Function
	
````



# See Also

