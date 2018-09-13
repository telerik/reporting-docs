---
title: Action NavigateToReport does not work after updating the Connection String dynamically in a Custom Report Resolver
description: NavigateToReport action will be corrupted if the Connection String is changed dynamically in the Custom Report Resolver
type: troubleshooting
page_title: Report item will not navigate to report when the Connection String is modified dynamically in the code
slug: navigate-to-report-not-working-when-custom-report-resolver-changes-connectionstring-dynamically
position: 
tags: 
ticketid: 1172947
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
Sometimes it is necessary to change the connection string dynamically, in the code. The approach described in  [Changing the connection string dynamically according to runtime data](https://www.telerik.com/support/kb/reporting/details/changing-the-connection-string-dynamically-according-to-runtime-data) KB article is suitable for Desktop Viewers.
It can be applied also for the Html5 Web Viewers __with some modifications__. The connection string should be changed in the _Resolve()_ method of the Custom Report Resolver.

When there is a _NavigateToReport_ Action set for any report item, the action will not work after updating the connection string.

## Solution
The above KB article drills through the entire report to modify the connection string of all its _Items_, _Parameters_ and _Actions_.  
The code from the KB searches for _NavigateToReport_ Actions, and replaces recursively the connection string also in Action _ReportSources_. That is where the problem occurs.  
You should **remove** the corresponding code that **drills through the Actions**, as it is excessive in the case of _Html5 Report Viewer_. 
The _Html5 Report Viewer_ will automatically resolve the _ReportSource_ of the _NavigateToReport_ Action using the Custom Report Resolver, hence its connection string will be automatically modified and it is not necessary to drill through actions in the main report.  

## Notes
When navigating to a Standalone designer report (.trdp, .trdx, .trbp) the paths to the reports will be resolved with respect to the application, not with respect to the main report. This may cause broken _NavigateToReport_ Actions when the report is not in the main folder of the application. To resolve the issue it will be necessary to replace the base path from the UriReportSource.Uri with the actual one (path to the application main folder).


Connection string can be modified run time without extra code, based on Report Parameter: [Change Connection String dynamically through a report parameter](https://docs.telerik.com/reporting/knowledge-base/how-to-pass-connectionstring-to-report-dynamically-through-report-parameter).
