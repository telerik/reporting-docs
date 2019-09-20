---
title: Parameter Values in WebServiceDataSource are not Passed Correctly
description: The parameters of the WebServiceDataSource are not passed correctly
type: troubleshooting
page_title: Parameters are passed incorrectly in WebServiceDataSource
slug: parameters-passed-incorrectly-in-webservicedatasource
position: 
tags: 
ticketid: 1430412
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.2.19.918</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Error
### _Response status code does not indicate success: 400 (Bad Request)_

## Description
If Parameters are used in the WebServiceDataSource, they are not translated into correct values in the resulting http request.

## Cause\Possible Cause(s)
This is a bug introduced with the optimization __Reuse data sources' raw data between the data items in a report__ from [Telerik Reporting R3 2019 (13.2.19.918)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2019-13-2-19-918). It is specific for this version.

## Solution
The issue is fixed in the Internal Build [Telerik Reporting R3 2019 SP1 13.2.19.920](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2019-sp1-13-2-19-920). You should upgrade to this version or downgrade to a version prior to R3 2019 to overcome the problem.
