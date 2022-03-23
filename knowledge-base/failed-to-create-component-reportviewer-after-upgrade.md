---
title: Failed to create component ReportViewer
description: Report viewer crashes when trying to place into form after upgrade
type: troubleshooting
page_title: Failed to Create Component ReportViewer After Upgrade
slug: failed-to-create-component-reportviewer-after-upgrade
position: 
tags: reportviewer, standalonedesigner,reportdesigner, upgrade
ticketid: 1557422
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
**Failed to create component ReportViewer** error message might appear in the Visual Studio Report Designer after upgrade of Telerik Reporting version.

## Error Message
Failed to create component ReportViewer. The error message contains follows: "System.IO.FileNotFoundException:
Could not load file or assembly 'Telerik,Reporting.Design.VisualStudio, Version=15.2.21.1125, Culture=neutral' or one of its assemblies"

## Solution
1. Ensure Visual Studio is closed.
2. Completely uninstall all versions of Telerik Reporting. This can be done through the Windows Control Panel or through the [Progress Control Panel](https://www.telerik.com/try/control-panel).
3. Reboot the machine.
4. Reinstall the latest version of Telerik Reporting. This can be done through the [MSI Download](https://www.telerik.com/account/downloads/product-download?product=REPORTING) 
5. or through the [Progress Control Panel](https://www.telerik.com/try/control-panel).
6. Open the Visual Studio project.
7. Open the report and observe if the designer was able to load correctly.

