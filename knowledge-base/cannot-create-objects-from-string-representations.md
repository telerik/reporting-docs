---
title: Cannot Create Objects from String Representations for the Report Property  
page_title: Cannot Create Objects from String Representations in the Report Property
description: "Learn how to create an object of a specific type from its string representation for the Report property when working with Telerik Reporting."
slug: cannot-create-objects-from-string-representations
tags: telerik, reporting, run, time, cannot, create, objects- from, their, string, representations, in, report, property
previous_url: /troubleshooting/run-time
published: False
component:
type: troubleshooting
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
			<td>WinForms, WPF, ASP.NET</td>
		</tr>
	</tbody>
</table>

## Description

Cannot create an object of type `Telerik.Reporting.Report` from its string representation `MyNameSpace.MyClass, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null` for the `Report` property.

## Cause

This error might occur if you are using website and you have the report class in the website directly.

## Solution  

The issue is due to the fact that when using a website, after rebuild, the following will always be different and it will not match with the originally assigned report: `App_Code.__unch8s_n__`. It is recommended that you follow the [best practices](66CD7D60-7708-42D5-8BB4-506676E8679E) and have the report in a separate class library that is referenced in the application or website.         
