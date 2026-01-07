---
title: goToFirstPage
page_title: goToFirstPage command
description: "Goes to the first page of the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/gotofirstpage
published: True
reportingArea: React
---

# The `goToFirstPage` command of the React Report Viewer

Goes to the first page of the report.

## Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.goToFirstPage.exec()}>First Page</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.goToFirstPage.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.goToFirstPage.checked();
````



