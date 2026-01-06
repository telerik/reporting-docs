---
title: goToNextPage
page_title: goToNextPage command
description: "Goes to the next page of the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/gotonextpage
published: True
reportingArea: React
---

# The `goToNextPage` command of the React Report Viewer

Goes to the next page of the report.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.goToNextPage.exec()}>Next</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.goToNextPage.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.goToNextPage.checked();
````



