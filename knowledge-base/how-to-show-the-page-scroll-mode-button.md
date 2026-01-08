---
title: Showing the Page Scroll Mode Button
page_title: Showing the Scroll Mode Button of the Page
description: "Learn how to show the Scroll Mode button on the page when using Telerik Reporting in web applications."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-show-the-page-scroll-mode-button
tags: telerik, reporting, showing, the, page, scroll, mode, button
previous_url: /using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-show-the-page-scroll-mode-button
published: True
type: how-to
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
			<td>Version</td>
			<td>Q2 2012 and later</td>
		</tr>
	   <tr>
			<td>Report Viewers</td>
			<td>HTML5-Based Web Viewers</td>
		</tr>
	</tbody>
</table>

## Description

How can I show the **Scroll** mode button of the page in the HTML5 Viewer toolbar area?

## Solution

To achieve the required scenario, accomplish the following steps. Note that you have to adapt all path references in the article according to your project setup. For more information, refer to the [ASP.NET Web Project Paths](http://msdn.microsoft.com/en-us/library/ms178116.aspx) MSDN article. The mentioned Report Viewer Template files are provided with your [Telerik Reporting Installation]({%slug telerikreporting/installation%}#directories-and-asemblies).

1. Find the Telerik Report Viewer template in your installation folder located in `C:\Program Files (x86)\Progress\Telerik Reporting R1 2022\Html5\ReportViewer\templates`.

1. Copy the template in your application folder. If you are using the default template, copy the template in `telerikReportViewerTemplate-16.0.22.119.html`. If you are using a Font Awesome template, copy the template in `telerikReportViewerTemplate-FA-16.0.22.119.html`.

1. Specify and resolve the `templateUrl` path of the HTML5 Viewer widget option to the copied template.

1. Add buttons elements in your local template. The following elements have to be added:

    * (For desktop screens, default template) Copy the following element in the `ul` element with the `trv-main-menu-ul` id attribute.

    ````html
    <li aria-label="ariaLabelMenuContinuousScroll"><a data-command="telerik_ReportViewer_pageMode" title="menuContinuousScrollTitle" href="#"><i class="t-font-icon t-i-scroll"></i></a></li>
    ````

    * (For desktop screens, Font Awesome template) Copy the following element in the `ul` element with the `trv-main-menu-ul` id attribute.

    ````html
    <li aria-label="ariaLabelMenuContinuousScroll"><a data-command="telerik_ReportViewer_pageMode" title="menuContinuousScrollTitle" href="#"><i class="fa fa-angle-double-down icon-angle-double-down"></i></a></li>
    ````

    * (For mobile `screensCopy`, default template) Copy the following element in the `ul` element with the `trv-side-menu-ul` id attribute.

    ````html
    <li aria-label="ariaLabelMenuContinuousScroll"><a data-command="telerik_ReportViewer_pageMode" title="menuContinuousScrollTitle" href="#"><i class="t-font-icon t-i-scroll"></i><span>menuContinuousScrollText</span></a></li>
    ````

    * (For mobile `screensCopy`, Font Awesome template) Copy the following element in the `ul` element with the `trv-side-menu-ul` id attribute.

    ````html
    <li aria-label="ariaLabelMenuContinuousScroll"><a data-command="telerik_ReportViewer_pageMode" title="menuContinuousScrollTitle" href="#"><i class="fa fa-angle-double-down icon-angle-double-down"></i><span>menuContinuousScrollText</span></a></li>
    ````

## See Also

* [Styling and Appearance]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/overview%})
