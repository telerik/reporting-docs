---
title: Interactive Action Events
page_title: Interactive Action Events | for Telerik Reporting Documentation
description: Interactive Action Events
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/interactive-action-events
tags: interactive,action,events
published: True
position: 8
---

# Interactive Action Events

To help developers to make their reporting experience more flexible, responsive and customizable, the report viewers provide event handlers for three types of events that are associated with interactive actions – __Executing__ , __Enter__  and __Leave__.       

__InteractiveActionExecuting__  event is raised when an interactive action is being triggered, but not yet executed. This provides the ability to cancel the event execution due to some condition.       

__InteractiveActionEnter__  event is raised when the mouse cursor enters the area of a report item that has an interactive action defined.       

__InteractiveActionLeave__  event is raised when the mouse cursor leaves the area of a report item that has an interactive action defined.       

All the events provide arguments that contain a reference to the underlying [IAction](/reporting/api/Telerik.Reporting.Processing.IAction)  instance         and its properties, evaluated during report processing.       

Based on the used report viewer, the arguments can contain also:       

* A reference to the element, associated with the action ([FrameworkElement](https://msdn.microsoft.com/en-us/library/system.windows.frameworkelement(v=vs.110).aspx) for WPF and Silverlight, [HTML DOM element](http://www.w3schools.com/js/js_htmldom_elements.asp) for Html5-based viewers).           

* The coordinates of the mouse cursor in pixels at the time of raising the event (for WinForms, WPF and SilverLight viewers). These coordinates are relative to the report item that triggered the action.           

   >note When the  __InteractiveActionLeave()__  event is raised, these coordinates are empty.             

* The client bounds of the current report item in pixels (for WinForms, WPF and SilverLight viewers).           

For more information please refer to the related articles about each report viewer:       

* [WinForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})


| Event Handler | Event Arguments |
| ------ | ------ |
| [InteractiveActionExecuting](/reporting/api/Telerik.ReportViewer.WinForms.ReportViewerBase#Telerik_ReportViewer_WinForms_ReportViewerBase_InteractiveActionExecuting)| [InteractiveActionCancelEventArgs](/reporting/api/Telerik.ReportViewer.Common.InteractiveActionCancelEventArgs)|
| [InteractiveActionEnter](/reporting/api/Telerik.ReportViewer.WinForms.ReportViewerBase#Telerik_ReportViewer_WinForms_ReportViewerBase_InteractiveActionEnter)| [InteractiveActionEventArgs](/reporting/api/Telerik.ReportViewer.Common.InteractiveActionEventArgs)|
| [InteractiveActionLeave](/reporting/api/Telerik.ReportViewer.WinForms.ReportViewerBase#Telerik_ReportViewer_WinForms_ReportViewerBase_InteractiveActionLeave)| [InteractiveActionEventArgs](/reporting/api/Telerik.ReportViewer.Common.InteractiveActionEventArgs)|




* [WPF Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%})


| Event Handler | Event Arguments |
| ------ | ------ |
| [InteractiveActionExecuting](/reporting/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_InteractiveActionExecuting)| [InteractiveActionCancelEventArgs](/reporting/api/Telerik.ReportViewer.Wpf.InteractiveActionCancelEventArgs)|
| [InteractiveActionEnter](/reporting/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_InteractiveActionEnter)| [InteractiveActionEventArgs](/reporting/api/Telerik.ReportViewer.Wpf.InteractiveActionEventArgs)|
| [InteractiveActionLeave](/reporting/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_InteractiveActionLeave)| [InteractiveActionEventArgs](/reporting/api/Telerik.ReportViewer.Wpf.InteractiveActionEventArgs)|




* [SilverLight Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/overview%})


| Event Handler | Event Arguments |
| ------ | ------ |
| [InteractiveActionExecuting](/reporting/api/Telerik.ReportViewer.Silverlight.ReportViewer#Telerik_ReportViewer_Silverlight_ReportViewer_InteractiveActionExecuting)| [InteractiveActionCancelEventArgs](/reporting/api/Telerik.ReportViewer.Silverlight.InteractiveActionCancelEventArgs)|
| [InteractiveActionEnter](/reporting/api/Telerik.ReportViewer.Silverlight.ReportViewer#Telerik_ReportViewer_Silverlight_ReportViewer_InteractiveActionEnter)| [InteractiveActionEventArgs](/reporting/api/Telerik.ReportViewer.Silverlight.InteractiveActionEventArgs)|
| [InteractiveActionLeave](/reporting/api/Telerik.ReportViewer.Silverlight.ReportViewer#Telerik_ReportViewer_Silverlight_ReportViewer_InteractiveActionLeave)| [InteractiveActionEventArgs](/reporting/api/Telerik.ReportViewer.Silverlight.InteractiveActionEventArgs)|




* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) (applies also to its wrappers for other Frameworks)           


|   |   |
| ------ | ------ |
 Event Handler |
| [InteractiveActionExecuting]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting(e,-args)%})|
| [InteractiveActionEnter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionenter(e,-args)%})|
| [InteractiveActionLeave]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionleave(e,-args)%})|



