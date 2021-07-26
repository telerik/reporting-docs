---
title: How to use ReportSource objects with ReportBook
description: How to use ReportSource objects with ReportBook.
type: how-to
page_title: How to use ReportSource objects with ReportBook
slug: how-to-use-reportsource-objects-with-reportbook
res_type: kb
---

## Description
 
Adding reports to [ReportBook](../designing-reports-general-explanation) shows a warning in **Visual Studio**.  
*"The Reports property is now obsolete. Please, use ReportSources property instead."*
 
## Solution  
  
As of the **R1 2017** release, adding reports to the [ReportBook.Reports](../p-telerik-reporting-reportbook-reports) collection is **obsolete** - [API Breaking Changes](../upgrade-path-2017-r1#api-breaking-changes).  
  
To allow integration with Standalone Designer, ReportBook was updated to use [ReportSource](../report-sources) objects for adding the reports.  
  
An updated approach includes adding the necessary **ReportSources** to the [**ReportBook.ReportSources**](../p-telerik-reporting-reportbook-reportsources) collection.     
  
- **pre R1 2017**

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

- **R1 2017 and later**  

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
[How to migrate your project to utilize the new ReportSource objects](./how-to-migrate-your-project-to-utilize-the-new-reportsource-objects) 

[Report Sources](../report-sources)

