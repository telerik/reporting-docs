---
title: Client Events
page_title: Client Events at a Glance
description: "Learn what are the Client Events exposed by the HTML5 ASP.NET WebForms Report Viewer in Telerik Reporting and how to configure them."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/client-events
tags: client,events
published: True
position: 6
previous_url: /html5-webforms-report-viewer-customizing-client-api
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# Client Events Overview

This article explains how to attach client event handlers to an WebForms wrapper of the HTML5 Report Viewer instance.

To attach a client event handler you have to set the appropriate ClientEvents tag as shown below:

````XML
<telerik:ReportViewer ID="reportViewer1" runat="server">
	<ClientEvents RenderingBegin="onRenderingBegin" />
	...
````
````JavaScript
<script>
	function onRenderingBegin() {
		console.log("rendering begin!");
	}
</script>
````


The following table lists the available client events: 

|  __Event__ |  __Description__ |
| ------ | ------ |
|RenderingBegin|Occurs before rendering the report. For the underlying JS methods see [RenderingBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingbegin(e,-args)%})|
|RenderingEnd|Occurs after rendering the report. For the underlying JS methods see [RenderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)%})|
|PrintBegin|Occurs before printing the report. For the underlying JS methods see [PrintBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/printbegin(e,-args)%})|
|PrintEnd|Occurs after printing the report. For the underlying JS methods see [PrintEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/printend(e,-args)%})|
|ExportBegin|Occurs before exporting the report. For the underlying JS methods see [ExportBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/exportbegin(e,-args)%})|
|ExportEnd|Occurs after exporting the report. For the underlying JS methods see [ExportEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/exportend(e,-args)%})|
|UpdateUi|Occurs on each UI update of the viewer. For the underlying JS methods see [UpdateUi]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/updateui(e)%})|
|Error|Error occurred. For the underlying JS methods see [Error]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/error(e,-args)%})|
|PageReady|Occurs after a page of the report is ready. For the underlying JS methods see [PageReady]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/pageready(e,-args)%})|
|Ready|Report viewer is ready. For the underlying JS methods see [Ready]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/ready()%})|
|InteractiveActionExecuting|Occurs before an interactive action is executed, providing the ability to cancel the execution. For the underlying JS methods see [InteractiveActionExecuting]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting(e,-args)%})|
|InteractiveActionEnter|Occurs when the mouse cursor enters the area of an interactive action. For the underlying JS methods see [InteractiveActionEnter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionenter(e,-args)%})|
|InteractiveActionLeave|Occurs when the mouse cursor leaves the area of an interactive action. For the underlying JS methods see [InteractiveActionLeave]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionleave(e,-args)%})|
|ViewerToolTipOpening|Occurs before a tooltip is opened, providing the ability to cancel its opening. For the underlying JS methods see [ViewerToolTipOpening]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/viewertooltipopening(e,-args)%})|
|SendEmailBegin|Occurs before the report is exported and the E-mail message is sent. For the underlying JS methods see [SendEmailBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/sendemailbegin(e,-args)%})|
|SendEmailEnd|Occurs after the report is exported and before the E-mail message is sent. For the underlying JS methods see [SendEmailEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/sendemailend(e,-args)%})|
