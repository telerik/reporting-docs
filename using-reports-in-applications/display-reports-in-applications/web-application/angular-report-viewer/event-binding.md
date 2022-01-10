---
title: Event Binding
page_title: Event Binding | for Telerik Reporting Documentation
description: Event Binding
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/event-binding
tags: event,binding
published: True
position: 3
---

# Event Binding



The Angular Report Viewer exposes these [Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/events%})         as input properties of the viewer component.       

## Bind to a report viewer event

To attach an event handler to the viewer, specify the name of your function when binding the corresponding input property           of the viewer component. For example, we can attach to the __ready__  and           __viewerToolTipOpening__  events of the viewer:         

    
````HTML
<tr-viewer
    ...
    [ready]="myReadyHandler"
    [viewerToolTipOpening]="myViewerToolTipOpeningHandler">
</tr-viewer>
````

Then we create the event handler functions in the component where the viewer is used:         

    
````js
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

