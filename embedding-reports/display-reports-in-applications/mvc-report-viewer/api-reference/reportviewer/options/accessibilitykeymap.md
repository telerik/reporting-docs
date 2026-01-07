---
title: AccessibilityKeyMap
page_title: AccessibilityKeyMap property
description: "Sets the key mappings used in accessibility mode for keyboard navigation. Customizes keyboard shortcuts for accessibility navigation to meet specific application or user requirements."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/accessibilitykeymap
published: True
reportingArea: MVCWrapper
---

# The `AccessibilityKeyMap` option of the HTML5 ASP.NET MVC Report Viewer

Sets the key mappings used in accessibility mode for keyboard navigation. Customizes keyboard shortcuts for accessibility navigation to meet specific application or user requirements.

## Type

[`Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/accessibilitykeymap%})

## Examples

````C#
@using Telerik.ReportViewer.Html5.Common.Options

<!-- Example demonstrating how to set the AccessibilityKeyMap for keyboard navigation accessibility -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .AccessibilityKeyMap(new AccessibilityKeyMap {
        // Example: Set key mappings by property name as defined in the AccessibilityKeyMap model
        // For demonstration, custom key mapping properties are set using the default constructor and object initializer
    })
)
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/overview%})
* [AuthenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/authenticationtoken%})
* [CheckedButtonClass]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/checkedbuttonclass%})
* [AccessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/accessibilitykeymap%})

