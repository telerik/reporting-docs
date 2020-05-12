---
title: How to fix ReportsControllerBase is obsolete warning
description: Such warning can appear in .NET Core application after upgrade
type: troubleshooting
page_title: How to Fix: ReportsControllerBase is Obsolete
slug: how-to-fix-reportscontrollerbase-is-obsolete
position: 
tags: ASP.NET Core, HTML5Viewer
res_type: kb
---


## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>14.0.20.115+</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
In [R1 2020](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2020-14-0-20-115) we made some improvements and now you can use Dependency Injection and pass the configuration settings in the constructor of the ReportsController.


## Error Message
 ReportsControllerBase is obsolete

## Cause\Possible Cause(s)
Upgrade to version to 14.0.20.115+

## Solution
1. Change the ReportsController as follows:
```CSharp
public ReportsController(IReportServiceConfiguration reportServiceConfiguration)
            : base(reportServiceConfiguration)
        {
        }
```

2. Set this configuration as described in step 4 of [Setup the Startup.cs file for the Reports service](../telerik-reporting-rest-service-aspnetcore-mvc-core3#setup-the-startup-cs-file-for-the-reports-service).

You can also check our .NET Core demo project which can be found in C:\Program Files (x86)\Progress\Telerik Reporting **Version** \Examples\CSharp\Asp.NetCoreDemo
