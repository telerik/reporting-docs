---
title: Telerik.ReportViewer.Html5.WebForms.DeferredScripts
page_title: Telerik.ReportViewer.Html5.WebForms.DeferredScripts Type
description: "Represents a WebForms control that renders deferred JavaScript initialization scripts for HTML5 ReportViewer components. Used to collect and output JavaScript initialization code at a specific location in the HTML document for optimal performance and loading behavior. Provides a way to defer script execution until a controlled point in the page rendering process, improving page load performance by separating script registration from script execution."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/deferredscripts
published: True
reportingArea: WebForms
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `DeferredScripts` type of the HTML5 ASP.NET WebForms Report Viewer

Represents a WebForms control that renders deferred JavaScript initialization scripts for HTML5 ReportViewer components. Used to collect and output JavaScript initialization code at a specific location in the HTML document for optimal performance and loading behavior. Provides a way to defer script execution until a controlled point in the page rendering process, improving page load performance by separating script registration from script execution.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Render(System.Web.UI.HtmlTextWriter) | - | Renders the control content by outputting the deferred JavaScript scripts to the specified HTML writer.<br>Overrides the base render method to provide custom script output without additional HTML wrapper elements. |
| RenderContents(System.Web.UI.HtmlTextWriter) | - | Renders the JavaScript content of the control by writing the deferred scripts to the specified HTML writer.<br>Retrieves and renders all deferred JavaScript scripts that have been collected during the page lifecycle for HTML5 ReportViewer components. |
| ToString | `System.String` | Converts the deferred scripts collection into an HTML string containing the JavaScript initialization statements.<br>Retrieves all scripts that were stashed during the page lifecycle and formats them as HTML script elements for execution in the browser. |

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/overview%})
* [GetReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/getreportparameters%})
* [RenderDesignTimeHtml]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/renderdesigntimehtml%})
* [ToString]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/tostring%})

