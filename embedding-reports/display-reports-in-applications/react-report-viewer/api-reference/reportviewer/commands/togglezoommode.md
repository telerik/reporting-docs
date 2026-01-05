---
title: toggleZoomMode
page_title: toggleZoomMode command
description: "Changes the zoom mode of the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/togglezoommode
published: True
reportingArea: React
---

# The `toggleZoomMode` command of the React Report Viewer

Changes the zoom mode of the report.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.toggleZoomMode.exec()}>Toggle Zoom Mode</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.toggleZoomMode.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.toggleZoomMode.checked();
````

## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
