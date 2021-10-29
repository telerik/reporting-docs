---
title: Remove Opened Reports with Code in the Web Report Designer
description: How to remove reports already opened in the Web Report Designer with code
type: how-to
page_title: How to remove opened reports from the web designer
slug: remove-opened-reports-web-designer
position: 
tags: 
ticketid: 1540231
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
The [Web Report Designer](../web-report-designer) utilizes the [browser local storage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage) to keep 
the previously opened reports. For that reason, if you close the designer without closing the reports, on the next designer opening in the same browser, all 
the previously opened reports will be re-opened. In some scenarios, this may cause failures.

## Suggested Workarounds
You may use JavaScript to remove the previously opened reports and the last one that is kept separately:
```JS
window.localStorage.removeItem("PreviouslyOpenedReports");
window.localStorage.removeItem("LastOpenedReport")
```

## Notes
In Blazor you may invoke JavaScript functions as explained in the Microsoft article [Call JavaScript functions from .NET methods in ASP.NET Core Blazor](https://docs.microsoft.com/en-us/aspnet/core/blazor/javascript-interoperability/call-javascript-from-dotnet?view=aspnetcore-5.0).
