---
title: ParametersOptions
page_title: ParametersOptions Type
description: "Defines options for configuring report parameter editors in the React Report Viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/parametersoptions
published: True
reportingArea: React
---

# The `ParametersOptions` type of the React Report Viewer

Defines options for configuring report parameter editors in the React Report Viewer.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| editors | `Object` | Allows you to specify the editor type for single-value and multi-value report parameters. |
| editors.singleSelect | `string` | Editor type for single-value parameters.<br>  - "COMBO_BOX": Uses a ComboBox widget as the editor.<br>  - "LIST_VIEW": Uses a ListView widget as the editor.<br>  - Default: "LIST_VIEW" |
| editors.multiSelect | `string` | Editor type for multi-value parameters.<br>  - "COMBO_BOX": Uses a MultiSelect widget as the editor.<br>  - "LIST_VIEW": Uses a ListView widget as the editor.<br>  - Default: "LIST_VIEW" |

## Example

````JavaScript
// React: Specify editor types for report parameters<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  parameters={{    editors: {      singleSelect: "COMBO_BOX",      multiSelect: "LIST_VIEW"    }  }}/>
````

## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
