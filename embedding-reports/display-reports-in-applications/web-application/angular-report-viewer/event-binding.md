---
title: Event Binding
page_title: Handling Angular Report Viewer Events
description: "Learn about what are the events exposed by the Angular Report Viewer and how to attach event handlers to these events."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/event-binding
tags: event,binding
published: True
reportingArea: AngularWrapper
position: 3
previous_url: /angular-report-viewer-event-binding
---

# Event Binding Overview

The Angular Report Viewer exposes these [Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/events%}) as input properties of the viewer component.

## Bind to a report viewer event

To attach an event handler to the viewer, specify the name of your function when binding the corresponding input property of the viewer component. For example, we can attach to the `ready` and `viewerToolTipOpening` events of the viewer:

````HTML
<tr-viewer
	[ready]="myReadyHandler"
	[viewerToolTipOpening]="myViewerToolTipOpeningHandler">
</tr-viewer>
````

Then, we can create the event handler functions in the component where the viewer is used: 

````TypeScript
export class AppComponent {
	myReadyHandler() {
		console.log('The viewer is ready!');
	}
	myViewerToolTipOpeningHandler(e: any, args: any) {
		console.log('Tooltip shows: ' + args.toolTip.text);
	}
}
````

## See Also

* [Angular Report Viewer Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/events%})
