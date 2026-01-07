---
title: toggleParametersArea
page_title: toggleParametersArea command
description: "Shows or hides the parameters area."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/toggleparametersarea
published: True
reportingArea: React
---

# The `toggleParametersArea` command of the React Report Viewer

Shows or hides the parameters area.

## Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.toggleParametersArea.exec()}>Toggle Parameters</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.toggleParametersArea.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.toggleParametersArea.checked();
````

## See Also

* [Commands Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/overview%})
* [togglePrintPreview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/toggleprintpreview%})
* [toggleSearchDialog]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/togglesearchdialog%})

