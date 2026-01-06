---
title: toggleSearchDialog
page_title: toggleSearchDialog command
description: "Shows or hides the search dialog."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/togglesearchdialog
published: True
reportingArea: React
---

# The `toggleSearchDialog` command of the React Report Viewer

Shows or hides the search dialog.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.toggleSearchDialog.exec()}>Toggle Search</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.toggleSearchDialog.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.toggleSearchDialog.checked();
````



