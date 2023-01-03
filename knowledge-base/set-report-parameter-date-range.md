---
title: Restrict report date parameters to a specific range
description: How to add a max range to a DateTime Report Parameter
type: how-to
page_title: Limit the date selection range of a DateTime Report Parameter 
slug: set-report-parameter-date-range
position: 
tags: 
ticketid: 1590408
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress Telerik Reporting</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>HTML5-based Report Viewers</td>
		</tr>
	</tbody>
</table>


## Description

> note Preliminary knowledge about implementing custom parameter editors is expected in order to fully understand and implement the approach showcased in this article - [How to Create a Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor%})

In some scenarios, one might want to set the [Max](https://docs.telerik.com/kendo-ui/api/javascript/ui/datepicker/configuration/max) date of a `DateTime` report parameter based on the selected date of another `DateTime` report parameter, essentially creating a range of dates that an end-user can pick from.

Let's imagine a report that has two `DateTime` Report Parameters with the following settings:

- The first report parameter will have its [Name](/reporting/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_Name) set to the value `DateRangeParam1` while its [Text](/reporting/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_Text) property can be equal to `First date` 

- The second report parameter will have its [Name](/reporting/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_Name) set to the value `DateRangeParam2` while its [Text](/reporting/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_Text) property can be equal to `Second date`

>note In order to be able to use the code below without making changes to it, your report parameter should have their __Names__ and __Texts__ as clarified above

In order to add a range between those two DateTime report parameters, it is necessary to have access to the current value of the `Start date` report parameter. That is because the `max date` of the second report parameter will depend on the value of the first. 

The only way to have access to the value of the first parameter every time that it changes is to create our own parameter editors as shown in the [How to Create a Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor%}) article. We can re-use the kendo [DatePIcker](https://demos.telerik.com/kendo-ui/datepicker/index) since it comes with the ability to specify a [max](https://docs.telerik.com/kendo-ui/api/javascript/ui/datepicker/methods/max) date out of the box.

## Solution

In the end, the code for the custom `match` function and the custom `createEditor` functions may look as follows:

```JavaScript
$("#reportViewer1")
                .telerik_ReportViewer({
                    serviceUrl: "api/reports/",                  
                    reportSource: {
                        report: "ReportDateRange.trdp",
                    },
                    parameterEditors: [
						{
                        match: customMatch,
                        createEditor: createCustomEditor
                       }
                    ],
					//set the initial max date when the report viewer loads
                    renderingEnd: function (e, args) {
                        var firstDate = getDatePicker("First date").value();
                        var dateCopy = new Date(firstDate);
                        var newDate = new Date(dateCopy.setMonth(dateCopy.getMonth() + 3));

                        getDatePicker("Second date").max(newDate);
                    }
                });
        }).data("telerik_ReportViewer");

        function customMatch(parameter) {
			// Setting the name exactly to DateRangeParam1(or another name that you prefer) is important in order to do this check
            return parameter.type === "System.DateTime" && parameter.name === "DateRangeParam1" ;
        }

        function createCustomEditor(placeholder, options) {

            $(placeholder).html('<input type="datetime"/>');
            var datePicker = $(placeholder),
                parameter,
                valueChangedCallback = options.parameterChanged;

            function onChange(e) {
                var datePickerEndDate = getDatePicker("Second date");

                var dtv = this.value();
                var dateCopy = new Date(dtv);
				// for this example, we add a range of 3 months from the first date
                var newMaxDate = new Date(dateCopy.setMonth(dateCopy.getMonth() + 3));

                datePickerEndDate.max(newMaxDate);

				//timezone needs adjustments, see the function code down below
                valueChangedCallback(parameter, adjustTimezone(dtv));
            }

            return {
                beginEdit: function (param) {
                    parameter = param;

                    var date = null;
                    try {
                        if (param.value) {
                            date = param.value;
                            date = unadjustTimezone(date);
                        }
                    } catch (e) {
                        date = null;
                    }

                    $(datePicker).find("input").kendoDatePicker({
                        change: onChange,
                        value: date
                    });

                    datePicker = $(datePicker).find("input").data("kendoDatePicker");
                }
            };
        }

		function adjustTimezone(date) {
            return new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds(), date.getMilliseconds()));
        }

        function unadjustTimezone(date) {
            return new Date(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate(), date.getUTCHours(), date.getUTCMinutes(), date.getUTCSeconds(), date.getUTCMilliseconds());
        }

		function getDatePicker(dateText) {
            return $(`.trv-parameter-header div[title='${dateText}']`)
                .parent().parent().find(".trv-parameter-value input").data("kendoDatePicker");
        }
```

## Notes

Looking at the code in the solution, one might wonder why do we need to both set the max of the second DatePicker in both the [`change`](https://docs.telerik.com/kendo-ui/api/javascript/ui/datepicker/events/change) event of the start date widget and in the [`renderingEnd`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)%}) event of the report viewer.

The reason is that this article's goal is to make sure it works in preferably all scenarios. If both report parameters have their [`AutoRefresh`](/reporting/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_AutoRefresh) property set to `True`, when the start date is updated, the report viewer will re-render and thus `renderingEnd` will be fired and the max date of the second date parameter will update. In such a scenario, the custom parameter editor is most likely unnecessary.

However, if [`AutoRefresh`](/reporting/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_AutoRefresh) is `False`, then the only way to know when the first date widget will update is if we have access to its `change` event, thus in this scenario it is necessary to also have the custom parameter editor functions.

What is certain is that in any case, the `renderingEnd` event function is necessary because in both scenarios, we need to set the initial max date of the second widget.

## See Also

* [How to Create a Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor%})
