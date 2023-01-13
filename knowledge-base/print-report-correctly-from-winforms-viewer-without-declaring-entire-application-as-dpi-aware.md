---
title: How to Display/Print Report Correctly from Windows Forms Viewer without Declaring the Entire Application as DPI-aware
description: What can we do to print and display Telerik reports correctly in WinForms application that should not be declared as DPI-aware
type: how-to
page_title: Display/Print Report Correctly from Windows Forms Viewer without Declaring the Entire Application as DPI-aware
slug: print-report-correctly-from-winforms-viewer-without-declaring-entire-application-as-dpi-aware
position: 
tags: 
ticketid: 1425131
res_type: kb
---

## Environment
<table>
    <tbody>
	    <tr>
	    	<td>Product</td>
	    	<td>Progress® Telerik® Reporting</td>
	    </tr>
    </tbody>
</table>


## Description
When the [Windows Forms Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}) is used in a WinForms application that is not DPI-aware, when printing or previewing a report it may be incorrectly scaled.

The recommended solution is to set the application to DPI-aware as explained in [Declaring the application as DPI-aware]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}#declaring-the-application-as-dpi-aware) article section.
However, this may result in the distortion of other controls in the application.

## Solution

1. You may extract the viewer in a separate application, and call the latter when needed from the main application. Only the application with the viewer (with embedded Reporting engine) should be declared as DPI-aware.  
  
2. You may move the Reporting engine in a separate [Telerik Reporting REST Service]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview %}) and [use the Windows Forms Viewer with the REST Service]({% slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-rest-service %}). It will be necessary to add the <**dpiAware**\> section to the REST Service application's **web.config** and set the **_dpiAwareness_** attribute to *PROCESS\_SYSTEM\_DPI\_AWARE* - [dpiAware element]({% slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/dpiaware-element %}#dpi-awareness-in-report-viewers). 
  
3. You may test to run the application not declared as DPI-aware on a machine with Windows 10 Anniversary Update, where Windows runtime has improved the UX for Windows Forms applications that are not declared as DPI-aware. We cannot guarantee the report will be displayed as expected.  
  
4. Another option, which is more suitable for printing the document rather than previewing it due to raster zoom, is to set the 'OutputFormat' attribute of [ImageInteractive Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/imageinteractive-device-information-settings%}) to 'PNG' (the default is 'EMF'). In this case the zooming will not work well, as the report will be rendered as raster image (as opposed to vector image). This setting will take effect for reports displayed in _Interactive_ mode in the Windows Forms Report Viewer.  
The same approach can be applied for _PrintPreview_ mode and _Printing_ from the viewer by setting 'OutputFormat' to 'PNG' in the [Image Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/image-device-information-settings%}) (extensions _IMAGEPrintPreview_ and _IMAGEPrint_).
