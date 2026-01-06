---
title: getReportSource
page_title: The getReportSource method of the Angular Report Viewer explained
description: "Learn more about the getReportSource method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getreportsource
tags: getreportsource
published: True
reportingArea: AngularWrapper
position: 2
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th {
        white-space: nowrap;
    }
</style>

# The `getReportSource` method of the Angular Report Viewer

Gets the current report source (report and parameters). Object containing report and parameters properties

## Example

````typescript
const source = viewer.getReportSource();
console.log(source.report); // Report identifier
console.log(source.parameters); // Report parameters
````

