---
title: How To Display Page Header on First Page Only
description: Use a Binding Expression to Display the Page Header only on the First Page
type: how-to
page_title: Displaying the Page Header on Only the First Page
slug: how-to-display-page-header-on-first-page-only
position: 
tags: how-to, page-header, bindings, expressions
ticketid: 1440671
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.2.19.1030</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
In most cases, the [Report Header](https://docs.telerik.com/reporting/designing-reports-creating-report-headers-and-footers) is used to display information like a Cover Page. However, in rare cases it may be desirable to display only the [Page Header](https://docs.telerik.com/reporting/designing-reports-creating-page-headers-and-footers). See the below solution for details on how-to accomplish this.

## Solution
In the Page Header Properties create a [Binding Expression](https://docs.telerik.com/reporting/expressions-bindings) for the Visible Property. This will show or hide the Page Header based on the value of the [Page Number](https://docs.telerik.com/reporting/expressions-page-functions#pagenumber) Function. The Expression will look like the below.

```
    // Will evaluate as If PageNumber is Less Than 2, Visible = True Else Visible = False
    = IIF(PageNumber < 2, True, False)
```

The Properties Pane will look like the following.

![Page Header Binding Property](resources/PageHeaderBindingProperty.png)

### See Also
*	[Report Structure](https://docs.telerik.com/reporting/designing-reports-understanding-report-structure)
*   [Report Header](https://docs.telerik.com/reporting/designing-reports-creating-report-headers-and-footers)
*   [Page Header](https://docs.telerik.com/reporting/designing-reports-creating-page-headers-and-footers)
*   [Binding Expression](https://docs.telerik.com/reporting/expressions-bindings)
*   [Page Number](https://docs.telerik.com/reporting/expressions-page-functions#pagenumber)
