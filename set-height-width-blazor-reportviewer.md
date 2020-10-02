---
title: How to Set the Height and Width of the Blazor Report Viewer
description: How to set the position, height, and width of the Blazor Report Viewer
type: how-to
page_title: Setting the Height and Width of the Blazor Report Viewer
slug: set-height-width-blazor-reportviewer
position: 
tags: 
ticketid: 1479639
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>14.1.20.618</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
How to set the height and width of the ReportViewer component?

## Solution
The Blazor Report Viewer is nested inside a `div` element and will resize itself based on the `div`'s width and height. 
The article [How to Use Blazor Report Viewer](https://docs.telerik.com/reporting/blazor-report-viewer-how-to-use) demonstrates one possible approach: 
a `style` element with the following code:

```
<style>
    #rv1 {
        position: relative;
        width: 1200px;
        height: 600px;
    }

</style>
```
Depending on your application's requirements, you can adjust the position, for example:

```
<style>
   #rv1 {
            width: 85%;
            height: 90%;
            position: absolute;
        }
</style>
```
This solution represents only one of many possible answers that depend on the page's DOM and other CSS configuration. 
