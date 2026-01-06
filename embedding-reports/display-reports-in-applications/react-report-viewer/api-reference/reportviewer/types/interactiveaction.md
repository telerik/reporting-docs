---
title: InteractiveAction
page_title: InteractiveAction Type
description: "Describes an interactive action triggered by the user in the report viewer. The shape of the `Value` property depends on the action `Type`."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/interactiveaction
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
</style>

# The `InteractiveAction` type of the React Report Viewer

Describes an interactive action triggered by the user in the report viewer. The shape of the `Value` property depends on the action `Type`.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Id | `string` | The identifier of the action (a GUID). |
| Type | `string` | The type of the action. One of:<br>  "sorting", "toggleVisibility", "navigateToUrl", "navigateToBookmark", "navigateToReport", "customAction". |
| ReportItemName | `string` | The name of the report item associated with the action. |
| Value | `Object` | Additional data for the action, depending on the Type:<br>  - For "navigateToUrl": { Url: string, Target: "NewWindow"|"SameWindow" }<br>  - For "navigateToBookmark": string (the target bookmark)<br>  - For "navigateToReport": { report: string, parameters: Object }<br>  - For "customAction": { Parameters: Object } |

