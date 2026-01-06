---
title: export
page_title: export command
description: "Exports the report, using the respective rendering extension name. Accepts a rendering extension name as parameter: exec(\"PDF\"), exec(\"XLSX\"), etc."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/export
published: True
reportingArea: React
---

# The `export` command of the React Report Viewer

Exports the report, using the respective rendering extension name. Accepts a rendering extension name as parameter: exec("PDF"), exec("XLSX"), etc.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.export.exec('PDF')}>Export PDF</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.export.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.export.checked();
````



