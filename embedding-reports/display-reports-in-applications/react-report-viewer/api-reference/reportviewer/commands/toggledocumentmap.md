---
title: toggleDocumentMap
page_title: toggleDocumentMap command
description: "Shows or hides the document map."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/toggledocumentmap
published: True
reportingArea: React
---

# The `toggleDocumentMap` command of the React Report Viewer

Shows or hides the document map.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.toggleDocumentMap.exec()}>Toggle Document Map</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.toggleDocumentMap.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.toggleDocumentMap.checked();
````



