---
title: Telerik.Reporting.XmlReportSource
page_title: Telerik.Reporting.XmlReportSource Type
description: "Represents a report source that contains the XML markup of a report document."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/xmlreportsource
published: True
reportingArea: MVCWrapper
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }
</style>

# The `XmlReportSource` type of the HTML5 ASP.NET MVC Report Viewer

Represents a report source that contains the XML markup of a report document.

## Constructors

| Constructor | Description |
| ------ | ------ |
| XmlReportSource() | Initializes a new instance of the [`Telerik.Reporting.XmlReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/xmlreportsource%}) class. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Equals(System.Object) | `System.Boolean` | Determines whether this instance and a specified object have the same value. |
| GetHashCode | `System.Int32` | Returns the hash code for this XmlReportSource. |
| ToString | `System.String` | Returns a string that represents the current XmlReportSource. |
| Xml | `System.String` | Gets or sets the XML markup of a `Telerik.Reporting.IReportDocument`.<br><br>This property can accept an expression when the report source is used in a `Telerik.Reporting.SubReport` item <br>or a `Telerik.Reporting.NavigateToReportAction`. |

## Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "XmlReportSource Example";
}

<!-- Example demonstrating the use of Telerik.Reporting.XmlReportSource as the Report Source for the Telerik MVC Report Viewer -->

@{
    // Create a new XmlReportSource instance and set its Xml property to your report XML string
    var xmlReportSource = new Telerik.Reporting.XmlReportSource
    {
        Xml = "<Report xmlns='http://schemas.telerik.com/reporting/2016/ReportDefinition'></Report>"
    };
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ReportSource(xmlReportSource)
)
````

