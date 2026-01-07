---
title: ParameterEditorInstance
page_title: ParameterEditorInstance Type
description: "Represents the API of a parameter editor instance returned by createEditor."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/parametereditorinstance
published: True
reportingArea: React
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

# The `ParameterEditorInstance` type of the React Report Viewer

Represents the API of a parameter editor instance returned by createEditor.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| beginEdit | `function` | Creates the editor UI and populates it with the parameter settings. |
| addAccessibility | `function` | Adds accessibility to the parameter editor and populates its string resources. |
| setAccessibilityErrorState | `function` | Sets the error state of the parameter editor's accessibility functionality and its error attributes. |
| enable | `function` | Enables or disables the parameter editor. |
| clearPendingChange | `function` | Invoked when parameter changes (optional, not present on all editors). |
| destroy | `function` | Invoked to destroy the parameter editor (optional, not present on all editors). |

