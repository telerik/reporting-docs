---
title: How to Show the Page Scroll Mode Button
page_title: How to Show the Page Scroll Mode Button | for Telerik Reporting Documentation
description: How to Show the Page Scroll Mode Button
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-show-the-page-scroll-mode-button
tags: how,to,show,the,page,scroll,mode,button
published: True
position: 5
---

# How to Show the Page Scroll Mode Button



This topic explains how to show the page scroll mode button in the HTML5 Viewer Toolbar Area       

## 

There are a few steps that should be done.

>tip All path references in the article should be adapted according             to your project setup. For more information please refer to the MSDN article              [ASP.NET Web Project Paths](http://msdn.microsoft.com/en-us/library/ms178116.aspx) The mentioned Report Viewer Template files are provided with your Telerik Reporting Installation -             [Installation Directories](6E821131-83F3-45A4-BB6E-1530223D1E38#directories-and-asemblies).           


## Step 1:

Find Telerik Report Viewer template in your installation folder located in:

__%programfiles(x86)%\Progress\Telerik Reporting__ 

Copy the template in your application folder

* __telerikReportViewerTemplate.html__ - if you use the default template

* __telerikReportViewerTemplate-FA.html__ - if you use Font Awesome template             

## Step 2:

Specify and resolve the templateUrl path of the HTML5 Viewer widget option to the copied template.

## Step 3:

Add buttons elements in your local template. There are two different elements that have to be added.

* For desktop screens.             Copy the following element in the __ul__  element with id attribute __trv-main-menu-ul__ 

   + For default template

	
      ````html
                      <li aria-label="ariaLabelMenuContinuousScroll"><a data-command="telerik_ReportViewer_pageMode" title="menuContinuousScrollTitle" href="#"><i class="t-font-icon t-i-scroll"></i></a></li>
````



   + For Font Awesome template

	
      ````html
                      <li aria-label="ariaLabelMenuContinuousScroll"><a data-command="telerik_ReportViewer_pageMode" title="menuContinuousScrollTitle" href="#"><i class="fa fa-angle-double-down icon-angle-double-down"></i></a></li>
````



* For mobile screensCopy the following element in __ul__  element with id attribute __trv-side-menu-ul__ 

   + For default template

	
      ````html
                    <li aria-label="ariaLabelMenuContinuousScroll"><a data-command="telerik_ReportViewer_pageMode" title="menuContinuousScrollTitle" href="#"><i class="t-font-icon t-i-scroll"></i><span>menuContinuousScrollText</span></a></li>
````



   + For Font Awesome template

	
      ````html
                    <li aria-label="ariaLabelMenuContinuousScroll"><a data-command="telerik_ReportViewer_pageMode" title="menuContinuousScrollTitle" href="#"><i class="fa fa-angle-double-down icon-angle-double-down"></i><span>menuContinuousScrollText</span></a></li>
````



# See Also


 * [Styling and Appearance]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/overview%})
