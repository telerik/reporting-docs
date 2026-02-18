---
title: Error Handling in Reports and Report Viewers
description: "Learn how to handle errors occurring during the report document generation and errors related to Report Viewers and the ReportProcessor class used for processing Telerik reports."
type: how-to
page_title: Handle errors in Telerik Reporting
slug: error-handling-in-reports-and-report-viewers
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
		<td>Any Report Viewer</td>
	</tr>
</table>

## Description

Reports and Report Viewers are created in such a manner that errors may not result in system failure, but the end user can still see an error message. It is a common requirement to make these error messages more user-friendly and comprehensive for users.

Telerik Reporting provides mechanisms for custom handling errors, where you can add logic and UI that you want to appear in such cases.

## Solution

1. **Errors related to processing items, which do not lead to breaking the report document's generation**.

   - If these errors are not handled, the report will be processed and rendered, but there might be **red error messages** in the report in the place of the items that failed to be processed.
   - Such errors can be caught in the [report's Error event](/api/telerik.reporting.erroreventhandler). If a report is created as a **TRDX** | **TRDP** file, you can [deserialize]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}#deserialize-report-definition-from-xml-file) | [unpackage]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}#unpackaging) the file and subscribe the report instance to its Error event.

   The report's Error event has information about the processing element throwing the exception (`sender`) and provides arguments allowing you to read the exception and cancel the further processing. If you throw a custom exception in the Error event, further processing will be stopped, and if you use a Report Viewer, you will receive the custom error message in the viewer's preview.

2. **Errors related to processing items, breaking the report document's generation**.

   - If these errors are not handled, the report will not be further processed. If you use a Report Viewer, an error will be displayed in the viewer's preview.
   - Such errors can be caught through the instance processing the report such as a [Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%}) or a [ReportProcessor](/api/telerik.reporting.processing.reportprocessor).

     The [ReportProcessor has an Error event](/api/telerik.reporting.processing.reportprocessor#Telerik_Reporting_Processing_ReportProcessor_Error) allows you to handle general problems with reports without breaking the application. All Report Viewers have Error events allowing you to customize the error message and handle it in code. Standard error messages are included in the localization resources of the report viewers:

     - **HTML5 Report Viewer**: [error event]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/error(e,-args)%}) and [localization resources]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization%});
     - **WinForms Report Viewer**: [Error event](/api/telerik.reportviewer.winforms.reportviewerbase#Telerik_ReportViewer_WinForms_ReportViewerBase_Error) and [localization resources]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/report-viewer-localization%});
     - **WPF Report Viewer**: [Error event](/api/telerik.reportviewer.wpf.reportviewer#Telerik_ReportViewer_Wpf_ReportViewer_Error) and [localization resources]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/report-viewer-localization%});
     - **Silverlight Report Viewer**: `Error` event and [localization resources]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/report-viewer-localization%});

3. **Errors related to the functionality of the instance processing the report (Report Viewers or ReportProcessor)**.

   - If the error is not breaking the execution of the application, you will be able to use the Error event and localization resources of the corresponding Report Viewer, or the ReportProcessor instance.
   - More serious problems will have to be handled on the application level. For example, if there is a configuration problem with the HTML5 Viewer, you can catch requests and responses and redirect to an error page.

## See Also

- [Handling errors occurring in a Custom Resolver used by a Reporting REST Service]({%slug handling-errors-occurring-in-a-custom-resolver-used-by-a-reporting-rest-service%})
