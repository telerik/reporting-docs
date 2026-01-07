---
title: zoomIn
page_title: zoomIn command
description: "Zoom-in the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/zoomin
published: True
reportingArea: React
---

# The `zoomIn` command of the React Report Viewer

Zoom-in the report.

## Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.zoomIn.exec()}>Zoom In</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.zoomIn.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.zoomIn.checked();
````

## See Also

* [Commands Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/overview%})
* [zoomOut]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/zoomout%})
* [export]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/export%})

