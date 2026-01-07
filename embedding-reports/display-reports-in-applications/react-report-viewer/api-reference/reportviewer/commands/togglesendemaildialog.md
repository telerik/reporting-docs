---
title: toggleSendEmailDialog
page_title: toggleSendEmailDialog command
description: "Shows or hides the send email dialog."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/togglesendemaildialog
published: True
reportingArea: React
---

# The `toggleSendEmailDialog` command of the React Report Viewer

Shows or hides the send email dialog.

## Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.toggleSendEmailDialog.exec()}>Toggle Send Email</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.toggleSendEmailDialog.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.toggleSendEmailDialog.checked();
````



