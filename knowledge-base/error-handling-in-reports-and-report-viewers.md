---
title: Error handling in Reports and Report Viewers
description: Handling errors occuring during the report document generation and errors related to the instance processin them such as Report Viewers and the ReportProcessor class used for processing reports.
type: how-to
page_title: Handle errors thrown during the report document generation and errors thrown by report viewers or the ReportProcessor class
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

Reports and Report Viewers are created in such manner that errors may not result in system failure, but the end user can still see an error message. It is a common requirement to make these error messages more user-friendly and comprehensive for users.  
  
Telerik Reporting provides mechanisms for custom handling errors, where you can add logic and UI that you want to appear in such cases.
  
## Solution

1. **Errors related to processing items, which do not lead to breaking the report document's generation.**  

    - If these errors are not handled, the report will be processed and rendered, but there might be **red error messages** in the report at the place of the items which failed being processed.
    
    - Such errors can be caught in the [report's Error event](../t-telerik-reporting-erroreventhandler). If a report is created as a **TRDX|TRDP** file, you can [deserialize](../programmatic-xml-serialization#deserialize-report-definition-from-xml-file)|[unpackage](../report-packaging-trdp#unpackaging)the file and subscribe the report instance to its Error event.  
The report's Error event has information about the processing element throwing the exception(sender), and provides arguments allowing you to read the exception and cancel the further processing. If you throw a custom exception in the Error event, the further processing will be stopped, and if you use a Report Viewer, you will receive the custom error message in the viewer's preview.

2. **Errors related to processing items, leading to breaking the report document's generation.**

    - If these errors are not handled, the report will not be further processed. If you use a Report Viewer, and error will be displayed in viewer's preview.
    
    - Such errors can be caught through the instance processing the report  such as a [Report Viewer](../report-viewers-overview) or a [ReportProcessor](../t-telerik-reporting-processing-reportprocessor).   

        The [ReportProcessor has an Error event](../e-telerik-reporting-processing-reportprocessor-error) allowing you to handle general problems with reports without breaking the application. All Report Viewers have Error events allowing you to customize the error message and to handle it in code. Standard error messages are included in the localization resources of viewers:  

        - **HTML5 Viewer**: [error event](../html5-report-viewer-reportviewer-events-error) and [localization resources](../html5-report-viewer-localization);  

        - **WinForms ReportViewer**: [Error event](../e-telerik-reportviewer-winforms-reportviewerbase-error) and [localization resources](../report-viewer-localization);  

        - **WPF ReportViewer**: [Error event](../e-telerik-reportviewer-wpf-reportviewer-error) and [localization resources](../report-viewer-localization2);  

        - **Silverlight ReportViewer**: [Error event](../e-telerik-reportviewer-silverlight-reportviewer-error) and [localization resources](../report-viewer-localization3);

3. **Errors related to the  functionality of the instance processing the report (Report Viewers or ReportProcessor)**.
    
    - If the error is not breaking the execution of the application, you will be able to use the Error event and localization resources of the corresponding Report Viewer, or the ReportProcessor instance.
    
    - More serious problems will have to be handled on application level. For example, if there is a configuration problem with the HTML5 Viewer, you can catch requests and response and redirect to an error page.

## See Also

 [Handling errors occurring in a Custom Resolver used by a Reporting REST Service](./handling-errors-occurring-in-a-custom-resolver-used-by-a-reporting-rest-service).

