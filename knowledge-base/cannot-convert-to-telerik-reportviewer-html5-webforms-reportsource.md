---
title: Cannot implicitly convert type Telerik.Reporting.XXXReportSource to Telerik.ReportViewer.Html5.WebForms.ReportSource
description: When using HTML5 WebForms viewer there is an error Cannot implicitly convert type Telerik.Reporting.XXXReportSource to Telerik.ReportViewer.Html5.WebForms.ReportSource
type: troubleshooting
page_title: Cannot implicitly convert type Telerik.Reporting.XXXReportSource to Telerik.ReportViewer.Html5.WebForms.ReportSource when using HTML5 WebForms report viewer
slug: cannot-convert-to-telerik-reportviewer-html5-webforms-reportsource
position: 
tags: reportsource,html5webformsviewer
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
Cannot implicitly convert type 'Telerik.Reporting.XXXReportSource' to 'Telerik.ReportViewer.Html5.WebForms.ReportSource' error when setting the ReportSource of the HTML5 WebForms Report Viewer.

## Solution
[HTML5 WebForms Report Viewer](../webforms-report-viewer-controls-overview) works with a client-side report source which is of type **Telerik.ReportViewer.Html5.WebForms.ReportSource**. 

*ReportSource.IdentifierType* property specifies which [resolver](../telerik-reporting-rest-service-report-resolver#overview) will be used for resolving the report description string on the server.

*ReportSource.Identifier* property accepts a string that contains information about the report. This string can be a path to a TRDP or TRDX file that can be resolved by [ReportFileResolver](../t-telerik-reporting-services-webapi-reportfileresolver), an assembly-qualified name of the report class which can be resolved by [ReportTypeResolver](../t-telerik-reporting-services-webapi-reporttyperesolver) or custom information which can be resolved by [custom report resolver](../telerik-reporting-rest-service-report-resolver#custom-report-resolver-implementations).

Examples of setting the ReportSource of HTML5 WebForms Report Viewer:

*C#*
```c#
protected void Page_Load(object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        Telerik.ReportViewer.Html5.WebForms.ReportSource reportSource = new Telerik.ReportViewer.Html5.WebForms.ReportSource();
        reportSource.IdentifierType = Telerik.ReportViewer.Html5.WebForms.IdentifierType.UriReportSource;
        reportSource.Identifier = "Report1.trdp";            
        reportViewer1.ReportSource = reportSource;
    }
}
```

*VB*
```vb
Protected Sub Page_Load(sender As Object, e As EventArgs)
    If Not IsPostBack Then
        Dim reportSource As New Telerik.ReportViewer.Html5.WebForms.ReportSource()
        reportSource.IdentifierType = Telerik.ReportViewer.Html5.WebForms.IdentifierType.UriReportSource
        reportSource.Identifier = "Report1.trdp"
        reportViewer1.ReportSource = reportSource
    End If
End Sub
```

## See Also
[How to: Set ReportSource for Report Viewers](../report-sources-viewers)

[How to display a report via InstanceReportSource in the HTML5 Viewer](https://www.telerik.com/support/kb/reporting/details/how-to-display-a-report-via-instancereportsource-in-the-html5-viewer)
