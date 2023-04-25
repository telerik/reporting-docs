---
title: Web Report Designer within ASP.NET Web Forms Application
description: "Learn how to host Telerik Reporting Web Report Designer within ASP.NET Web Forms ASPX page and Avoid Unnecessary Post-Back Request."
type: how-to
page_title: Host Web Designer in Web Forms ASPX Page
slug: web-designer-in-webforms-page
position: 
tags: 
ticketid: 1606288
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
			<td>.Net Framework</td>
			<td>Version 4.8</td>
		</tr>
	</tbody>
</table>


## Description

The initial page load works fine and it connects to the Reporting REST API successfully. However some page actions within the report designer appear to refresh the page.

For example, clicking on the menu and selecting _New Report_ works fine and brings up the "Create a Report" popup window. However, clicking the Save/Cancel buttons on that popup causes the page to refresh which then appears to restart the report designer.

Another example is when setting the designer's option `skipOnboarding: false`. The buttons on the onboarding popup cause the page refresh and the report designer restarts, only to reopen the onboarding popup again (creating a loop you can't progress past).

## Solution

It is necessary to extract the `<div>` place holder of the designer outside the ASPX Form element. The scripts may be extracted as well, althought even when left inside the Form they won't cause the page to reload.

````HTML
<body>
	<div id="webReportDesigner" style="margin-top: 40px">
		loading...
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://reporting.cdn.telerik.com/16.2.22.1109/js/webReportDesigner.kendo.min.js"></script>
	<script src="http://localhost:59655/api/reportdesigner/resources/js/telerikReportViewer"></script>
	<script src="http://localhost:59655/api/reportdesigner/designerresources/js/webReportDesigner-16.2.22.1109.min.js/"></script>
	
	<script type="text/javascript">
		$(document).ready(function () {
			var reportName = "Barcodes Report.trdp";
	
			$("#webReportDesigner").telerik_WebReportDesigner({
				toolboxArea: {
					layout: "list"
				},
				serviceUrl: "http://localhost:59655/api/reportdesigner/",
				report: reportName,
				persistSession: true,
				skipOnboarding: false,
			}).data("telerik_WebDesigner");
		});
	</script>

	<form id="form1" runat="server">
	</form>
</body>
````

The [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) is a pure jQuery widget and needs to live outside the ASPX Form in order to behave as expected, without making post-back requests.

## See Also

* [Congfiguring in ASP.NET Framework application]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-framework-application%})
* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
