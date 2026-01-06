---
title: toggleSideMenu
page_title: toggleSideMenu command
description: "Shows or hides the side menu."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/togglesidemenu
published: True
reportingArea: React
---

# The `toggleSideMenu` command of the React Report Viewer

Shows or hides the side menu.

## Example

````JavaScript
// Execute the commandlet viewer;ReactDOM.render(    <>        <TelerikReportViewer />        <button onClick={() => viewer.commands.toggleSideMenu.exec()}>Toggle Side Menu</button>    </>);
````

````JavaScript
// Check if the command is enabledconst isEnabled = viewer.commands.toggleSideMenu.enabled();
````

````JavaScript
// Check if the command is checkedconst isChecked = viewer.commands.toggleSideMenu.checked();
````



