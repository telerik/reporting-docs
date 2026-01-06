---
title: Telerik.ReportViewer.Mvc.DeferredScripts
page_title: Telerik.ReportViewer.Mvc.DeferredScripts Type
description: "Represents a container for deferred JavaScript initialization statements for MVC Report Viewer components. Used to collect and render JavaScript initialization code at a specific location in the HTML document for optimal performance and loading behavior. Implements IHtmlString to enable direct rendering in MVC views and provides control over script tag generation for flexible script placement."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/deferredscripts
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

# The `DeferredScripts` type of the HTML5 ASP.NET MVC Report Viewer

Represents a container for deferred JavaScript initialization statements for MVC Report Viewer components. Used to collect and render JavaScript initialization code at a specific location in the HTML document for optimal performance and loading behavior. Implements IHtmlString to enable direct rendering in MVC views and provides control over script tag generation for flexible script placement.

## Constructors

| Constructor | Description |
| ------ | ------ |
| DeferredScripts(System.Collections.Generic.IDictionary<string,string>,bool) | Initializes a new instance of the DeferredScripts class with the specified script collection and rendering options.<br>Enables deferred initialization by collecting scripts during page construction and rendering them at a controlled location in the HTML document. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| ToHtmlString | `System.String` | Converts the deferred scripts collection into an HTML string containing the JavaScript initialization statements.<br>Called automatically when the DeferredScripts object is rendered in an MVC view, providing the final JavaScript output for report viewer initialization. |

## Example

````C#
@using Telerik.ReportViewer.Mvc

<!-- Example: Rendering all deferred scripts for the Telerik MVC Report Viewer in a Razor view -->
@section scripts
{
    @(Html.TelerikReporting().DeferredScripts())
}
````

