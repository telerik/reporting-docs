---
title: Cannot Implicitly Convert Type 'Telerik.Reporting.XXXReportSource'
description: "Learn why the error Cannot implicitly convert type 'Telerik.Reporting.XXXReportSource' to 'Telerik.ReportViewer.Html5.WebForms.ReportSource' may occur when using HTML5 WebForms Report Viewer."
type: how-to
page_title: Can't use 'Telerik.Reporting.XXXReportSource' in HTML5 WebForms Viewer
slug: cannot-implicitly-convert-type-telerik.reporting.xxxreportsource-to-telerik.reportviewer.html5.webforms.reportsource-error
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>HTML5 WebForms Report Viewer</td>
	</tr>
</table>

## Description

An error is thrown when trying to set the **ReportSource** of the **HTML5 WebForms Report Viewer**.

## Error Message

Cannot implicitly convert type **'Telerik.Reporting.XXXReportSource'** to **'Telerik.ReportViewer.Html5.WebForms.ReportSource'**.  

## Cause\Possible Cause(s)

Trying to set a report source of type Telerik.Reporting.XXXReportSource to the HTML5 WebForms Report Viewer. HTML5 WebForms Report Viewer expects a special report source of type [Telerik.ReportViewer.Html5.WebForms.ReportSource](/api/telerik.reportviewer.html5.webforms.reportsource).

## Solution

Set the report viewer's **ReportSource** to an instance of the **Telerik.ReportViewer.Html5.WebForms.ReportSource** object type.

````C#
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
````
````VB
Protected Sub Page_Load(sender As Object, e As EventArgs)
	If Not IsPostBack Then
		Dim reportSource As New Telerik.ReportViewer.Html5.WebForms.ReportSource()
		reportSource.IdentifierType = Telerik.ReportViewer.Html5.WebForms.IdentifierType.UriReportSource
		reportSource.Identifier = "Report1.trdp"
		reportViewer1.ReportSource = reportSource
	End If
End Sub
````

## Notes

The [HTML5 WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}) works with a client-side report source which is of type `Telerik.ReportViewer.Html5.WebForms.ReportSource`.

* `ReportSource.IdentifierType` property specifies which [resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}#overview) will be used for resolving the report description string on the server.
* `ReportSource.Identifier` property accepts a string that contains information about the report. This string can be a path to a `TRDP` or `TRDX` file that can be resolved by [ReportFileResolver](/api/telerik.reporting.services.webapi.reportfileresolver), an assembly-qualified name of the report class which can be resolved by [ReportTypeResolver](/api/telerik.reporting.services.webapi.reporttyperesolver) or custom information which can be resolved by [custom report resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}#custom-report-resolver-implementations).

## See Also

* [Set ReportSource for Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%})
* [How to display a report via InstanceReportSource in the HTML5 Viewer]({%slug how-to-display-a-report-via-instancereportsource-in-the-html5-viewer%})
