---
title: Using Parameters with the ObjectDataSource Component
page_title: Using Parameters with the ObjectDataSource Component | for Telerik Reporting Documentation
description: Using Parameters with the ObjectDataSource Component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/using-parameters-with-the-objectdatasource-component
tags: using,parameters,with,the,objectdatasource,component
published: True
position: 2
---

# Using Parameters with the ObjectDataSource Component



The __ObjectDataSource__  component can call a business object method based         on the name of the method specified in the __DataMember__  property, and based         additionally on the argument names that make up the business object method's         signature. When you create methods in a business object, you must ensure that         the parameter names and types accepted by the business object method match the         parameter names and types that the __ObjectDataSource__  component passes.       

The __ObjectDataSource__  component accepts input parameters at run time and         manages them in a parameter collection. You can use the __Parameters__  property         to specify the parameters. For each parameter you can set a name and a default         value or an expression. During the report processing the __ObjectDataSource__          parameters’ values are used as argument values for the data method or the         constructor of the business object. Because of this the order of the         parameters is important and should exactly match the order of the arguments         along with their types and names. Any discrepancy will result in a run-time         exception.       

>note The [ObjectDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/objectdatasource-wizard%}) can detect parameters           of the data-retrieval method, and it will ask you to provide values for them at  __Configure Data Source Parameters__  step.         


Here is an example of programmatically setting the ObjectDataSource’s         parameters:       

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToObjectDataSourceParameters}}
````C#
	
	        public void HowToObjectDataSourceParameters()
	        {
	            Telerik.Reporting.ObjectDataSource objectDataSource1 = new Telerik.Reporting.ObjectDataSource();
	            objectDataSource1.DataMember = "GetCars";
	            objectDataSource1.DataSource = typeof(Cars);
	            objectDataSource1.Parameters.Add(new Telerik.Reporting.ObjectDataSourceParameter("year", typeof(int), 2010));
	            objectDataSource1.Parameters.Add(new Telerik.Reporting.ObjectDataSourceParameter("color", typeof(string), "=Parameters.Color"));
	        }
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToObjectDataSourceParameters}}
````VB
	    Public Sub HowToObjectDataSourceParameters()
	        Dim objectDataSource1 As New Telerik.Reporting.ObjectDataSource()
	        objectDataSource1.DataMember = "GetCars"
	        objectDataSource1.DataSource = GetType(Cars)
	        objectDataSource1.Parameters.Add(New Telerik.Reporting.ObjectDataSourceParameter("year", GetType(Integer), 2010))
	        objectDataSource1.Parameters.Add(New Telerik.Reporting.ObjectDataSourceParameter("color", GetType(String), "=Parameters.Color"))
	    End Sub
	
````



# See Also


 * [Using Parameters with Data Source objects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/using-parameters-with-data-source-objects%})
