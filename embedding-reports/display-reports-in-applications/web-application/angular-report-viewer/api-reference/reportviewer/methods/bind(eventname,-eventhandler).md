---
title: bind(eventName, eventHandler)
page_title: The bind(eventName, eventHandler) method of the Angular Report Viewer explained
description: "Learn more about the bind(eventName, eventHandler) method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind(eventname,-eventhandler)
tags: bind
published: True
reportingArea: AngularWrapper
position: 1
---

# The `bind(eventName, eventHandler)` method of the Angular Report Viewer

Binds an event handler to a report viewer event.

Returns: the current *void* object.

````typescript
viewer.bind('ready', () => {
  console.log('Report viewer is ready');
});
````


## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})

