---
title: bind
page_title: The bind method of the Angular Report Viewer explained
description: "Learn more about the bind method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind
tags: bind
published: True
reportingArea: AngularWrapper
position: 13
---

# The `bind` method of the Angular Report Viewer

Binds an event handler to a report viewer event.

## Example

````typescript
viewer.bind('ready', () => {
  console.log('Report viewer is ready');
});
````


