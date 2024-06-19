---
title: Event Binding
page_title: Binding to the React Report Viewer's Events 
description: "Learn how to bind to the different events exposed by the React Report Viewer component, using the provided examples."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/event-binding
tags: react, report, viewer, event, binding
published: True
position: 3
previous_url: /react-report-viewer-event-binding
---

# Binding to Events

The React Report Viewer exposes these [Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/events%}) as input properties of the viewer component.

## Bind to a report viewer event

To attach an event handler to the viewer, specify the name of your function when binding the corresponding input property of the viewer component. For example, we can attach to the __ready__ and __viewerToolTipOpening__ events of the viewer:

````HTML
<TelerikReportViewer
	...
	ready='myReadyHandler'
	viewerToolTipOpening='myViewerToolTipOpeningHandler' />
````

Then we create the event handler functions in the component where the viewer is used:

````JavaScript
export class AppComponent {
	myReadyHandler() {
		console.log('The viewer is ready!');
	}
	myViewerToolTipOpeningHandler(e: any, args: any) {
		console.log('Tooltip shows: ' + args.toolTip.text);
	}
}
````

For a complete list of event handler options please check [Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/events%}).
