---
title: How to Modify the Layout of the Parameters Area
description: Modify the Parameter Area Layout in an HTML5 Report Viewer
type: how-to
page_title: Customize the Parameters Area through CSS
slug: modify-parameter-area-html5-viewer
position:
tags:
ticketid: 1490093
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
			<td>Report Viewer</td>
			<td>HTML5 ASP.NET MVC</td>
		</tr>
	</tbody>
</table>

## Description

If a report contains a **Parameters Area** with a large list of values, you may need to limit the visible values in the **HTML5 Report Viewer**. As a result, the user has to scroll to see all available values.

## Solution

Apply custom CSS to the **Parameters Area** containers. For example:

```CSS
.trv-parameter-editor-available-values .k-listview {
    max-height: 100px !important;
    overflow: scroll !important;
}
```

## See Also

[Customizing the HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/overview%})
