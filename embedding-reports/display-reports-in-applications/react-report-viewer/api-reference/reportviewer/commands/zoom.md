---
title: zoom
page_title: zoom command
description: "Zoom with a specified ratio. Accepts a zoom ratio as parameter: exec(1.5)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/zoom
published: True
reportingArea: React
---

# The `zoom` command of the React Report Viewer

Zoom with a specified ratio. Accepts a zoom ratio as parameter: exec(1.5).

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.zoom.exec(1.5)}>Zoom 150%</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.zoom.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.zoom.checked();
````



