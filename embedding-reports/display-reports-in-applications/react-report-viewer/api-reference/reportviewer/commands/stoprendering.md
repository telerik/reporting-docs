---
title: stopRendering
page_title: stopRendering command
description: "Stops the rendering of the current report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/stoprendering
published: True
reportingArea: React
---

# The `stopRendering` command of the React Report Viewer

Stops the rendering of the current report.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.stopRendering.exec()}>Stop Rendering</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.stopRendering.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.stopRendering.checked();
````

## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
