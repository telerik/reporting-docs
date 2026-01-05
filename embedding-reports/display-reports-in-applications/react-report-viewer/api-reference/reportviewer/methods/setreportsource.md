---
title: setReportSource
page_title: The setReportSource method of the React Report Viewer explained
description: "Learn more about the setReportSource method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/setreportsource
tags: setreportsource
published: True
reportingArea: React
position: 3
---

# The `setReportSource` method of the React Report Viewer

Sets the report source - report and parameters. Automatically reloads the report (if any) into the view.

## Example

````JavaScript
// Set a new report sourcereportViewerRef.current.setReportSource({  report: "SalesReport",  parameters: { StartDate: "2024-01-01", EndDate: "2024-12-31" }});
````


## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})

