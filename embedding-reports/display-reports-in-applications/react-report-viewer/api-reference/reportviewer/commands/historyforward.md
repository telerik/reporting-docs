---
title: historyForward
page_title: historyForward command
description: "Goes forward to the next rendered report from history."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/historyforward
published: True
reportingArea: React
---

# The `historyForward` command of the React Report Viewer

Goes forward to the next rendered report from history.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.historyForward.exec()}>Forward</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.historyForward.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.historyForward.checked();
````



