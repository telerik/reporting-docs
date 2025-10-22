---
title: Optimizing ComboBox Loading with Large Data Sources in HTML5 Report Viewer
description: Learn how to optimize the loading performance of the ComboBox parameter editor in the HTML5 Report Viewer when dealing with large datasets.
type: how-to
page_title: Improving Performance of ComboBox in HTML5 Report Viewer with Large Datasets
meta_title: Enhancing ComboBox Performance in HTML5 Report Viewer for Large Data Sources
slug: optimizing-combobox-loading-html5-report-viewer-large-datasets
tags: reporting, html5 report viewer, combobox, parameter editor, optimization, large data source
res_type: kb
ticketid: 1701118
---

## Environment

<table>
    <tbody>
        <tr>
            <td> Product </td>
            <td> Progress® Telerik® Reporting </td>
            <td> Kendo UI for jQuery </td>
        </tr>
        <tr>
            <td> Version </td>
            <td> 19.2.25.1001 </td>
            <td> 2025.1.227 </td>
        </tr>
    </tbody>
</table>

## Description

I am experiencing performance issues with the ComboBox parameter editor in the [HTML5 Report Viewer](https://docs.telerik.com/reporting/html5-report-viewer). When the ComboBox is bound to a large dataset, the UI becomes slow. Clicking the ComboBox to open or select a value results in a noticeable delay. I need a solution to optimize the loading of the ComboBox when handling large data sources.

## Solution

To address slow performance with large datasets, implement a [custom parameter editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor%}) using the [Kendo UI for jQuery ComboBox with virtualization](https://www.telerik.com/kendo-jquery-ui/documentation/controls/combobox/virtualization). Virtualization renders records dynamically as you scroll, significantly improving load times.

Configure the `parameterEditors` option in the HTML5 Report Viewer to define the custom parameter editor:

````javascript
<script type="text/javascript">
        $(document).ready(function () {
            $("#reportViewer1")
                .telerik_ReportViewer({
                    // ...
                    parameterEditors: [{
                        match: function (parameter) {
                            return Boolean(parameter.availableValues);
                        },
                        createEditor: function (placeholder, options) {
                            const comboBoxElement = $(placeholder).html('<input />');
                            const valueChangedCallback = options.parameterChanged;
                            let parameter;
                            let comboBox;

                            function onChange() {
                                const val = comboBox.value();
                                valueChangedCallback(parameter, val);
                            }

                            return {
                                beginEdit: function (param) {
                                    parameter = param;
                                    $(comboBoxElement).kendoComboBox({
                                        dataTextField: "name",
                                        dataValueField: "value",
                                        value: parameter.value,
                                        dataSource: {
                                            data: parameter.availableValues,
                                            serverFiltering: false
                                        },
                                        virtual: {
                                            itemHeight: 26,
                                            valueMapper: function (options) {
                                                // Optional: map value to index if needed
                                                options.success([options.value]);
                                            }
                                        },
                                        height: 400,
                                        change: onChange
                                    });
                                    comboBox = $(comboBoxElement).data("kendoComboBox");
                                }
                            };
                        }
                    }],
                });
        });
</script>
````

## See Also

* [How to Create a Custom Parameter Editor in the Html5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor%})
- [Kendo UI for jQuery ComboBox Documentation](https://demos.telerik.com/kendo-ui/combobox/index)
- [ComboBox Virtualization](https://www.telerik.com/kendo-jquery-ui/documentation/controls/combobox/virtualization)