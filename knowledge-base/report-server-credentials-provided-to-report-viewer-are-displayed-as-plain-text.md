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
When using HTML5 Report Viewer to display reports stored on Telerik Report Server the report server credentials can be seen as plain text if you examine the web page source code. 

The intended usage of a report viewer connected to a report server is to be utilized *only by the user which has provided its credentials in the viewer*. This aligns with the Report Server end user license agreement, which restricts the usage of Report Server by a CAL User to a single person *(individual user)*. In other words, the person that examines the source code of the web page should see only his/hers own credentials there.

If the report viewer that accesses a Report Server instance should be utilized by everyone, a [Guest user](https://docs.telerik.com/report-server/implementer-guide/user-management/guest-user) account must be enabled so the end-users can have a read-only connection to the Report Server. 
On the other hand, providing an access to limit number of users that would be able to modify the report, they have to be registered as CAL users.The report viewer connected to a report server would need be utilized *only by the person that provides the credentials of its associated CAL user*.

## See Also
- [How To: Use HTML5 Report Viewer with Report Server](https://docs.telerik.com/reporting/html5-report-viewer-howto-use-it-with-reportserver)
- [Integration With Report Viewers](https://docs.telerik.com/report-server/implementer-guide/integration-with-report-viewers)
