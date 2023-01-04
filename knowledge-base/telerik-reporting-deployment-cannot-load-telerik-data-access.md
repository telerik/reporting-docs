---
title: Could not load file or assembly 'Telerik.OpenAccess'
description: Trying to deploy the project leads to - Could not load file or assembly 'Telerik.OpenAccess' error.
type: how-to
page_title: FileNotFoundException error is thrown on deploying the application
slug: telerik-reporting-deployment-cannot-load-telerik-data-access
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
    <tr>
		<td>Report Viewer</td>
		<td>HTML5 Report Viewers</td>
	</tr>
</table>

## Error Message  
*Telerik Reporting Deployment *System.IO.FileNotFoundException: Could not load file or assembly 'Telerik.OpenAccess, Version=2015.1.225.1, Culture=neutral, PublicKeyToken=7ce17eeaf1d59342' or one of its dependencies. The system cannot find the file specified.*  

## Possible Cause

The issue is related to a reference to **Telerik.Reporting.Cache.Database.dll** or a copy of  **Telerik.Reporting.Cache.Database.dll** in the **Bin** folder of the deployed application.
  
## Description

These assemblies are related to the database cache of old viewers, including the **obsolete** ASP.NET WebForms ReportViewer, **but not** the Reporting REST service and HTML5 Viewer. The Reporting REST service uses different [cache mechanism]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%}) -[REST Service Storage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}).  
  

## Solution  

The solution is to remove **Telerik.Reporting.Cache.Database.dll** reference from the project. 

## Notes

If you use an old viewer and database cache - [Configuring the Database Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-database-cache-provider%}), you may need *binding redirects* depending on the used Telerik Data Access version.  

The used Telerik Data Access version is specified in the dependencies list in each [release notes](https://www.telerik.com/support/whats-new/reporting/release-history) and the corresponding [Upgrade Path]({%slug telerikreporting/upgrade/overview%}) help article.
