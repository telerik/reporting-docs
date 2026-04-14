---
title: Using DropDownList for Language Filter in Product Catalog
description: Learn how to configure the Product Catalog report in Telerik Reporting to display the Language filter as a DropDownList in the Report Viewer.
type: how-to
page_title: Configuring DropDownList for Language Filter in Product Catalog Report Viewer
meta_title: Configuring DropDownList for Language Filter in Product Catalog Report Viewer
slug: dropdownlist-filter-product-catalog-report-viewer
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
            <td>Version</td>
            <td>19.0.25.211</td>
        </tr>
    </tbody>
</table>

## Description

When using the Product Catalog report from Telerik Reporting in an ASP.NET Core application, the Language filter parameter is rendered as a list by default. To match the behavior of the online demo and display the Language filter as a DropDownList in the [HTML5 Report Viewer](https://docs.telerik.com/reporting/html5-report-viewer), modifications are required in the viewer's client-side configuration.

## Solution

To configure the Language filter as a DropDownList in the Product Catalog report, modify the Report Viewer initialization code as follows:

1. Open the `index.html` file or the location where the Report Viewer is configured.
2. Locate the `telerik_ReportViewer` initialization code.
3. Add the `parameters.editors` configuration to specify the editor type for the `singleSelect` and `multiSelect` parameters.

Here is an example configuration:

```javascript

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

### Notes
* Replace `#reportViewer1` with the ID of your Report Viewer instance if it is different.
* Ensure the `serviceUrl` points to the correct API endpoint for the report service.

The configuration above changes the parameter editor for single and multi-select parameters to use a DropDownList (Combo Box). After applying this change, the Language parameter will render as a DropDownList in the Report Viewer.

## See Also

* [HTML5 Report Viewer Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
* [Report Parameters in Telerik Reporting]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%})
* [Optimizing ComboBox Loading with Large Data Sources]({%slug optimizing-combobox-loading-html5-report-viewer-large-datasets%})
