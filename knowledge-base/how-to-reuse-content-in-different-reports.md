---
title: How to reuse content in different reports and update it on change
description: This article explains how to reuse content in different reports through Subreport
type: how-to
page_title: How to reuse content in different reports and update it on change
slug: how-to-reuse-content-in-different-reports
position: 
tags: 
ticketid: 1501400
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
Basically, the [Report Templates](../standalone-report-designer-report-templates) can be starting points for creating an initial report layout and styling. 
However, any modifications made to the template will not be reflected in the already created reports. 
This is due to the fact that each declarative report definition (i.e. TRDP/X file) is existing as a self-contained XML (or packed XML) file with 
all the necessary information held within the file. This behavior is by design and makes the created reports independent.

## Solution
For such a scenario, we would recommend the usage of the [Subreport](../report-items-sub-report) item. Let the subreport contain the common content for the (main) reports. 
Note that this content should be placed in the detail section of the report. After that, add a Subreport item to the reports which require the same content. If a change is needed
in the repeating content, you can easily make it in the subreport and it will be applied to all reports which contain it.

## Demo
You can visit our [GitHub Repository](https://github.com/telerik/reporting-samples/tree/master/Reuse%20content%20in%20different%20reports) which contains sample reports 
that demonstrate the approach and a video showing how it works.
