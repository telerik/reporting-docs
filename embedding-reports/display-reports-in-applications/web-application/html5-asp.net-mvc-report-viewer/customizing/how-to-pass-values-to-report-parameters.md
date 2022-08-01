---
title: How to Pass Values to Report Parameters
page_title: How to Pass Values to Report Parameters 
description: How to Pass Values to Report Parameters
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/how-to-pass-values-to-report-parameters
tags: how,to,pass,values,to,report,parameters
published: True
position: 5
---

# How to Pass Values to Report Parameters

This topic explains how to use custom parameters UI to update the report parameters instead of using the MVC report viewer's default implementation of the parameters area. The report and all required parameters for it are packed in a ReportSource object. To update the report source the [ReportViewer.reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}) method is used. 

To give an example we will use the Invoice report from our local examples and will update its __OrderNumber__ parameter from a custom parameter UI. 

## Pass values to report parameters

> All path references in the described steps should be adapted according to your project setup. For more information please refer to the MSDN article [ASP.NET Web Project Paths](http://msdn.microsoft.com/en-us/library/ms178116.aspx). 

1. We are going to use one of our demo Visual Studio reports. For this purpose the demo ReportLibrary project should be built beforehand (see below). Create a new ASP.NET MVC 4+ Empty Project and add reference to *[TelerikReporting_InstallDir]\Examples\CSharp|VB\ReportLibrary\bin\[configuration directory]\CSharp|VB.ReportLibrary.dll*. The exact *[configuration directory]* name depends on the project 'Build' configuration. It could be 'Debug', 'Release', etc. 

1. Use the [HTML5 MVC Report Viewer Item Template]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/how-to-use-html5-asp.net-mvc-report-viewer-with-rest-service%}). 
	Name the view with the viewer __InvoiceParameters.cshtml|vbhtml__. On __'Configure report source'__ step select __'Existing report definition'__, then select __'Select type report definition created in Visual Studio'__ and browse *Invoice* report class. Finish the wizard. 

1. Add MVC Controller item under the project's __Controller__ folder and name it __HomeController.cs|vb__, and add an ActionResult method named __InvoiceParameters__. Move the InvoiceParameters.cshtml|vbhtml file under the newly added __Views\Home__ folder. Add a connectiongStrings entry with name __Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString__ in the project's web.config file. For example: 

	````XML
<connectionStrings>
		 <add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
					connectionString="Data Source=(local);Initial Catalog=AdventureWorks;Integrated Security=SSPI"
					providerName="System.Data.SqlClient" />
	</connectionStrings>
````


	At this point you have a running MVC application that displays a report in the HTML5 MVC Viewer at __[host]/Home/InvoiceParameters__ without any modifications. 

1. These are the model and the view model that we will use for our view: 

	{{source=CodeSnippets\MvcCS\Models\InvoiceViewModel.cs region=InvoiceViewModel}}
	{{source=CodeSnippets\MvcVB\Models\InvoiceViewModel.vb region=InvoiceViewModel}}


	Create new Invoice.cs|vb and InvoiceViewModel.cs|vb files under __Models__ folder and copy the above code snippets. 

1. And this is how we will fill with data our view model before displaying the view with the viewer. For the purpose open the HomeController.cs|vb file and update the InvoiceParameters method as follows: 

	{{source=CodeSnippets\MvcCS\Controllers\HomeController.cs region=InvoiceViewModelData}}
	{{source=CodeSnippets\MvcVB\Controllers\HomeController.vb region=InvoiceViewModelData}}


1. Add a custom parameter UI - a dropdown selector with a few values. For the purpose, open the Views/Home/InvoiceParameters.cshtml|vbhtml file and add the following lines in the *BODY* element, above the HTML5 Viewer: 

	````C#
@model MyMVCProject.Models.InvoiceViewModel
<div id="invoiceIdSelector">
  @Html.LabelFor(m => m.SelectedInvoiceId)
  @Html.DropDownListFor(m => m.SelectedInvoiceId, Model.InvoiceItems, new { id = "invoiceId", title = "Select the Invoice ID" })
</div>
````
	````VB.NET
@ModelType MyMVCProject.InvoiceViewModel
<div id="invoiceIdSelector">
  @Html.LabelFor(Function(m) m.SelectedInvoiceId)
  @Html.DropDownListFor(Function(m) m.SelectedInvoiceId, Model.InvoiceItems, New With { Key.id = "invoiceId", Key.title = "Select the Invoice ID" })
</div>
````

1. Now initialize the report viewer. We will use the minimal set of all [possible options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}). Please note how the value from the custom UI is used to set the __OrderNumber__ report parameter initially: 

	{{source=CodeSnippets\MvcCS\Views\Home\InvoiceParameters.cshtml region=ParametersExample}}
	{{source=CodeSnippets\MvcVB\Views\Home\InvoiceParameters.vbhtml region=ParametersExample}}


1. Add code that updates the ReportSource parameters collection with the selected __Invoice Id__ from the dropdown box: 

	````JavaScript
$('#invoiceId').change(function () {
		var viewer = $("#reportViewer1").data("telerik_ReportViewer");
		viewer.reportSource({
			report: viewer.reportSource().report,
			parameters: { OrderNumber: $("#invoiceId :selected").text() }
		});
		//setting the HTML5 Viewer's reportSource, causes a refresh automatically
		//if you need to force a refresh for other case, use:
		//viewer.refreshReport();
	});
````

1. Run the project and verify that the __Invoice Id__ selection really updates the report. 

## See Also

* [How To: Create a Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/how-to-create-a-custom-parameter-editor%})
