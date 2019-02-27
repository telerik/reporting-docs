---
title: Report server credentials provided to report viewer are displayed as plain text
description: Securing report server domain, username and password used in report viewer's initialization
type: troubleshooting
page_title: Report server credentials provided to report viewer are visible on examining the web page source
slug: report-server-credentials-provided-to-report-viewer-are-displayed-as-plain-text
position: 
tags: HTML5Viewer, ReportServer
ticketid: 1389398
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
How to prevent users from accessing the server with the credentials available while examining the Report Viewer's web page source?

## Solution 
Credentials should not be provided as plain text. Either use the [Guest user](https://docs.telerik.com/report-server/implementer-guide/user-management/guest-user) or ask the user of the web page to fill in his/hers credentials before they can access the report.
- Providing an access to the viewer's page to everyone, a Guest user account must be enabled so the end-users can have a read-only connection to the Report Server. 
- Providing an access to limit number of users that would be able to modify the report, they have to be registered as CAL users. The report viewer connected to a report server would need be utilized *only by the person that provides the credentials of its associated CAL user*.

## See Also
- [How To: Use HTML5 Report Viewer with Report Server](https://docs.telerik.com/reporting/html5-report-viewer-howto-use-it-with-reportserver)
- [Integration With Report Viewers](https://docs.telerik.com/report-server/implementer-guide/integration-with-report-viewers)
