---
title: zoomOut
page_title: zoomOut command
description: "Zoom-out the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/zoomout
published: True
reportingArea: React
---

# The `zoomOut` command of the React Report Viewer

Zoom-out the report.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.zoomOut.exec()}>Zoom Out</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.zoomOut.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.zoomOut.checked();
````



