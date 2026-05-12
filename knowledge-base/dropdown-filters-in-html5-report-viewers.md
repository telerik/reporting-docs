---
title: Using DropDowns for Filters in the HTML5 Report Viewer
description: "Learn how to configure the HTML5 Report Viewer to display the report parameter filters as DropDowns in Telerik Reporting."
type: how-to
page_title: Using DropDowns for Filters in the HTML5 Report Viewer
meta_title: Using DropDowns for Filters in the HTML5 Report Viewer
slug: dropdown-filters-in-html5-report-viewers
tags: reporting, report-viewer, filter, dropdownlist, parameters
res_type: kb
ticketid: 1712930
---

## Environment

<table>
    <tbody>
        <tr>
            <td>Product</td>
            <td>Reporting</td>
        </tr>
        <tr>
            <td>Report Viewer</td>
            <td>HTML5, HTML5 Wrappers</td>
        </tr>
    </tbody>
</table>

## Description

By default, the visible report parameters, or in other words - "filters", that have available values, are displayed as lists in the report viewer. I wish to display the single/multi-select filters as dropdowns instead.

## Solution

To use dropdowns, the parameter editors used by the HTML5 Report Viewer can be changed to Kendo for jQuery's [ComboBox](https://demos.telerik.com/kendo-ui/combobox/index) widget with the following code:

```js
$("#reportViewer1")
    .telerik_ReportViewer({
        serviceUrl: "api/reports/",
        reportSource: {
            report: "Product Catalog.trdp",
        },
        parameters: {
            editors: {
                singleSelect: telerikReportViewer.ParameterEditorTypes.COMBO_BOX,
                multiSelect: telerikReportViewer.ParameterEditorTypes.COMBO_BOX,
            }
        },
    });

```

* Replace `#reportViewer1` with the ID of your Report Viewer instance if it is different.
* Ensure the `serviceUrl` points to the correct API endpoint for the reporting service.

