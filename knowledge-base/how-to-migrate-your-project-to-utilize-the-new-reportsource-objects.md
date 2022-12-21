---
title: How to migrate your project to utilize the new ReportSource objects.
description: How to use the new ReportSource objects in your project..
type: how-to
page_title: How to utilize the new ReportSource objects with your application.
slug: how-to-migrate-your-project-to-utilize-the-new-reportsource-objects
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
			<td>Version</td>
			<td>Q2 2012 and later</td>
		</tr>
		<tr>
			<td>Report Viewers</td>
			<td>WinForms, WPF, ASP.NET</td>
		</tr>
	</tbody>
</table>

## Description

Telerik Reporting is an embedded reporting engine developed on top of Microsoft’s .NET framework. As such the reports are CLR objects and can be used by the developers following the basic concepts of the programming language and the .NET platform. With the introduction of the **XML** report definition, the reports can exist not only as **CLR** types and objects in the memory but as XML markup stored in different ways (file, database, etc.). As we do not want to limit the users to work with only objects or files, the need for a unified way for referencing reports in the applications emerged - [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%}).

While the **Pre-Q2 2012** reports still work we strongly advise migrating your applications to the new concept.  This article describes the affected APIs of Telerik Reporting and what steps to be taken in order to start using the new ReportSource objects.

The available report sources are:

