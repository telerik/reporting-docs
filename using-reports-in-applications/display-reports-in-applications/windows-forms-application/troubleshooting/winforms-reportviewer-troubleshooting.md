---
title: WinForms ReportViewer Troubleshooting
page_title: WinForms ReportViewer Troubleshooting | for Telerik Reporting Documentation
description: WinForms ReportViewer Troubleshooting
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/troubleshooting/winforms-reportviewer-troubleshooting
tags: winforms,reportviewer,troubleshooting
published: True
position: 0
---

# WinForms ReportViewer Troubleshooting



The article provides troubleshooting for commonly met issues with the Windows Forms ReportViewer control.

The Windows Forms ReportViewer displays content rendered through the [           Reporting Image Rendering nmechanism         ]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/image-rendering-design-considerations%}).       

## Report is not displayed by the viewer.

The WinForms ReportViewer control requires its RefreshReport method to be called after setting the ReportSource property.           For more details, please check [Assign report to the viewer programatically]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-manually-report-viewer-to-a-windows-forms'-.net-framework-project%}).         

## "An error has occurred while rendering the report: System.Runtime.InteropServices.ExternalException: A generic error occurred in GDI+." or "System.OutOfMemoryException: Exception of type 'System.OutOfMemoryException' was thrown." error on displaying a report.

The WinForms ReportViewer control uses Image rendering to display content.            If the machine cannot handle the number of rendered elements you may receive one of the above errors.           Suggestions how to resolve the issue are available in [Performance considerations]({%slug telerikreporting/designing-reports/performance-considerations%}).         

## "Attempt by method 'Telerik.Reporting.Services.HttpClient.HttpRequestHelper.GetResponseFromPost(System.Net.Http.HttpResponseMessage)' to access method 'Telerik.Reporting.Services.HttpClient.HttpRequestHelper.GetResponseFromPost```<T>``` (System.Net.Http.HttpResponseMessage, System.Collections.Generic.IEnumerable`1```<System.Net.Http.Formatting.MediaTypeFormatter>```)' failed." error on connecting the WinForms ReportViewer with Telerik Report Server or Reporting REST service.

The WinForms ReportViewer control requires  [Microsoft.AspNet.WebApi.Client](https://www.nuget.org/packages/Microsoft.AspNet.WebApi.Client/4.0.30506)  suitable for .NET4 that can be installed via  [Visual Studio Package Manager Console](https://docs.nuget.org/consume/package-manager-console) .           For more details, please check [How To: Use Windows Forms Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-report-server%}).         

# See Also

