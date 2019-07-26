---
title: An Error Occurs When the WPF Themes are Referred Locally
description: The WPF themes cannot be referred locally from a folder in the project with error message An error occurred while finding the resource dictionary /Themes/Office2016/Telerik.ReportViewer.Wpf.xaml. WinCont App.xaml
type: troubleshooting
page_title: An Error Occurs When the WPF Themes are Referred Locally
slug: error-occurs-when-the-wpf-themes-are-referred-locally
position: 
tags: WPF
ticketid: 1412485
res_type: kb
---

## Environment
<table>
    <tbody>
	    <tr>
	    	<td>Product Version</td>
	    	<td>12.1.18.620+</td>
	    </tr>
	    <tr>
	    	<td>Product</td>
	    	<td>Progress® Telerik® Reporting</td>
	    </tr>
    </tbody>
</table>


## Error Message
*An error occurred while finding the resource dictionary "/Themes/Office2016/Telerik.ReportViewer.Wpf.xaml". WinCont App.xaml*

## Cause\Possible Cause(s)
The XAML designer locks the theme files and they cannot be accessed by the application.

## Solution
To prevent the undesired outcome, navigate to **Tools** -> **Options** ->**XAML Desginer** -> uncheck **Enable XAML Designer**. Restart the Visual Studio afterward. 
