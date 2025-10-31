---
title: ReportSource Model Binding
page_title: Working with the ReportSource Model
description: "Learn how the ReportSource Model can be bound with various client report sources in the MVC Report Viewer and how to implement a custom resolver."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/reportsource-model-binding
tags: reportsource,model,binding
published: True
reportingArea: MVCWrapper
position: 4
previous_url: /mvc-report-viewer-reportsource-model-binding
---

# ReportSource Model Binding Overview

The HTML5 Report Viewer comes with an MVC wrapper that does the JavaScript configuration of the report viewer, where you can type the initial settings of the viewer in `C#` or `VB.NET`. The settings include `Id`, `ServiceUrl`, `templateUrl`, client-side `ReportSource`, and more - [HTML5 Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}).

> The MVC project appears as a client for the Reporting REST Service serving the HTML5 Viewer, even if the service is in the same project. The HTML5 Report Viewer and Reporting REST Service operates in a client-server model that is not related to the MVC architecture of the project. Modifications in reports and run-time data-bindings can be performed only by the Reporting REST Service, on the server where the Reporting REST Service is running. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}).

## Getting started

In case all you need is a report viewer that is used to display various reports, you can have a simple model to create a strongly typed view - you need to use a [client-side report source]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%}), like this ([`TypeReportSource`](/api/telerik.reporting.typereportsource) or [`UriReportSource`](/api/telerik.reporting.urireportsource)):

````C#
@model Telerik.Reporting.UriReportSource
````
````VB.NET
@ModelType Telerik.Reporting.UriReportSource
````


Then you can use it directly when you are initializing the report viewer:

{{source=CodeSnippets\MvcCS\Views\Home\SimpleModelBinding.cshtml region=Example}}
{{source=CodeSnippets\MvcVB\Views\Home\SimpleModelBinding.vbhtml region=Example}}


## Change report viewer according to the report type

Now, in case you have a more complex scenario where the report viewer depends on the displayed report, you can create a more complex view model that contains your data, including the report source. Let's take as an example the scenario where you need to change the template of the report viewer when you are displaying reports that are not suitable for printing. In that case, you will have to create two templates for the report viewer - the default one and the one that has no print button. Then you have to create a view model with two properties - the first will contain the URI to the template and the second the report source. Check this snippet:

{{source=CodeSnippets\MvcCS\Models\TemplatedReportViewerViewModel.cs region=AdvancedModelBindingViewModel}}
{{source=CodeSnippets\MvcVB\Models\TemplatedReportViewerViewModel.vb region=AdvancedModelBindingViewModel}}


Once you have the model, you can create your own logic to populate it (*note that the MVC View is not a suitable place for that logic*). Then, use the model for your view to make it strongly typed:

{{source=CodeSnippets\MvcCS\Views\Home\AdvancedModelBinding.cshtml region=Example}}
{{source=CodeSnippets\MvcVB\Views\Home\AdvancedModelBinding.vbhtml region=Example}}


## Using custom IReportSourceResolver

In some scenarios, the supported report sources (`Type` and `Uri`) will not be the correct option. You may have created a custom implementation of the [IReportSourceResolver](/api/telerik.reporting.services.ireportsourceresolver) interface in the REST service and since it accepts a string as an argument, you might also want to directly use a string as your report source. This is possible again through the `ReportSource` method. 

The last two overloads of the `ReportSource` method accept a string as their first argument. This means that the `ReportSource` can be strongly typed but to a string instead of a `ReportSource`. This gives you the option to implement any custom logic that you need based on that string. 

For example, you can pass the ID of the report in the database:

{{source=CodeSnippets\MvcCS\Views\Home\CustomModelBinding.cshtml region=Example1}}
{{source=CodeSnippets\MvcVB\Views\Home\CustomModelBinding.vbhtml region=Example1}}


You can also add parameters, like this:

{{source=CodeSnippets\MvcCS\Views\Home\CustomModelBinding.cshtml region=Example2}}
{{source=CodeSnippets\MvcVB\Views\Home\CustomModelBinding.vbhtml region=Example2}}


The view can also be strongly typed:

{{source=CodeSnippets\MvcCS\Views\Home\AdvancedCustomModelBinding.cshtml region=Example}}
{{source=CodeSnippets\MvcVB\Views\Home\AdvancedCustomModelBinding.vbhtml region=Example}}


Finally, on the server side, your [custom IReportSourceResolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%}) can implement the custom logic that will take into consideration the ID and create a report source as per your needs:

{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=ModelBindingReportResolver_Implementation}}
{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=ModelBindingReportResolver_Implementation}}
