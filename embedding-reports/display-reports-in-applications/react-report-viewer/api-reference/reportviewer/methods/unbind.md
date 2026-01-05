---
title: unbind
page_title: The unbind method of the React Report Viewer explained
description: "Learn more about the unbind method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/unbind
tags: unbind
published: True
reportingArea: React
position: 14
---

# The `unbind` method of the React Report Viewer

Unbinds an event handler from the specified event.

## Example

````JavaScript
// Unbind specific handlerreportViewerRef.current.unbind("error", myErrorHandler);
````

````JavaScript
// Unbind all handlers for an eventreportViewerRef.current.unbind("pageReady");
````


