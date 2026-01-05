---
title: getScale
page_title: The getScale method of the React Report Viewer explained
description: "Learn more about the getScale method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/getscale
tags: getscale
published: True
reportingArea: React
position: 6
---

# The `getScale` method of the React Report Viewer

Gets the viewer’s scale factor and scale mode.

## Example

````JavaScript
// Get current scale and scale modeconst scaleInfo = reportViewerRef.current.getScale();console.log("Scale:", scaleInfo.scale, "Scale mode:", scaleInfo.scaleMode);
````


## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})

