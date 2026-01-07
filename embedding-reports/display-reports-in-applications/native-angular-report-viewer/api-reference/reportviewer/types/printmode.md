---
title: types.PrintMode
page_title: types.PrintMode Type
description: "Print mode options for the Native Angular Report Viewer. Controls how reports are printed, with different modes for handling PDF plugins. The available print modes are: - 'autoSelect': the viewer should automatically decide which option for printing to use depending on browser's version and whether the PDF plug-in is available or not. - 'forcePDFFile': the document for printing will be downloaded as a file (in PDF format with a special 'print' script enabled). - 'forcePDFPlugin': the viewer should always use the PDF plug-in."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/printmode
published: True
reportingArea: NativeAngular
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `PrintMode` type of the Native Angular Report Viewer

Print mode options for the Native Angular Report Viewer.
Controls how reports are printed, with different modes for handling PDF plugins. The available print modes are:

- 'autoSelect': the viewer should automatically decide which option for printing to use depending on browser's version
and whether the PDF plug-in is available or not.
- 'forcePDFFile': the document for printing will be downloaded as a file (in PDF format with a special 'print' script enabled).
- 'forcePDFPlugin': the viewer should always use the PDF plug-in.

## Type Definition

````typescript
type PrintMode = "autoSelect" | "forcePDFPlugin" | "forcePDFFile";
````

