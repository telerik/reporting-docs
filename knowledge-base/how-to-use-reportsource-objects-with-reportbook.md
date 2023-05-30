---
title: Warning After Adding Reports to ReportBook in Visual Studio
description: "Learn how to provide correctly ReportSource objects to the ReportBook before and after R1 2017 in Telerik Reporting."
type: troubleshooting
page_title: Visual Studio shows warning when adding reports to ReportBook
slug: how-to-use-reportsource-objects-with-reportbook
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
 	<tr>
		<td>Versions</td>
		<td>R1 2017 and later</td>
	</tr>
 	<tr>
		<td>Report Item</td>
		<td>Report Book</td>
	</tr>
</table>

## Description

As of the **R1 2017** release, adding reports to the [ReportBook.Reports](/api/telerik.reporting.reportbook#Telerik_Reporting_ReportBook_Reports) collection is **obsolete** - [API Breaking Changes]({%slug telerikreporting/upgrade/2017/r1-2017%}#api-breaking-changes).

To allow integration with Standalone Designer, [ReportBook]({%slug telerikreporting/designing-reports/report-book/overview%}) was updated to use [ReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}) objects for adding the reports.

An updated approach includes adding the necessary `ReportSources` to the [`ReportBook.ReportSources`](/api/telerik.reporting.reportbook#Telerik_Reporting_ReportBook_ReportSources) collection.

## Solution

### Solution for adding reports to a ReportBook *before* the R1 2017 release.

````C#
Telerik.Reporting.ReportBook reportBook = new ReportBook();
Telerik.Reporting.Report report = new Report1();
reportBook.Reports.Add(report);
````
````VB
Dim reportBook As Telerik.Reporting.ReportBook = New ReportBook()
Dim report As Telerik.Reporting.Report = New Report1()
reportBook.Reports.Add(report)
````

### Solution for adding reports to a ReportBook *after* the R1 2017 release.

````C#
Telerik.Reporting.ReportBook reportBook = new ReportBook();
Telerik.Reporting.TypeReportSource typeReportSource = new TypeReportSource();
typeReportSource.TypeName = typeof(Report1).AssemblyQualifiedName;
reportBook.ReportSources.Add(typeReportSource);
````
````VB
Dim reportBook As Telerik.Reporting.ReportBook = New ReportBook()
Dim typeReportSource As Telerik.Reporting.TypeReportSource = New TypeReportSource()
typeReportSource.TypeName = GetType(Report1).AssemblyQualifiedName
reportBook.ReportSources.Add(typeReportSource)
````

## See Also

* [How to migrate your project to utilize the new ReportSource objects]({%slug how-to-migrate-your-project-to-utilize-the-new-reportsource-objects%})
* [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})
