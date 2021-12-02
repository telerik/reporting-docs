---
title: Design Time
page_title: Design Time | for Telerik Reporting Documentation
description: Design Time
slug: telerikreporting/troubleshooting/design-time
tags: design,time
published: True
position: 1
---

# Design Time



The article lists commonly met issues on designing Telerik Reports.

## I want to show my report in a ReportViewer control, but when I click on the arrow in the ReportSource property from the property grid, it does not show available reports - what is wrong?

Follow our [best practices](66CD7D60-7708-42D5-8BB4-506676E8679E) and have the report in a separate class library           that is referenced in the application or website. Check if the class library containing the report is referenced in your application/website           and that you have rebuilt the application/website.         

The most reliable way to specify a report for the ReportViewer is to do this programmatically. For example, if you're using the ASP.NET           report viewer, on the Page_Load event of the page:         

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\WebForms\WebForm1.aspx.cs region=Webviewer_SetReportSource}}
````C#
	        protected void Page_Load(object sender, EventArgs e)
	        {
	            if (!IsPostBack)
	            {
	                var typeReportSource = new Telerik.Reporting.TypeReportSource();
	                typeReportSource.TypeName = "Telerik.Reporting.Examples.CSharp.ListBoundReport, CSharp.ReportLibrary";
	                this.ReportViewer1.ReportSource = typeReportSource;
	            }
	        }
````
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WebForms\WebForm1.aspx.vb region=Webviewer_SetReportSource}}
````VB
	    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
	        If Not IsPostBack Then
	            Dim typeReportSource As New Telerik.Reporting.TypeReportSource()
	            typeReportSource.TypeName = "ListBoundReport, VB.ReportLibrary"
	            ReportViewer1.ReportSource = typeReportSource
	            ReportViewer1.RefreshReport()
	        End If
	    End Sub
````



## A multi-column report shows fine when using Preview, but when used as a subreport, it shows as a one-column report only.

The multi-column functionality is intended to be used only in the main           report because all report sections (excluding Page sections) are rendered in           a column-wise layout, thus the report can be only one column wide.         



## 'The type or namespace name 'Telerik' could not be found (are you missing a using directive or an assembly reference?)' Error on build.

Double-check if the project has references to Telerik Reporting assemblies,           and if the references CopyLocal is set to true in the Visual Studio Property grid.           In case you recently updated your Telerik Reporting installation, run the           [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}) in all related projects in Visual Studio.         

If Telerik Reporting assemblies are referenced and updated, verify that the project targets .NET4+ framework Full Profile version.

# See Also

