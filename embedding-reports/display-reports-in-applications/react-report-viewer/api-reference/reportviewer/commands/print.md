---
title: print
page_title: print command
description: "Triggers the report printing."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/print
published: True
reportingArea: React
---

# The `print` command of the React Report Viewer

Triggers the report printing.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.print.exec()}>Print</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.print.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.print.checked();
````



