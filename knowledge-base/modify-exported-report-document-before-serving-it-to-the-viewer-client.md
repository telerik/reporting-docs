---
title: Modifying Report Document Before Serving It To the Viewer
description: "Learn how to modify the exported report document prior serving it to the viewer client in Telerik Reporting."
type: how-to
page_title: Modifying exported report document prior serving it to viewer client
slug: modify-exported-report-document-before-serving-it-to-the-viewer-client
tags: 
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

With [Telerik Reporting R3 2016](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-r3-2016-(version-10-2-16-914)) we introduced a point granting you access to rendered reports before providing them to the client.

In the following code snippets we demonstrate how to modify a report rendered in PDF format from desktop report viewers or service prior serving the report to the viewer client. The code snippets cover both desktop viewers and web viewers.

## Solution

### Desktop Viewers

Open the Windows Form or WPF Window code behind (press `F7`) and handle report viewer event `ExportEnd` as shown in the following snippet:

````C#
public ReportViewerFormOrWindow()
{
	InitializeComponent();
	this.reportViewer1.ExportEnd += ReportViewer1ExportEnd;
}

private void ReportViewer1ExportEnd(object sender, Telerik.ReportViewer.Common.ExportEndEventArgs args)
{
	if(args.DocumentExtension.Equals("pdf"))
	{
		//modify the rendered document in args.DocumentBytes 
	}
}
````
````VB
Public Sub New()
	InitializeComponent()
	AddHandler Me.reportViewer1.ExportEnd, AddressOf ReportViewer1ExportEnd
End Sub

Private Sub ReportViewer1ExportEnd(sender As Object, args As Telerik.ReportViewer.Common.ExportEndEventArgs)
	If args.DocumentExtension.Equals("pdf") Then
		'modify the rendered document in args.DocumentBytes
	End If
End Sub
````

### Web Viewers

In case you use Web viewer you have to overide the Telerik Reporting service method `OnGetDocument`:

#### Web API

````C#
public class ReportController : Telerik.Reporting.Services.WebApi.ReportsControllerBase
{
	protected override void OnGetDocument(Telerik.Reporting.Services.GetDocumentEventArgs args)
	{
		if(args.Extension.Equals("pdf"))
		{
			//modify the rendered document in args.DocumentBytes 
		}
	}
}
````
````VB
Public Class ReportController Inherits Telerik.Reporting.Services.WebApi.ReportsControllerBase
	Protected Overrides Sub OnGetDocument(args As Telerik.Reporting.Services.GetDocumentEventArgs)
		If args.Extension = "PDF" Then
			'modify the rendered document in args.DocumentBytes
		End If
	End Sub
End Class
````

#### ServiceStack

````C#
public class ReportController : Telerik.Reporting.Services.WebApi.ReportsControllerBase
{
	protected override void OnGetDocument(Telerik.Reporting.Services.GetDocumentEventArgs args)
	{
		if(args.Extension.Equals("pdf"))
		{
			//modify the rendered document in args.DocumentBytes 
		}
	}
}
````
````VB
Public Class ReportController Inherits Telerik.Reporting.Services.WebApi.ReportsControllerBase
	Protected Overrides Sub OnGetDocument(args As Telerik.Reporting.Services.GetDocumentEventArgs)
		If args.Extension = "PDF" Then
			'modify the rendered document in args.DocumentBytes
		End If
	End Sub
End Class
````