- [InstanceReportSource](/api/telerik.reporting.instancereportsource) - This report source is used when you have a reference to an existing Report object and covers most of the existing scenarios including the SubReport item, the WinForms, WPF and ASP.NET viewers and the programmatic rendering of the report using the [ReportProcessor](/api/telerik.reporting.processing.reportprocessor) ([RenderReport Method](/api/telerik.reporting.processing.reportprocessor#collapsible-Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) and [PrintReport Method](/api/telerik.reporting.processing.reportprocessor#collapsible-Telerik_Reporting_Processing_ReportProcessor_PrintReport_Telerik_Reporting_ReportSource_System_Drawing_Printing_PrinterSettings_)).
- [TypeReportSource](/api/telerik.reporting.typereportsource) - The reports created with Visual Studio are usually stored as .NET classes. To access a .net class declaratively you can use the [assembly qualified name](https://learn.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname?redirectedfrom=MSDN&view=net-7.0#System_Type_AssemblyQualifiedName) of the type. Referencing reports using their assembly qualified type name is already used in the NavigateToReportAction, ASP.NET and Silverlight viewers.
- [UriReportSource](/api/telerik.reporting.urireportsource) - The URI report source allows you to load a report document either from a file path or from an Url.
- [XmlReportSource](/api/telerik.reporting.xmlreportsource) - The report source allows you to load a report from XML markup (in the form of String, Stream or TextReader).

In general, the report source represents a pointer to the report (object reference, assembly qualified type name, a URI to a file or XML markup) and [parameters](/api/telerik.reporting.reportsource#collapsible-Telerik_Reporting_ReportSource_Parameters). When provided, the values of the ReportSource parameters are applied to the Report parameters at run-time. Prior to Q2 2012, these Report parameters were part of the [NavigateToReportAction](/api/telerik.reporting.navigatetoreportaction) (drill-through action) and the [SubReport]({%slug telerikreporting/designing-reports/report-structure/subreport%}) item (master-detail scenario).

## Solution

### Subreport

The properties below of the SubReport item are now obsolete and when used the compiler will generate the following warnings:

- Telerik.Reporting.SubReport.ReportSource property is now of type Telerik.Reporting.ReportSource. Please, use Telerik.Reporting.InstanceReportSource to build existing reports.
- Telerik.Reporting.SubReport.Parameters property is now obsolete. Please, set a Telerik.Reporting.InstanceReportSource object for the Telerik.Reporting.SubReport.ReportSource property instead and add the parameters to its Parameters collection.

The following is a sample snippet that demonstrates how to specify a report for the [SubReport]({%slug telerikreporting/designing-reports/report-structure/subreport%}) item and its corresponding report parameters:

**Pre-Q2 2012:**

````C#
InvoiceReport report1 = new InvoiceReport();
Telerik.Reporting.SubReport subReport1 = new Telerik.Reporting.SubReport();
subReport1.ReportSource = report1;
subReport1.Parameters.Add(new Telerik.Reporting.Parameter("SaledOrderID", "=Fields.SalesOrderID"));
````
````VB
Dim report1 As New InvoiceReport()
Dim subReport1 As New Telerik.Reporting.SubReport()
subReport1.ReportSource = report1
subReport1.Parameters.Add(New Telerik.Reporting.Parameter("SaledOrderID", "=Fields.SalesOrderID"))
````

**Q2 2012 and later:**

````C#
InvoiceReport report1 = new InvoiceReport();
Telerik.Reporting.SubReport subReport1 = new Telerik.Reporting.SubReport();
Telerik.Reporting.InstanceReportSource instanceReportSource1 = new  Telerik.Reporting.InstanceReportSource();
instanceReportSource1.ReportDocument = report1;
instanceReportSource1.Parameters.Add(new Telerik.Reporting.Parameter("SaledOrderID", "=Fields.SalesOrderID"));
subReport1.ReportSource = instanceReportSource1;
````
````VB
Dim report1 As New InvoiceReport()
Dim subReport1 As New Telerik.Reporting.SubReport()
Dim instanceReportSource1 As New Telerik.Reporting.InstanceReportSource()
instanceReportSource1.ReportDocument = report1
instanceReportSource1.Parameters.Add(New Telerik.Reporting.Parameter("SaledOrderID", "=Fields.SalesOrderID"))
subReport1.ReportSource = instanceReportSource1
````

### NavigateToReportAction

The following properties of the NavigateToReportAction are now obsolete and when used the compiler will generate the following warnings:

- Telerik.Reporting.NavigateToReportAction.ReportDocumentType property is now obsolete. Please use the Telerik.Reporting.NavigateToReportAction.ReportSource property instead with a Telerik.Reporting.TypeReportSource object to build existing reports.
- Telerik.Reporting.NavigateToReportAction.Parameters property is now obsolete. Please, set a Telerik.Reporting.TypeReportSource object for the Telerik.Reporting.NavigateToReportAction.ReportSource property instead and add the parameters to its Parameters collection.

The following is a sample snippet that demonstrates how to specify a report for [NavigateToReportAction](/api/telerik.reporting.navigatetoreportaction) and its corresponding report parameters:

**Pre-Q2 2012:**

````C#
Telerik.Reporting.NavigateToReportAction reportAction1 = new Telerik.Reporting.NavigateToReportAction();
reportAction1.Parameters.Add(new Telerik.Reporting.Parameter("OrderNumber", "SO43659"));
reportAction1.ReportDocumentType = "ReportLibrary1.InvoiceReport, ReportLibrary1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null";
textBox1.Action = reportAction1;
````
````VB
Dim reportAction1 As New Telerik.Reporting.NavigateToReportAction()
reportAction1.Parameters.Add(New Telerik.Reporting.Parameter("OrderNumber", "SO43659"))
reportAction1.ReportDocumentType = "ReportLibrary1.InvoiceReport, ReportLibrary1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null"
textBox1.Action = reportAction1
````

**Q2 2012 and later:**

````C#
Telerik.Reporting.TypeReportSource reportSource = new Telerik.Reporting.TypeReportSource();
reportSource.TypeName = "ReportLibrary1.InvoiceReport, ReportLibrary1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null";
reportSource.Parameters.Add(new Telerik.Reporting.Parameter("OrderNumber", "SO43659"));
Telerik.Reporting.NavigateToReportAction reportAction1 = new Telerik.Reporting.NavigateToReportAction();
reportAction1.ReportSource = reportSource;
textBox1.Action = reportAction1;
````
````VB
Dim reportSource As New TypeReportSource()
reportSource.TypeName = "ReportLibrary1.InvoiceReport, ReportLibrary1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null"
reportSource.Parameters.Add(New Telerik.Reporting.Parameter("OrderNumber", "SO43659"))
Dim reportAction1 As New Telerik.Reporting.NavigateToReportAction()
textBox1.Action = reportAction1
````

### Windows Forms Report Viewer

The Report property of the Winforms report viewer is now obsolete and when used the compiler will generate the following warning:

- Telerik.ReportViewer.WinForms.ReportViewer.Report is now obsolete. Please, use the ReportSource property instead.

The following is a sample snippet that demonstrates how to assign a report to WinForms report viewer:

**Pre-Q2 2012:**

````C#
Report1 report1 = new Report1();
// perform additional operations on the report object if needed
ReportViewer1.Report = report1;
````
````VB
Dim report1 As New Report1()
ReportViewer1.Report = report1
````

**Q2 2012 and later:**

````C#
Report1 report1 = new Report1();
// perform additional operations on the report object if needed            `
Telerik.Reporting.InstanceReportSource instanceReportSource = new  Telerik.Reporting.InstanceReportSource();
instanceReportSource.ReportDocument = report1;
this.ReportViewer1.ReportSource = instanceReportSource;
````
````VB
Dim report1 As New Report1()
`perform additional operations on the report object if needed
Dim instanceReportSource As New Telerik.Reporting.InstanceReportSource()
instanceReportSource.ReportDocument = report1
Me.ReportViewer1.ReportSource = instanceReportSource
````

### ASP.NET Report Viewer

The Report property of the ASP.NET report viewer is now obsolete and when used the compiler will generate the following warning:

- Telerik.ReportViewer.WebForms.ReportViewer.Report is now obsolete. Please, use the ReportSource property instead.

When settnig the report declaratively one should use the [assembly qualified name](https://learn.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname?redirectedfrom=MSDN&view=net-7.0#System_Type_AssemblyQualifiedName) of the report class.

The following is a sample HTML markup of how a report was assigned to the ASP.NET viewer from the web forms designer:

**Pre-Q2 2012:**

````HTML
<telerik:ReportViewer ID="ReportViewer1" runat="server" Report="ReportLibrary1.Report1, ReportLibrary1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
</telerik:ReportViewer>
````

**Q2 2012 and later:**

````HTML
<telerik:ReportViewer ID="ReportViewer1" runat="server">
	<typereportsource typename="ReportLibrary1.Report1, ReportLibrary1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
	</typereportsource>
</telerik:ReportViewer>
````

When settnig the report programmatically one should use an instance of the report class. Here is a sample code snippet that shows how to do this:

**Pre-Q2 2012:**

````C#
Report1 report1 = new Report1();
// perform additional operations on the report object if needed
ReportViewer1.Report = report1;
````
````VB
Dim report1 As New Report1()
ReportViewer1.Report = report1
````

**Q2 2012 and later:**

````C#
Report1 report1 = new Report1();
// perform additional operations on the report object if needed            `
Telerik.Reporting.InstanceReportSource instanceReportSource = new  Telerik.Reporting.InstanceReportSource();
instanceReportSource.ReportDocument = report1;
this.ReportViewer1.ReportSource = instanceReportSource;
````
````VB
Dim report1 As New Report1()
Dim instanceReportSource As New Telerik.Reporting.InstanceReportSource()
instanceReportSource.ReportDocument = report1
Me.ReportViewer1.ReportSource = instanceReportSource
````

### WPF Report Viewer

The Report property of the WPF report viewer is now obsolete and when used the compiler will generate the following warning:

- Telerik.ReportViewer.Wpf.ReportViewer.Report is now obsolete. Please, use the ReportSource property instead.

The following is a sample XAML markup of how a report was assigned to the WPF viewer:

**Pre-Q2 2012:**

````XAML
<telerik:ReportViewer x:Name="ReportViewer1" Report="ReportLibrary1.Report1, ReportLibrary1" />
````

**Q2 2012 and later:**

````XAML
<tr:ReportViewer x:Name="ReportViewer1">
	<tr:ReportViewer.ReportSource>
		<telerikReporting:TypeReportSource TypeName="ReportLibrary1.Report1, ReportLibrary1" />
	</tr:ReportViewer.ReportSource>
</tr:ReportViewer>
````

Here is a sample code snippet that shows how to assign a report to the WPF report viewer programmatically:

**Pre-Q2 2012:**

````C#
Report1 report1 = new Report1();
// perform additional operations on the report object if needed
ReportViewer1.Report = report1;
````
````VB
Dim report1 As New Report1()
'perform additional operations on the report object if needed
ReportViewer1.Report = report1
````

**Q2 2012 and later:**

````C#
Report1 report1 = new Report1();
// perform additional operations on the report object if needed
Telerik.Reporting.InstanceReportSource instanceReportSource = new Telerik.Reporting.InstanceReportSource();
instanceReportSource.ReportDocument = report1;
this.ReportViewer1.ReportSource = instanceReportSource;
````
````VB
Dim report1 As New Report1()
'perform additional operations on the report object if needed
Dim instanceReportSource As New Telerik.Reporting.InstanceReportSource()
instanceReportSource.ReportDocument = report1
Me.ReportViewer1.ReportSource = instanceReportSource
````

### Silverlight Report Viewer

The Telerik Reporting WCF Service report resolvers now create a [ReportSource](/api/telerik.reporting.reportsource) instead of an [IReportDocument](/api/telerik.reporting.ireportdocument).

### Using the ReportProcessor

When you use the report processor to directly print - [PrintReport Method](/api/telerik.reporting.processing.reportprocessor#collapsible-Telerik_Reporting_Processing_ReportProcessor_PrintReport_Telerik_Reporting_ReportSource_System_Drawing_Printing_PrinterSettings_) or render - [RenderReport Method](/api/telerik.reporting.processing.reportprocessor#collapsible-Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) a report, the argument is now of [ReportSource](/api/telerik.reporting.reportsource) type instead of an [IReportDocument](/api/telerik.reporting.ireportdocument).

**Pre-Q2 2012:**

````C#
Report1 report1 = new Report1();
Telerik.Reporting.Processing.ReportProcessor reportProcessor = new Telerik.Reporting.Processing.ReportProcessor();
Telerik.Reporting.Processing.RenderingResult result = reportProcessor.RenderReport("PDF", report1, null);
````
````VB
Dim report1 As New Report1()
Dim reportProcessor As New Telerik.Reporting.Processing.ReportProcessor()
Dim result As Telerik.Reporting.Processing.RenderingResult = reportProcessor.RenderReport("PDF", report1, Nothing)
````

**Q2 2012 and later:**

````C#
Report1 report1 = new Report1();
Telerik.Reporting.Processing.ReportProcessor reportProcessor = new Telerik.Reporting.Processing.ReportProcessor();
Telerik.Reporting.InstanceReportSource instanceReportSource = new Telerik.Reporting.InstanceReportSource();
instanceReportSource.ReportDocument = report1;
Telerik.Reporting.Processing.RenderingResult result = reportProcessor.RenderReport("PDF", instanceReportSource, null);
````
````VB
Dim report1 As New Report1()
Dim reportProcessor As New Telerik.Reporting.Processing.ReportProcessor()
Dim instanceReportSource As New Telerik.Reporting.InstanceReportSource()
instanceReportSource.ReportDocument = report1
Dim result As Telerik.Reporting.Processing.RenderingResult = reportProcessor.RenderReport("PDF", instanceReportSource, Nothing)
````

## Conclusion

In this article, we listed all API changes in **Q2 2012** version of Telerik Reporting regarding the new Report Sources. There is no conceptual difference between the old and new approach as all existing scenarios have direct match of a report source: report instance - [InstanceReportSource](/api/telerik.reporting.instancereportsource) + report instance; type name - [TypeReportSource](/api/telerik.reporting.typereportsource) + type name.

> Note that you are not limited to these two types of report source and you can easily mix any according to your needs.

The sole purpose of the changes is to extend the existing functionality and fit the XML report definition in the reporting engine while preserving the backwards compatibility.

What’s more, editing a report in the VS report designer will use the new objects instead of the obsolete properties when saving.

## See Also

[Report Source Overview]({%slug telerikreporting/designing-reports/report-sources/overview%})
