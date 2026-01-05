---
title: Telerik.Reporting.TypeReportSource
page_title: Telerik.Reporting.TypeReportSource Type
description: "Represents a report source that allows a report document to be instantiated from an System.Type.AssemblyQualifiedName."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/typereportsource
published: True
reportingArea: MVCWrapper
---

# The `TypeReportSource` type of the HTML5 ASP.NET MVC Report Viewer

Represents a report source that allows a report document to be instantiated from an `System.Type.AssemblyQualifiedName`.

## Constructors

| Constructor | Description |
| ------ | ------ |
| TypeReportSource() | Initializes a new instance of the [`Telerik.Reporting.TypeReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/typereportsource%}) class. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Equals(System.Object) | `System.Boolean` | Determines whether this instance and a specified object have the same value. |
| GetHashCode | `System.Int32` | Returns the hash code for this TypeReportSource. |
| ToString | `System.String` | Returns a string that represents the current TypeReportSource. |
| TypeName | `System.String` | Gets or sets the assembly qualified type name of the report document.<br><br>Use this property to specify the type name of the report document.<br>Must be the assembly qualified name of the `System.Type` of the report.<br><br>The target type should implement the <br>`Telerik.Reporting.IReportDocument` interface <br>and should have a default (parameterless) constructor. <br>The default constructor is used from the reporting engine to create the report<br>instance.<br><br>This property can accept an expression when the report source is used in a `Telerik.Reporting.SubReport` item <br>or a `Telerik.Reporting.NavigateToReportAction` action. |

## Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc
@{
    ViewBag.Title = "TypeReportSource Example";
}

// Demonstrates how to configure the ReportViewer with a TypeReportSource
@(Html.TelerikReporting().ReportViewer()
      .Id("reportViewer1")
      .ServiceUrl(Url.Content("~/api/reports/"))
      .ReportSource(new TypeReportSource()
      {
          // Set the fully qualified type name of the report to instantiate
          TypeName = "Namespace.ReportClassName, AssemblyName"
      })
)
````

