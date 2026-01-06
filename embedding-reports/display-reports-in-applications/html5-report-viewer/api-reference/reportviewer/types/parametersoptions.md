---
title: ParametersOptions
page_title: ParametersOptions Type
description: "Configuration options for report parameter editors and behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/parametersoptions
published: True
reportingArea: HTML5
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

# The `ParametersOptions` type of the HTML5 Report Viewer

Configuration options for report parameter editors and behavior.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| editors | `Object` | Allows the user to define editor types for report parameters. |
| editors.singleSelect | [`ParameterEditorTypes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/parametereditortypes%}) | Editor type for single-value parameters.<br>  - "COMBO_BOX": Uses a ComboBox widget as the editor.<br>  - "LIST_VIEW": Uses a ListView widget as the editor.<br>  - Default: "LIST_VIEW" |
| editors.multiSelect | [`ParameterEditorTypes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/parametereditortypes%}) | Editor type for multi-value parameters.<br>  - "COMBO_BOX": Uses a MultiSelect widget as the editor.<br>  - "LIST_VIEW": Uses a ListView widget as the editor.<br>  - Default: "LIST_VIEW" |

## Example

````JavaScript
// Specify editor types for parameters{  editors: {    singleSelect: "COMBO_BOX",    multiSelect: "LIST_VIEW"  }}
````

