---
title: ReportSource Model Binding
page_title: ReportSource Model Binding 
description: ReportSource Model Binding
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/reportsource-model-binding
tags: reportsource,model,binding
published: True
position: 4
---

# ReportSource Model Binding

The HTML5 Report Viewer comes with an MVC wrapper that does the JavaScript configuration of the report viewer, where you can type the initial settings of the viewer in C# or VB.NET. The settings include Id, ServiceUrl, templateUrl, client-side ReportSource, and more - [HTML5 Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}). 

> It is important to know that the MVC project appears as a client for the Reporting RESt Service serving the HTML5 Viewer, even if the service is in the same project. The HTML5 Viewer and Reporting REST Service operate in a client-server model that is not related to the MVC architecture of the project. Modifications in reports and run-time data-bindings can be performed only bythe Reporting REST Service, on the server where the Reporting REST Service is running. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}). 

## Getting started

Lets start with the model now. In case all you need is a report viewer that is used to display various reports you can have a simple model to create a strongly typed view - you need to use a [client-side report source]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%}), like this (TypeReportSource or UriReportSource): 
    
````c#
@model Telerik.Reporting.UriReportSource
````
````vb.net
@ModelType Telerik.Reporting.UriReportSource
````

Then you can use it directly when you are initializing the report viewer:         

{{source=CodeSnippets\MvcCS\Views\Home\SimpleModelBinding.cshtml region=Example}}
````c#
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl("/api/reports/")
    .TemplateUrl("/ReportViewer/templates/telerikReportViewerTemplate.html")
    .ReportSource(Model)
    .ViewMode(ViewMode.Interactive)
    .ScaleMode(ScaleMode.Specific)
    .Scale(1.0)
    .PersistSession(false)
)
````
{{source=CodeSnippets\MvcVB\Views\Home\SimpleModelBinding.vbhtml region=Example}}
````vb.net
@Code
    Html.TelerikReporting().ReportViewer() _
 .Id("reportViewer1") _
 .ServiceUrl("/api/reports/") _
 .TemplateUrl("/ReportViewer/templates/telerikReportViewerTemplate.html") _
 .ReportSource(Model) _
 .ViewMode(ViewMode.Interactive) _
 .ScaleMode(ScaleMode.Specific) _
 .Scale(1.0) _
 .PersistSession(False)
End Code
````

## Change report viewer according to the report type

Now in case you have a more complex scenario where the report viewer depends on the displayed report you can create a more complex view model that contains your data, including the report source. Lets take as example the scenario where you need to change the template of the report viewer when you are displaying reports that are not suitable for printing. In that case you will have to create two templates for the report viewer - the default one and the one that has no print button. Then you have to create a view model with two properties - the first will contain the uri to the template and the second the report source. Check this snippet: 

{{source=CodeSnippets\MvcCS\Models\TemplatedReportViewerViewModel.cs region=AdvancedModelBindingViewModel}}
````c#
public class TemplatedReportViewerViewModel
{
    public string TemplateUri { get; set; }
    public UriReportSource ReportSource { get; set; }
}
````
{{source=CodeSnippets\MvcVB\Models\TemplatedReportViewerViewModel.vb region=AdvancedModelBindingViewModel}}
````vb.net
Public Class TemplatedReportViewerViewModel
    Public Property TemplateUri() As String
    Public Property ReportSource() As UriReportSource
End Class
````

Once you have the model you should create your own logic to populate it (note that the MVC View is not a suitable place for that logic). Then use the model for your view to make it strongly typed: 

{{source=CodeSnippets\MvcCS\Views\Home\AdvancedModelBinding.cshtml region=Example}}
````c#
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl("/api/reports/")
    .TemplateUrl(Model.TemplateUri)
    .ReportSource(Model.ReportSource)
    .ViewMode(ViewMode.Interactive)
    .ScaleMode(ScaleMode.Specific)
    .Scale(1.0)
    .PersistSession(false)
)
````
{{source=CodeSnippets\MvcVB\Views\Home\AdvancedModelBinding.vbhtml region=Example}}
````vb.net
@Code
    Html.TelerikReporting().ReportViewer() _
 .Id("reportViewer1") _
 .ServiceUrl("/api/reports/") _
 .TemplateUrl(Model.TemplateUri) _
 .ReportSource(Model.ReportSource) _
 .ViewMode(ViewMode.Interactive) _
 .ScaleMode(ScaleMode.Specific) _
 .Scale(1.0) _
 .PersistSession(False)
