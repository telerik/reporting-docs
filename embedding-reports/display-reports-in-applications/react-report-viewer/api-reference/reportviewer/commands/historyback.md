---
title: historyBack
page_title: historyBack command
description: "Goes back to the previously rendered report from history."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/historyback
published: True
reportingArea: React
---

# The `historyBack` command of the React Report Viewer

Goes back to the previously rendered report from history.

## Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.historyBack.exec()}>Back</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.historyBack.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.historyBack.checked();
````



