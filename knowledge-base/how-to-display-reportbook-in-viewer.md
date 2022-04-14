---
title: How to display ReportBook in viewer
description: This article elaborates on how to load multiple reports in a report book into a viewer.
type: how-to
page_title: How to display ReportBook in viewer
slug: how-to-display-reportbook-in-viewer
position: 
tags: ReportBook
ticketid: 1344512
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
This article demonstrates the three approaches for displaying ReportBook in an application. It is applicable for any application type. Depending on the report viewer, there might be different approaches for setting the viewer's ReportSource, all of them can be reviewed in [How to: Set ReportSource for Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%}) help article.

## Solution
1. ReportBook can be created in Standalone report designer first using Report Book report template. The output will be a .TRBP file that can be passed to report viewer's report source as [UriReportSource](/reporting/api/Telerik.Reporting.UriReportSource).

  ``` JavaScript
  // HTML5 Report Viewer example initialization
  reportSource: {
      report: "ReportBook1.trbp"
  }
  ```
  
2. Create a ReportBook by inheriting *Telerik.Reporting.ReportBook* class and adding the required ReportSources to it. An example of it is provided in ReportBook.cs file located in product installation folder *(C:\Program Files (x86)\Progress\Telerik Reporting VERSION\Examples\CSharp\ReportLibrary\ReportBook)*. Created ReportBook can be passed to the report viewer's report source as [TypeReportSource](/reporting/api/Telerik.Reporting.TypeReportSource).

3. *(not recommended)* ReportBook can be created at run-time: [How to: Create a Report Book at run-time]({%slug telerikreporting/designing-reports/report-book/how-to-create-a-report-book-at-run-time%}). This approach is only valid when you need to create/modify report definitions at run-time. The created instance of the ReportBook can be passed to the viewer's report source using [InstanceReportSource](/reporting/api/Telerik.Reporting.InstanceReportSource). This approach relies on [custom report resolver logic]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-use-custom-report-source-resolver-and-custom-report-document-resolver%}) to add the reports into the report book and return the new instance of the report book. For example:

  ``` C#
  public class MyReportSourceResolver : IReportSourceResolver
  {
      public ReportSource Resolve(string reportId, OperationOrigin operationOrigin, IDictionary<string, object> currentParameterValues)
      {
          // Creating a new report book
          var reportBook = new ReportBook();

          //Add first report
          var firstReportSource = new TypeReportSource();
          firstReportSource.TypeName = typeof(FirstReport).AssemblyQualifiedName;
          reportBook.ReportSources.Add(firstReportSource);

          //Add second report
          var secondReportSource = new TypeReportSource();
          secondReportSource.TypeName = typeof(SecondReport).AssemblyQualifiedName;
          reportBook.ReportSources.Add(secondReportSource);

          //Return the new instance
          var result = new InstanceReportSource { ReportDocument = reportBook };

          return result;
      }
  }
  ```
Then go to ReportsController.cs and change the resolver:

  ``` C#

  //Setup the ReportServiceConfiguration
  configurationInstance = new ReportServiceConfiguration
  {
      HostAppId = "Html5App",
      Storage = new FileStorage(),

      ReportSourceResolver = new MyReportSourceResolver()
  };
  ```
