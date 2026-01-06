---
title: Cross-site scripting (XSS) and the legacy Telerik Reporting ASP.NET WebForms Report Viewer
description: Cross-site scripting (XSS) with low impact is possible through the Telerik.ReportViewer.WebForms.dll in Telerik Reporting ASP.NET WebForms ReportViewer.
type: how-to
page_title: The legacy Telerik Reporting ASP.NET WebForms Report Viewer is vulnerable to cross-site scripting (XSS)
slug: cross-site-scripting-(xss)-and-the-legacy-telerik-reporting-asp.net-webforms-report-viewer
res_type: kb
previous_url: /knowledge-base/cross-site-scripting-(xss)-and-the-legacy-telerik-reporting-asp.net-webforms-report-viewer
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Versions</td>
			<td>Up to R1 2017 SP2</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
    	<tr>
			<td>Report Viewer</td>
			<td>Legacy ASP.NET WebForms Report Viewer</td>
		</tr>
	</tbody>
</table>

## Description  
  
Cross-site scripting (XSS) with low impact is possible through the Telerik.ReportViewer.WebForms.dll in Telerik Reporting [ASP.NET WebForms ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%}) control before **R1 2017 SP2 (11.0.17.406)**. The Telerik.ReportViewer.axd handler allows third parties to inject arbitrary web script or HTML through the bgColor parameter.  
  
Telerik Reporting Engine does not expose the application's server information to the client. Reports are processed and rendered server-side, where the AXD handler delivers the produced content at the client – includes ready HTML and CSS.  
  
**MITRE** has rated this vulnerability as medium-severity (CVSS3: 6.1; CVSS2: 4.3)   
     
## Solution

For customers on active maintenance, upgrade to [Telerik Reporting version R1 2017 SP2 (11.0.17.406)](http://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-r1-2017-sp2-%28version-11-0-17-406%29) or above.   
