---
title: Change Sub Report based on Main Report's Data
description: Edit Sub Report based on Main Report's Data.
type: how-to
page_title: Modify Sub Report based on Main Report's Data
slug: change-sub-report-based-on-main-report-s-data
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
			<td>Report Item</td>
			<td>SubReport</td>
		</tr>
	</tbody>
</table>

## Description

This article explains how to change the ReportSource of the SubReport based on Main Report's Data.
  
## Solution  

You can use a [User Function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) in a [Binding]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) to the SubReport item's ReportSource property. The function should return a valid [ReportSource object]({% slug telerikreporting/designing-reports/report-sources/overview%}) that wraps a report - the subreport.

For example, the following user function:

````CS
public static ReportSource SetReportSource(string field)
{
	var TRS = new TypeReportSource();
	TRS.Parameters.Add("Parameter1", field);
	if (field.ToLower() == "yes")
		TRS.TypeName = typeof(SubReport1).AssemblyQualifiedName;
	else
		TRS.TypeName = typeof(SubReport2).AssemblyQualifiedName;
	return TRS;
}
````

You should set the following Binding to the SubReport item in the Main report:

**Property path:** ReportSource

**Expression:** = SetReportSource(Fields.MainReportFieldX)

## See Also

[Extending Reporting Engine with User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}#extending-reporting-engine-with-user-functions)
