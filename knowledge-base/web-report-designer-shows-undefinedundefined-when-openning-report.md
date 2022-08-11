---
title: Web Report Designer Open Shows "undefinedundefined" for All Files with Custom IDefinitionStorage
description: Web Report Designer Open Shows "undefinedundefined" for all files with custom IDefinitionStorage
type: troubleshooting
page_title: Web Report Designer Shows "undefinedundefined" when Openning Report
slug: web-report-designer-shows-undefinedundefined-when-openning-report
position: 
tags: 
ticketid: 1558712
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Designer</td>
			<td>Web Report Designer</td>
		</tr>
	</tbody>
</table>


## Description
When using a custom IDefinitionStorage, clicking **Menu** -> **Open** brings up the **FileManager** which displays the correct number of reports.
However, all reports  show "undefinedundefined" when you try to open them. 
The call to reports returns ["Report1.trdp", "Report2.trdp"], switching to the List layout display "NaN" for each report.
When you click a report to open it, this closes the FileManager, but does not open the selected report.


## Cause\Possible Cause(s)
The problem is caused when kendo.aspnetmvc.js is added. Once this script is included, 
the in the **convertRecords** function of kendo.data.js, 
the call to **modelInstance._parse assumes** that the properties are uppercase and returns undefined instead of the value.

## Solution
You need to modify the **translateAggregateResults** function in the kendo.data.js as follows:

````JavaScript
function translateAggregateResults(aggregate) {
            var obj = {};
            // LSS: support for camel case serialization
            obj[(aggregate.AggregateMethodName || aggregate.aggregateMethodName).toLowerCase()] = (aggregate.Value || aggregate.value);
            return obj;
        }
        function translateAggregate(aggregates) {
            var functionResult = {}, key, functionName, aggregate;
            for (key in aggregates) {
                functionResult = {};
                aggregate = aggregates[key];
                for (functionName in aggregate) {
                    functionResult[functionName.toLowerCase()] = aggregate[functionName];
                }
                aggregates[key] = functionResult;
            }
            return aggregates;
        }
        function convertAggregates(aggregates) {
            var idx, length, aggregate;
            var result = {};
            for (idx = 0, length = aggregates.length; idx < length; idx++) {
                aggregate = aggregates[idx];
                // LSS: support for camel case serialization
                result[(aggregate.Member || aggregate.member)] = extend(true, result[(aggregate.Member || aggregate.member)], translateAggregateResults(aggregate));
            }
            return result;
        }
        extend(true, kendo.data, {
            schemas: {
                'aspnetmvc-ajax': {
                    groups: function (data) {
                        return $.map(this._dataAccessFunction(data), translateGroup);
                    },
                    aggregates: function (data) {
                        data = data.d || data;
                        // LSS: support for camel case serialization
                        var aggregates = data.AggregateResults || data.aggregateResults || [];
                        if (!$.isArray(aggregates)) {
                            for (var key in aggregates) {
                                aggregates[key] = convertAggregates(aggregates[key]);
                            }
                            return aggregates;
                        }
                        return convertAggregates(aggregates);
                    }
                }
            }
        });
````

