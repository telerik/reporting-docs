---
title: Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap
page_title: Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap Type
description: "Provides a class for the key mapping used when report viewer accessibility is enabled."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/accessibilitykeymap
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

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `AccessibilityKeyMap` type of the HTML5 ASP.NET MVC Report Viewer

Provides a class for the key mapping used when report viewer accessibility is enabled.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CONFIRM_KEY | `System.Byte` | Key code for executing report actions and applying report parameters |
| CONTENT_AREA_KEY | `System.Byte` | Key code for navigating to report contents area, when pressed together with CTRL + ALT |
| DOCUMENT_MAP_AREA_KEY | `System.Byte` | Key code for navigating to document map area, when pressed together with CTRL + ALT |
| Default | [`Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/accessibilitykeymap%}) | Returns an instance, initialized with the default key mapping |
| Equals(System.Object) | `System.Boolean` | Internal use only |
| Equals(Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap) | `System.Boolean` | Internal use only |
| GetHashCode | `System.Int32` | Internal use only |
| MENU_AREA_KEY | `System.Byte` | Key code for navigating to menu area, when pressed together with CTRL + ALT |
| PARAMETERS_AREA_KEY | `System.Byte` | Key code for navigating to parameters area, when pressed together with CTRL + ALT |

## Example

````C#
@using Telerik.ReportViewer.Html5.Common.Options


@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Example of creating an AccessibilityKeyMap
    .AccessibilityKeyMap(new AccessibilityKeyMap())
)
````

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/overview%})
* [AccessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/accessibilitykeymap%})
* [AuthenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/authenticationtoken%})
* [CheckedButtonClass]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/checkedbuttonclass%})

