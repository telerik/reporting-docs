---
title: AccessibilityKeyMap)()
page_title: The AccessibilityKeyMap)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the AccessibilityKeyMap)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap)()
tags: accessibilitykeymap)
published: True
reportingArea: MVCWrapper
position: 1
---

# The `AccessibilityKeyMap)()` method of the ASP.NET MVC Report Viewer

Sets the key mappings used in accessibility mode for keyboard navigation. <remarks>Customizes keyboard shortcuts for accessibility navigation to meet specific application or user requirements.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
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

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

