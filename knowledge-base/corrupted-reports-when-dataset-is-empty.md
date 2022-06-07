---
title: The Reports Are not Rendered or Generated Report Documents are Corrupted When the Data Set Comes Back Empty
description: Reports Without Data Result in No Page to Display in the Viewer or Designer and Corrupted Report Documents When Exporting
type: how-to
page_title: No Page to Display in the Viewer and Corrupted Report Documents When Exporting
slug: corrupted-reports-when-dataset-is-empty
position: 
tags: 
ticketid: 1520348
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>15.0.21.224+</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
After upgrading to the 15.0.21.224 or higher Reporting version, the reports that don't receive data may not be rendered.
In the older versions, the same reports would have the sections that don't display data as header and footer rendered. 

## Solution
The issue is caused by the change __Report rendering now skips the generated blank pages. Use the property *Report.SkipBlankPages* to control this behavior__ that 
we introduced with [R1 2021 SP1](../upgrade-path-2021-r1-sp1). The property default value is _True_, which prevents the report from rendering the report sections that 
don't contain data. In the case when there is no data returned at all, the entire report may not be rendered as explained in the article section 
[Skip Blank Pages in the Rendered Report](../designing-reports-page-layout-rendering-understanding-rendering-behaviors#skip-blank-pages-in-the-rendered-report).  

The solution is setting [SkipBlankPages](../p-telerik-reporting-processing-report-skipblankpages) of your Reports to __False__, which will revert the previous behavior.

### See Also
[Understanding Rendering Behaviors](../designing-reports-page-layout-rendering-understanding-rendering-behaviors)
