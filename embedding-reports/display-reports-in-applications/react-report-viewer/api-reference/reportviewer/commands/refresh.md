---
title: refresh
page_title: refresh command
description: "Refreshes the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/refresh
published: True
reportingArea: React
---

# The `refresh` command of the React Report Viewer

Refreshes the report.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.refresh.exec()}>Refresh</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.refresh.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.refresh.checked();
````

