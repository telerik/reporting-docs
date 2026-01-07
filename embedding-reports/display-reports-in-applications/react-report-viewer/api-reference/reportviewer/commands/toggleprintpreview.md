---
title: togglePrintPreview
page_title: togglePrintPreview command
description: "Toggles between Print Preview and Interactive view modes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/toggleprintpreview
published: True
reportingArea: React
---

# The `togglePrintPreview` command of the React Report Viewer

Toggles between Print Preview and Interactive view modes.

## Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.togglePrintPreview.exec()}>Toggle Print Preview</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.togglePrintPreview.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.togglePrintPreview.checked();
````



