---
title: Client Events
page_title: Client Events | for Telerik Reporting Documentation
description: Client Events
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/client-events
tags: client,events
published: True
position: 6
---

# Client Events



This article explains how to attach client event handlers to an WebForms wrapper of the HTML5 Report Viewer instance.

## 

To attach a client event handler you have to set the appropriate ClientEvents tag as shown below:         

	
````xml
        <telerik:ReportViewer
            ID="reportViewer1"
            runat="server">
            <ClientEvents RenderingBegin="onRenderingBegin" />
````
````js
          <script>
            function onRenderingBegin() {
                console.log("rendering begin!");
            }
          </script>
````



The following table lists the available client events:         


|  __Event__  |  __Description__  |
| ------ | ------ |
|RenderingBegin|Occurs before rendering the report. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingbegin(e,-args)%})|
|RenderingEnd|Occurs after rendering the report. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)%})|
|PrintBegin|Occurs before printing the report. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/printbegin(e,-args)%})|
|PrintEnd|Occurs after printing the report. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/printend(e,-args)%})|
|ExportBegin|Occurs before exporting the report. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/exportbegin(e,-args)%})|
|ExportEnd|Occurs after exporting the report. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/exportend(e,-args)%})|
|UpdateUi|Occurs on each UI update of the viewer. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/updateui(e)%})|
|Error|Error occurred. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/error(e,-args)%})|
|PageReady|Occurs after a page of the report is ready. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/pageready(e,-args)%})|
|Ready|Report viewer is ready. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/ready()%})|
|InteractiveActionExecuting|Occurs before an interactive action is executed, providing the ability to cancel the execution. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting(e,-args)%})|
|InteractiveActionEnter|Occurs when the mouse cursor enters the area of an interactive action. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionenter(e,-args)%})|
|InteractiveActionLeave|Occurs when the mouse cursor leaves the area of an interactive action. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionleave(e,-args)%})|
|ViewerToolTipOpening|Occurs before a tooltip is opened, providing the ability to cancel its opening. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/viewertooltipopening(e,-args)%})|
|SendEmailBegin|Occurs before the report is exported and the E-mail message is sent. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/sendemailbegin(e,-args)%})|
|SendEmailEnd|Occurs after the report is exported and before the E-mail message is sent. For the underlying JS methods see [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/sendemailend(e,-args)%}|




# See Also

