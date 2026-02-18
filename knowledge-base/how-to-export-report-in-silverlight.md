---
title: Export Report in Silverlight
description: Export report in Silverlight by accessing the report engine via API
type: how-to
page_title: Export Report in Silverlight using API
slug: how-to-export-report-in-silverlight
position:
tags: silverlight,export,report
ticketid:
res_type: kb
sitemap: false
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>Silverlight Application</td>
	</tr>
</table>

> The Silverlight Report Viewer and its WCF Reporting Service are no longer supported and deployed with the installation of Telerik Reporting. The last release of Telerik Reporting with included Silverlight Report Viewer is [R1 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2023-17-0-23-118).

## Description

In the following article are presented steps for exporting a report in Silverlight application by accessing the report engine via API.

## Solution

To export a Telerik report from a Silverlight application without a Silverligh Report Viewer you have to instantiate the
`Telerik.Reporting.Service.SilverlightClient.ReportServiceClient` class,
which plays the role of proxy to the [Telerik Reporting WCF Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/overview%}).

To specify that you want to render the report we use the `RenderAsync` method of the `Telerik.Reporting.Service.SilverlightClient.ReportServiceClient`, which invokes the respective method on the server (remember that it serves as proxy) that would return the rendered report.

Since we’ve used an asynchronous method and we do not know when the render would finish, we need to handle the `Telerik.Reporting.Service.SilverlightClient.ReportServiceClient.RenderCompleted` event. In the `RenderCompleted` event we get the result from the rendering and decide what to do with it - in this case write down the report.

> The [ShowDialog](<http://msdn.microsoft.com/en-us/library/system.windows.controls.savefiledialog.showdialog(VS.95).aspx>) method is invoked prior to having the rendered report, because the dialog box, can only be called from user-initiated code, such as a button Click event. If ShowDialog is called from code that is not user-initiated, a SecurityException is thrown.

```C#
public partial class MainPage : UserControl
{
    public MainPage()
    {
        InitializeComponent();
    }

    Stream file;

    private void Button_Click(object sender, RoutedEventArgs e)
    {
        var fileDlg = new SaveFileDialog();
        fileDlg.Filter = "PDF files|*.pdf|All files|*.*";

        if (fileDlg.ShowDialog() == true)
        {
            //set any deviceInfo settings if necessary
            var deviceInfo = new NameValueDictionary();
            //set any report parameter value if necessary
            var parameters = new NameValueDictionary();

            this.file = fileDlg.OpenFile();
            var serviceClient = new ReportServiceClient(new Uri(App.Current.Host.Source, "../ReportService.svc"));
            serviceClient.RenderAsync("PDF",
                "ClassLibrary1.Report1, ClassLibrary1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null",
                deviceInfo,
                parameters);
            serviceClient.RenderCompleted += new EventHandler<RenderEventArgs>(serviceClient_RenderCompleted);
        }
    }

    void serviceClient_RenderCompleted(object sender, RenderEventArgs e)
    {
        var result = e.RenderingResult;
        if (this.file != null)
        {
            this.file.Write(result.DocumentBytes, 0, result.DocumentBytes.Length);
            this.file.Close();
            this.file.Dispose();
            this.file = null;
        }
    }
}
```
