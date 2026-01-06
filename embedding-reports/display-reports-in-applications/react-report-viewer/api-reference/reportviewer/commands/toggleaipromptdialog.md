---
title: toggleAiPromptDialog
page_title: toggleAiPromptDialog command
description: "Shows or hides the AI prompt dialog."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/toggleaipromptdialog
published: True
reportingArea: React
---

# The `toggleAiPromptDialog` command of the React Report Viewer

Shows or hides the AI prompt dialog.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.toggleAiPromptDialog.exec()}>Toggle AI Prompt</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.toggleAiPromptDialog.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.toggleAiPromptDialog.checked();
````



