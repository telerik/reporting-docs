---
title: Run Time Problems. Cannot create an object of type 'Telerik.Reporting.Report' from its string representation.
description: Cannot create an object of type 'Telerik.Reporting.Report' from its string representation 'MyNameSpace.MyClass, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null' for the 'Report' property.
page_title: Cannot create an object of type 'Telerik.Reporting.Report' from its string representation.
slug: troubleshooting-runtime-cannot-create-an-object-of-type-telerik-reporting-report-from-its-string-representation
position: 
tags: 
ticketid: 
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
Cannot create an object of type 'Telerik.Reporting.Report' from its string representation 'MyNameSpace.MyClass, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null' for the 'Report' property.

## Solution
This error might occur if you are using __WebSite__ project (check for example [ASP.NET Website vs Web Application project](https://www.c-sharpcorner.com/uploadfile/kalisk/Asp-Net-website-vs-web-application-project/)) and you have the report class in the website directly. This is due to the fact that when using a website, after rebuild the following will always be different and it will not match with the originally assigned report: App_Code.**unch8s_n**. Thus we recommend following our [best practices]({%slug telerikreporting/welcome-to-telerik-reporting!%}) and have the report in a separate class library that is referenced in the aplication/website.
