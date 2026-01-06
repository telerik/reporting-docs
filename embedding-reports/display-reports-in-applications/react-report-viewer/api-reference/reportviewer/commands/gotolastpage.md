---
title: goToLastPage
page_title: goToLastPage command
description: "Goes to the last page of the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/gotolastpage
published: True
reportingArea: React
---

# The `goToLastPage` command of the React Report Viewer

Goes to the last page of the report.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.goToLastPage.exec()}>Last Page</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.goToLastPage.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.goToLastPage.checked();
````



