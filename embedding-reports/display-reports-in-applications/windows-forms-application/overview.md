---
title: Windows Forms Application Overview
page_title: Windows Forms Application Overview
description: Windows Forms Application Overview
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview
tags: overview
published: True
position: 0
---
<style>
table th:first-of-type {
    width: 20%;
}
table th:nth-of-type(2) {
    width: 30%;
}
table th:nth-of-type(3) {
    width: 50%;
}
</style>

# Windows Forms Application Overview

The  purpose of the Windows Forms ReportViewer control is to display the report document produced by the report engine embedded in a WinForms application and allow the user to interact with it. 

  ![WinForms report Viewer general look](images/WinFormsViewer.png)

The possible interactions with the currently loaded report are exposed to the user as buttons and inputs in the dedicated toolbar:

* __Navigate back in history__ navigates to a previous report after a Navigate to report interactive action has been triggered 

* __Navigate forward in history__ navigates to a forward report after Navigate back has been used

* __Stop__ cancels the loading of the current report if the chosen parameters make it too heavy 

* __Refresh__ updates the current report with fresh data

* __First page__ displays the respective page of the current report

* __Previous page__ displays the respective page of the current report

* __Current page__ input allows tracking the number of the displayed page and also displaying a particular page by entering its number

* __Total pages__ shows the count of the pages that the current report consists of

* __Next page__ displays the respective page of the current report

* __Last page__ displays the respective page of the current report

* __Page Setup...__ opens a dialog to set up the paper size, orientation and margins of the current report, and on closing the dialog refreshes the report to match the preferences

* __Switch to Print Preview__ switches the report view between the __Logical__ and __Physical__. The former provides a convenient on-screen preview experience and the latter provides an exact preview of the eventual print operation. 

* __Print__ initiates printing of the current report

* __Export__ initiates an export operation. See [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%}) for available export formats. 

* __Zoom__ allows viewing and changing the zoom level of the report content

* __Show/Hide parameters area__ allows hiding the report parameter inputs if there are report parameters defined in the report

* __Show/Hide document map__ allows hiding the document map tree if there are document map nodes defined in the report

## System Requirements

* Visual Studio 2010 or later.

* .NET Framework 4 or above (.NET Framework 4 __Client Profile__ is not supported)

* .NET Core 3.1 

* .NET 5+

## How it works

The Windows Forms ReportViewer control is implemented as a composite of standard Windows Forms controls. 

> The Windows Forms ReportViewer control's toolbar is not customizable. To introduce custom commands or strip existing commands you need to hide the built-in toolbar and add a custom UI that triggers the commands on the viewer using its [APIs](/reporting/api/Telerik.ReportViewer.WinForms.ReportViewer). 

Depending on the viewer's configuration the report pages are generated as vector or raster images using the [Telerik Reporting Image Rendering]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/image-rendering-design-considerations%}). The processing and rendering of the report might be performed:
* on the client machine with the report generation engine embedded in the desktop application,
* on a server machine with report generation engine embedded in a web application and exposed as [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}),
* on a [Telerik Report Server](http://www.telerik.com/report-server) instance.

## Declaring the application as DPI-aware

When using Windows Forms ReportViewer on a machine with Windows Vista and later operating system and DPI scale factor higher than 96, the form content (labels, buttons, rendered report image, etc.) might be rendered fuzzy, pixelated and with other visual artifacts. This is because the application in which you are using the Windows Forms Report Viewer is not declared as DPI aware. The recommended approach for declaring an application as DPI aware is adding a __dpiAware__ element to its application manifest, as shown below: 
    
````xml
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0" xmlns:asmv3="urn:schemas-microsoft-com:asm.v3" >
  <asmv3:application>
    <asmv3:windowsSettings xmlns="http://schemas.microsoft.com/SMI/2005/WindowsSettings">
      <dpiAware>True</dpiAware>
    </asmv3:windowsSettings>
  </asmv3:application>
</assembly>
````

Since Windows 10 Anniversary Update, the Windows runtime has improved the UX for Windows Forms applications that are not declared as DPI-aware. Unfortunately in some cases this behavior leads to incorrect calculation of interactive item positions. We recommend always declaring the Windows Forms application as DPI-aware. 

You can read more about writing DPI-aware desktop applications in the article [High DPI Desktop Application Development on Windows](https://msdn.microsoft.com/en-us/library/windows/desktop/dn469266(v=vs.85).aspx). 

## Keyboard shortcuts

The following table lists the keyboard and mouse commands used in Windows Forms Report Viewer. The commands use the CTRL key as a modifier that changes the applied action. 


| Mouse or key event | Action | Action with applied CTRL modifier |
| ------ | ------ | ------ |
|Mouse wheel|Scrolls up/down the document|Zooms in/out|
|Up|Scrolls the view one row up|n/a|
|Down|Scrolls the view one row down|n/a|
|Left|Scrolls the view one row left|n/a|
|Right|Scrolls the view one row right|n/a|
|Page up|Scrolls the view up|Scrolls the view to top of the current page and then to the previous page|
|Page down|Scrolls the view down|Scrolls the view to bottom of the current page and then to the next page|
|Home|Scrolls the view left|Scrolls the view to the previous page|
|End|Scrolls the view right|Scrolls the view to the next page|
|+ (Plus)|n/a|Zooms in|
|- (Minus)|n/a|Zooms out|
|F|n/a|Opens the search dialog|


## See Also

* [How to Add report viewer to a Windows Forms'.NET Framework project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-report-viewer-to-a-windows-forms'-.net-framework-project%})

* [Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/report-viewer-localization%})

* [Windows Forms Application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})
* [Rendering and Paging]({%slug telerikreporting/designing-reports/rendering-and-paging/overview%})
