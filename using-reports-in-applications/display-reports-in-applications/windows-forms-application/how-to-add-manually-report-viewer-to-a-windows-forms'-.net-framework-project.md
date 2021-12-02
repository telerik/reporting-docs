---
title: How to Add manually report viewer to a Windows Forms' .NET Framework project
page_title: How to Add manually report viewer to a Windows Forms' .NET Framework project | for Telerik Reporting Documentation
description: How to Add manually report viewer to a Windows Forms' .NET Framework project
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-manually-report-viewer-to-a-windows-forms'-.net-framework-project
tags: how,to,add,manually,report,viewer,to,a,windows,forms',.net,framework,project
published: True
position: 3
---

# How to Add manually report viewer to a Windows Forms' .NET Framework project



## Assign report to the viewer in design time

To use Telerik Reports in Windows Forms application, you need the Windows Forms report viewer:

1. Drag the __ReportViewer__  control from the __Toolbox__  to the form design surface.  

  ![](images/ReportViewer.png)

1. Add reference to the class library that contains your reports in the windows form application.

1. Build the application

1. Set the __ReportSource__  for the report viewer. For more information, see[How to Set ReportSource for Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%})

1. To run the report in the viewer, call __ReportViewer.RefreshReport()__  from your application code __.__  

## Assign report to the viewer programmatically

In the __Form_Load__  event handler you create an instance report source and set its __ReportDocument__            property to a report instance. Next assign the instance report source to the __ReportSource__  property of the viewer.           Finally call __ReportViewer.RefreshReport().__ 

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\WinForms\Form1.cs region=Winviewer_SetReportSource}}
````C#
	        private void Form1_Load(object sender, EventArgs e)
	        {
	            var typeReportSource = new Telerik.Reporting.TypeReportSource();
	            typeReportSource.TypeName = "Telerik.Reporting.Examples.CSharp.ListBoundReport, CSharp.ReportLibrary";
	            this.reportViewer1.ReportSource = typeReportSource;
	            reportViewer1.RefreshReport();
	        }
````
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WinForms\Form1.vb region=Winviewer_SetReportSource}}
````VB
	    Private Sub Form1_Load(sender As Object, e As EventArgs)
	        Dim typeReportSource = New Telerik.Reporting.TypeReportSource()
	        typeReportSource.TypeName = "Telerik.Reporting.Examples.CSharp.ListBoundReport, CSharp.ReportLibrary"
	        Me.ReportViewer1.ReportSource = typeReportSource
	        ReportViewer1.RefreshReport()
	    End Sub
````



If the current application has to be declared as DPI-aware, an additional element needs to be added to the application manifest file, as explained           [here](F25EB909-7941-4B78-B24C-4025257A26C4#dpiAware).         

# See Also
[](66CD7D60-7708-42D5-8BB4-506676E8679E)

 * [Windows Forms Application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})

 * [Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/report-viewer-localization%})