End Code
````

## Using custom report source resolver

There are cases when the supported report sources (Type and Uri) will not be enough. Perhaps you have created a CustomReportSourceResolver in the REST service and since it accepts string as an argument you might also want to directly use a string as your report source. This is possible again through the ReportSource method. The last two overloads of the ReportSource method accept a string as their first argument. This means that the ReportSource can still be strongly typed, but to a string instead of a ReportSource. This gives you the option to implement any custom logic that you need based on that string. For example you could pass the id of the report in the database: 

{{source=CodeSnippets\MvcCS\Views\Home\CustomModelBinding.cshtml region=Example1}}
````c#
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl("/api/reports/")
    .TemplateUrl("/ReportViewer/templates/telerikReportViewerTemplate.html")
    .ReportSource("73")
    .ViewMode(ViewMode.Interactive)
    .ScaleMode(ScaleMode.Specific)
    .Scale(1.0)
    .PersistSession(false)
)
````
{{source=CodeSnippets\MvcVB\Views\Home\CustomModelBinding.vbhtml region=Example1}}
````vb.net
@Code
    Html.TelerikReporting().ReportViewer() _
 .Id("reportViewer1") _
 .ServiceUrl("/api/reports/") _
 .TemplateUrl("/ReportViewer/templates/telerikReportViewerTemplate.html") _
 .ReportSource("73") _
 .ViewMode(ViewMode.Interactive) _
 .ScaleMode(ScaleMode.Specific) _
 .Scale(1.0) _
 .PersistSession(False)
End Code
````

You can also add parameters, like this: 

{{source=CodeSnippets\MvcCS\Views\Home\CustomModelBinding.cshtml region=Example2}}
````c#
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl("/api/reports/")
    .TemplateUrl("/ReportViewer/templates/telerikReportViewerTemplate.html")
    .ReportSource("73", new Dictionary<string, object>() { { "parameter1", "value1" }, { "parameter2", "value2" } })
    .ViewMode(ViewMode.Interactive)
    .ScaleMode(ScaleMode.Specific)
    .Scale(1.0)
    .PersistSession(false)
)
````
{{source=CodeSnippets\MvcVB\Views\Home\CustomModelBinding.vbhtml region=Example2}}
````vb.net
@Code
    Html.TelerikReporting().ReportViewer() _
 .Id("reportViewer1") _
 .ServiceUrl("/api/reports/") _
 .TemplateUrl("/ReportViewer/templates/telerikReportViewerTemplate.html") _
 .ReportSource("73", New Dictionary(Of String, Object)() From {{"parameter1", "value1"}, {"parameter2", "value2"}}) _
 .ViewMode(ViewMode.Interactive) _
 .ScaleMode(ScaleMode.Specific) _
 .Scale(1.0) _
 .PersistSession(False)
End Code
````

The view can also be strongly typed: 

{{source=CodeSnippets\MvcCS\Views\Home\AdvancedCustomModelBinding.cshtml region=Example}}
````c#
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl("/api/reports/")
    .TemplateUrl("/ReportViewer/templates/telerikReportViewerTemplate.html")
    .ReportSource(Model.ReportSource, Model.Parameters)
    .ViewMode(ViewMode.Interactive)
    .ScaleMode(ScaleMode.Specific)
    .Scale(1.0)
    .PersistSession(false)
)
````
{{source=CodeSnippets\MvcVB\Views\Home\AdvancedCustomModelBinding.vbhtml region=Example}}
````vb.net
@Code
    Html.TelerikReporting().ReportViewer() _
 .Id("reportViewer1") _
 .ServiceUrl("/api/reports/") _
 .TemplateUrl("/ReportViewer/templates/telerikReportViewerTemplate.html") _
 .ReportSource(Model.ReportSource, Model.Parameters) _
 .ViewMode(ViewMode.Interactive) _
 .ScaleMode(ScaleMode.Specific) _
 .Scale(1.0) _
 .PersistSession(False)
End Code
````

Finally on the server side your custom report source resolver can implement the custom logic that will take in consideration the id and create a report source as per your needs: 

{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=ModelBindingReportResolver_Implementation}}
{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=ModelBindingReportResolver_Implementation}}

