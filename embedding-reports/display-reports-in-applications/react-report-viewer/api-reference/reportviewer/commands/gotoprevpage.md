---
title: goToPrevPage
page_title: goToPrevPage command
description: "Goes to the previous page of the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/gotoprevpage
published: True
reportingArea: React
---

# The `goToPrevPage` command of the React Report Viewer

Goes to the previous page of the report.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.goToPrevPage.exec()}>Previous</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.goToPrevPage.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.goToPrevPage.checked();
````



