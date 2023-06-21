---
title: Dynamic ReportBook Name on Export
description: "Learn how to set the name of the ReportBook document exported from a viewer dynamically in Telerik Reporting."
type: how-to
page_title: Setting ReportBook Name dynamically when exporting from a viewer
slug: dynamic-reportbook-name-on-export
tags: 
ticketid: 1612904
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

I want to set the default file name of the [ReportBook]({%slug telerikreporting/designing-reports/report-book/overview%}) exported from the viewer with an [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}), for example, to a [Report Parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) value.

## Solution

The `DocumentName` of the ReportBook is used as default document name when exporting from the viewer. The Standalone Report Designer won't use DocumentName when exporting. It will rather use the Report name.

The Report Book is a collection of Reports that implements the [IReportDocument interface]((/api/telerik.reporting.ireportdocument)). The [implicit implementation of ReportParameters](/api/telerik.reporting.reportbook#Telerik_Reporting_ReportBook_Telerik_Reporting_IReportDocument_ReportParameters) obtains its value by merging the parameters of individual reports that have their `Mergeable` property set to true plus adding all non-mergeable parameters.

The [DocumentName of the ReportBook](/api/telerik.reporting.reportbook#Telerik_Reporting_ReportBook_DocumentName) may be set to an Expression like `=Parameters.ParameterName.Value`. ParameterName should be a valid parameter name from any of the reports in the ReportBook. You need to type manually the expression as it won't be displayed in the designer's wizard. You may use also more complex Expressions based on all report parameters throughout the reports in the ReportBook, and [User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview%}).

## See Also

* [Report Book]({%slug telerikreporting/designing-reports/report-book/overview%})
* [Interface IReportDocument](/api/telerik.reporting.ireportdocument)
* [Class ReportBook](/api/telerik.reporting.reportbook)
