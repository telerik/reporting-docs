---
title: Modify exported report document prior serving it to the viewer client
description: This article elaborates on how to modify exported report document prior serving it to the viewer client
type: how-to
page_title: Modify exported report document prior serving it to the viewer client
slug: modify-exported-report-document-before-serving-it-to-the-viewer-client
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

As of Telerik Reporting R3 2016 we introduced a points granting you access to rendered reports before providing them to the client.

In the following code snippets is demonstrated how to modify a report rendered in PDF format from desktop report viewers or service prior serving the report to the viewer client. The code snippets cover both desktop viewers and web viewers.

## Solution

#### Desktop Viewers

Open the Windows Form or WPF Window code behind (F7) and handle report viewer ExportEnd as shown in the following snippet:

C#
```C#
public ReportViewerFormOrWindow()
{
    InitializeComponent();
    this.reportViewer1.ExportEnd += ReportViewer1ExportEnd;
}

private void ReportViewer1ExportEnd(object sender, 
                                    Telerik.ReportViewer.Common.ExportEndEventArgs args)
{
    if(args.DocumentExtension.Equals("pdf"))  
    {  
      //modify the rendered document in args.DocumentBytes 
    } 
}
```

VB
```VB
Public Sub New()
    InitializeComponent()
    AddHandler Me.reportViewer1.ExportEnd, AddressOf ReportViewer1ExportEnd
End Sub

Private Sub ReportViewer1ExportEnd(sender As Object,
                                   args As Telerik.ReportViewer.Common.ExportEndEventArgs)
    'modify the rendered document in args.DocumentBytes 
    If args.DocumentExtension.Equals("pdf") Then
    End If
End Sub
```

#### Web Viewers

In case you use Web viewer you have to overide the Telerik Reporting service OnGetDocument:

##### Web API

C#
```C#
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
```

VB
```VB
Public Class ReportController
    Inherits Telerik.Reporting.Services.WebApi.ReportsControllerBase
    Protected Overrides Sub OnGetDocument(args As Telerik.Reporting.Services.GetDocumentEventArgs)
        'modify the rendered document in args.DocumentBytes 
        If args.Extension = "PDF" Then
        End If
    End Sub
End Class
```

#### ServiceStack

C#
```C#
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
```

VB
```VB
Public Class ReportController
    Inherits Telerik.Reporting.Services.WebApi.ReportsControllerBase
    Protected Overrides Sub OnGetDocument(args As Telerik.Reporting.Services.GetDocumentEventArgs)
        'modify the rendered document in args.DocumentBytes 
        If args.Extension = "PDF" Then
        End If
    End Sub
End Class
```
