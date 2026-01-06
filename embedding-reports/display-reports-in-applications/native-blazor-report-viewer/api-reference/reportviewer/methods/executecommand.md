---
title: ExecuteCommand
page_title: The ExecuteCommand method of the Native Blazor Report Viewer explained
description: "Learn more about the ExecuteCommand method of the Native Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/executecommand
tags: executecommand
published: True
reportingArea: NativeBlazor
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

    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `ExecuteCommand` method of the Native Blazor Report Viewer

Executes a predefined command with an additional value argument. The available commands are: 'SetAuthenticationToken' - Sets the token that will be used in the Authorization header of the requests made by the viewer. 'Export' - Exports the report, using the respective rendering extension name, such as 'PDF'.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| commandName | `System.String` | No | The name of the command |
| commandValue | `System.String` | No | The value of the command, if needed |

