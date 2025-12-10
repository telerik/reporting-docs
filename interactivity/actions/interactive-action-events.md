---
title: Interactive Actions Events
page_title: Handling Interactive Action Events
description: "Learn how to make the Telerik Reporting end-user experience more flexible, responsive, and customizable via the numerous interactive action events."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/interactive-action-events
tags: interactive,action,events
published: True
position: 100
previous_url: /designing-reports-interactive-action-events
reportingArea: General
---

# Interactive Action Events Overview

To help developers make their reporting experience more flexible, responsive, and customizable, the report viewers provide event handlers for three types of events associated with interactive actions – `Executing`, `Enter` and `Leave`.

`InteractiveActionExecuting` event is raised when an interactive action is being triggered, but not yet executed. This provides the ability to cancel the event execution due to some conditions.

`InteractiveActionEnter` event is raised when the mouse cursor enters the area of a report item with an interactive action defined.

`InteractiveActionLeave` event is raised when the mouse cursor leaves the area of a report item with an interactive action defined.

All the events provide arguments that contain a reference to the underlying [IAction](/api/Telerik.Reporting.Processing.IAction) instance and its properties, evaluated during report processing.

Based on the used report viewer, the arguments can contain also:

* A reference to the element, associated with the action ([FrameworkElement](https://learn.microsoft.com/en-us/dotnet/api/system.windows.frameworkelement?view=windowsdesktop-7.0) for WPF, [HTML DOM element](https://www.w3schools.com/js/js_htmldom_elements.asp) for Html5-based viewers).
* The mouse cursor coordinates in pixels when raising the event (for WinForms and WPF viewers). These coordinates are relative to the report item that triggered the action.

	>note When the `InteractiveActionLeave()` event is raised, these coordinates are empty.

* The client bounds of the current report item in pixels (for WinForms and WPF viewers).

For more information please refer to the related articles about each report viewer:

* [WinForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})

| Event Handler | Event Arguments |
| ------ | ------ |
| [InteractiveActionExecuting](/api/Telerik.ReportViewer.WinForms.ReportViewerBase#Telerik_ReportViewer_WinForms_ReportViewerBase_InteractiveActionExecuting)| [InteractiveActionCancelEventArgs](/api/Telerik.ReportViewer.Common.InteractiveActionCancelEventArgs)|
| [InteractiveActionEnter](/api/Telerik.ReportViewer.WinForms.ReportViewerBase#Telerik_ReportViewer_WinForms_ReportViewerBase_InteractiveActionEnter)| [InteractiveActionEventArgs](/api/Telerik.ReportViewer.Common.InteractiveActionEventArgs)|
| [InteractiveActionLeave](/api/Telerik.ReportViewer.WinForms.ReportViewerBase#Telerik_ReportViewer_WinForms_ReportViewerBase_InteractiveActionLeave)| [InteractiveActionEventArgs](/api/Telerik.ReportViewer.Common.InteractiveActionEventArgs)|

* [WPF Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%})

| Event Handler | Event Arguments |
| ------ | ------ |
| [InteractiveActionExecuting](/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_InteractiveActionExecuting)| [InteractiveActionCancelEventArgs](/api/Telerik.ReportViewer.Wpf.InteractiveActionCancelEventArgs)|
| [InteractiveActionEnter](/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_InteractiveActionEnter)| [InteractiveActionEventArgs](/api/Telerik.ReportViewer.Wpf.InteractiveActionEventArgs)|
| [InteractiveActionLeave](/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_InteractiveActionLeave)| [InteractiveActionEventArgs](/api/Telerik.ReportViewer.Wpf.InteractiveActionEventArgs)|

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) (applies also to its wrappers for other Frameworks)

|  |  |
| ------ | ------ |
 Event Handler |
| [InteractiveActionExecuting]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting(e,-args)%})|
| [InteractiveActionEnter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionenter(e,-args)%})|
| [InteractiveActionLeave]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionleave(e,-args)%})|
