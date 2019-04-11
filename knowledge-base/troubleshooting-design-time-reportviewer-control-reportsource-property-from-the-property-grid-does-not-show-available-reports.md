---
title: Design Time Problems. ReportSource property from the ReportViewer property grid does not show available reports
description: I want to show my report in a ReportViewer control, but when I click on the arrow in the ReportSource property from the property grid, it does not show available reports - what is wrong?
type: troubleshooting
page_title: ReportViewer ReportSource property does not show available reports
slug: troubleshooting-design-time-reportviewer-control-reportsource-property-from-the-property-grid-does-not-show-available-reports
position: 
tags: 
ticketid: 
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
I want to show my report in a ReportViewer control, but when I click on the arrow in the ReportSource property from the property grid, it does not show available reports - what is wrong?

## Solution
Follow our [best practices](../best-practices-solution-structure) and have the report in a separate class library that is referenced in the application or website. Check if the class library containing the report is referenced in your application/website and that you have rebuilt the application/website.

The most reliable way to specify a report for the ReportViewer is to do this programmatically. For example, if you're using the ASP.NET Web Forms Report Viewer, on the Page_Load event of the page:

#### _CSharp Example_
```CSharp
protected void Page_Load(object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        var typeReportSource = new Telerik.Reporting.TypeReportSource();
        typeReportSource.TypeName = "Telerik.Reporting.Examples.CSharp.ListBoundReport, CSharp.ReportLibrary";
        this.ReportViewer1.ReportSource = typeReportSource;
    }
}
```
#### _VB Example_
```VB
Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    If Not IsPostBack Then
        Dim typeReportSource As New Telerik.Reporting.TypeReportSource()
        typeReportSource.TypeName = "ListBoundReport, VB.ReportLibrary"
        ReportViewer1.ReportSource = typeReportSource
        ReportViewer1.RefreshReport()
    End If
End Sub
```
