---
title: Custom Parameter Editors are not Displayed when Accessibility is Enabled in the Html5 Report Viewer
description: If you use Custom Parameter Editors with enabled Accessibility in the Html5 Report Viewer, the Parameters Area is not displayed
type: how-to
page_title: Parameters Area Disappears when you use Custom Parameter Editors with Enabled Accessibility
slug: html5-viewer-custom-parameter-editors-disappear-when-accessibility-is-enabled
position: 
tags: 
ticketid: 1537567
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>15.2.21.915 and older</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
If you create a [Custom Parameter Editor](../html5-report-viewer-howto-custom-parameter-editor) and enable Accessibility for the viewer (_enableAccessibility: true_), 
the result is an empty parameters area. There is no trace of the parameters in the HTML DOM either.
The issue is logged in our public feedback portal - [The Html5 Viewer Parameters area disappears when using Custom Editor Parameters and EnableAccessibility is True](https://feedback.telerik.com/reporting/1537926-html5-viewer-parameters-area-disappears-when-using-custom-editor-parameters-and-enableaccessibility-is-true). 

## Suggested Workarounds
The reason for the problem is that the custom editor lacks two functions related to accessibility:

```JavaScript
addAccessibility: function (param) { },
setAccessibilityErrorState: function (param) { }
```

You need to add them in order to work around the problem.
For example, here is the updated sample code for the custom parameter editor with empty bodies for the above functions: 

``` JavaScript
<script type="text/javascript">
      $("#reportViewer1")
            .telerik_ReportViewer({           
                parameterEditors: [
                    {
                        match: function (parameter) {
                            return Boolean(parameter.availableValues) && !parameter.multivalue;
                        },

                        createEditor: function (placeholder, options)  {
                            var dropDownElement = $(placeholder).html('<div></div>'),
                                      parameter,
                                      valueChangedCallback = options.parameterChanged,
                                      dropDownList;

                                      function onChange() {
                                     var val = dropDownList.value();
                                    valueChangedCallback(parameter, val);
                                     }

                            return {
                                beginEdit: function (param) {

                                    parameter = param;

                                    $(dropDownElement).kendoDropDownList({
                                        dataTextField: "name",
                                        dataValueField: "value",
                                      value: parameter.value,
                                        dataSource: parameter.availableValues,
                                        change: onChange
                                    });

                                    dropDownList = $(dropDownElement).data("kendoDropDownList");
                                },
                                addAccessibility: function (param) { },
                                setAccessibilityErrorState: function (param) { }	
                            };
                        }
                  }]
            });        
</script>
```
Note that the accessibility feature won't work for the custom editors with this implementation.
