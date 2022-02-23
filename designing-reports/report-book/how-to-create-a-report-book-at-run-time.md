---
title: How to Create a Report Book at run-time
page_title: How to Create a Report Book at run-time 
description: How to Create a Report Book at run-time
slug: telerikreporting/designing-reports/report-book/how-to-create-a-report-book-at-run-time
tags: how,to,create,a,report,book,at,run-time
published: True
position: 6
---

# How to Create a Report Book at run-time


You can programmatically create a report book at run-time by using the Telerik Reporting API.         

The following steps are required to create a report book at run-time:         

1. Create an instance of the ReportBook class

1. Add the necessary ReportSources to its "ReportSources" collection.

Alternatively, you can derive from the ReportBook class and initialize the book in the constructor if you want to separate the report book implementation details from the rest of your code.         

In the sample below we add two reports:         

1. First is the 'WeekdayReport', which is a CS/VB class inheriting from Telerik.Reporting.Report. It is added as a TypeReportSource - check [Available ReportSources]({%slug telerikreporting/designing-reports/report-sources/overview%}).             

1. Second is the 'Glossary.trdp' report created with the Standalone Designer. It is added wrapped in a UriReportSource. You need to specify the relative or full path to the TRDP file:

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportBookSnippets.cs region=CreateReportBook}}
````C#
	var reportBook = new ReportBook();
	var weekdayReportSource = new TypeReportSource();
	weekdayReportSource.TypeName = typeof(WeekdayReport).AssemblyQualifiedName;
	reportBook.ReportSources.Add(weekdayReportSource);
	
	var glossaryReportSource = new UriReportSource();
	glossaryReportSource.Uri = "Reports\\Glossary.trdp";
	reportBook.ReportSources.Add(glossaryReportSource);
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportBookSnippets.vb region=CreateReportBook}}
````VB
	Dim reportBook = New ReportBook()
	Dim weekdayReportSource = New TypeReportSource()
	weekdayReportSource.TypeName = GetType(WeekendReport).AssemblyQualifiedName
	reportBook.ReportSources.Add(weekdayReportSource)
	
	Dim glossaryReportSource = New UriReportSource()
	glossaryReportSource.Uri = "Reports\Glossary.trdp"
	reportBook.ReportSources.Add(glossaryReportSource)
````

