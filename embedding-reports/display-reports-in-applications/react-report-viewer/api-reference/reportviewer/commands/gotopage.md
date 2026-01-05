---
title: goToPage
page_title: goToPage command
description: "Goes to a specific page of the report. Accepts a page number as parameter: exec(pageNumber)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/gotopage
published: True
reportingArea: React
---

# The `goToPage` command of the React Report Viewer

Goes to a specific page of the report. Accepts a page number as parameter: exec(pageNumber).

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.goToPage.exec(5)}>Go to Page 5</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.goToPage.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.goToPage.checked();
````

