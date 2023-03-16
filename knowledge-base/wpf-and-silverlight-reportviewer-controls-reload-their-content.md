---
title: WPF and Silverlight ReportViewer controls reload their content.
description: The controls of the WPF and Silverlight ReportViewers reload their content. 
type: how-to
page_title: The content of the WPF and Silverlight ReportViewers is reload by their control widgets. 
slug: wpf-and-silverlight-reportviewer-controls-reload-their-content
res_type: kb
sitemap: false
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
    	<tr>
		<td>Report Viewers</td>
		<td>WPF, Silverlight</td>
	</tr>
</table>

> The Silverlight Report Viewer and its WCF Reporting Service are no longer supported and deployed with the installation of Telerik Reporting. The last release of Telerik Reporting with included Silverlight Report Viewer is [R1 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2023-17-0-23-118).

## Desctiption

WPF and Silverlight ReportViewer controls reload their content.

When you interact with the container of the WPF|Silverlight ReportViewer, like changing its dock position, there are changes in the elements loaded in the visual tree. The consequence for the WPF|Silverlight ReportViewer control is that the displayed report is re-processed and re-rendered.

## Solution

 Telerik UI for WPF and Telerik UI for Silverlight provide RadTabControl allowing you to preserve the content on interaction with tabs:   

- <a href="../../devtools/silverlight/controls/radtabcontrol/overview2" target="_blank">Telerik UI for Silverlight RadTabControl</a>
- <a href="../../devtools/wpf/controls/radtabcontrol/overview2" target="_blank">Telerik UI for WPF RadTabControl</a>

## See Also

<a href="../../devtools/wpf/controls/radtabcontrol/howto/how-to-keep-content" target="_blank">RadTabControl: How to Keep the Content State</a>.
