---
title: error
page_title: error event
description: "Event emitted when an error occurs in the viewer. Provides error message details for debugging and user notification. The event handler receives a 'string' argument containing the error message.  error  ```html <reporting-angular-viewer  (error)=\"error($event)\"> </reporting-angular-viewer> ```"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/error
published: True
reportingArea: NativeAngular
---

# The `error` event of the Native Angular Report Viewer

Event emitted when an error occurs in the viewer. Provides error message details for debugging and user notification. The event handler receives a 'string' argument containing the error message.  error

```html <reporting-angular-viewer  (error)="error($event)"> </reporting-angular-viewer> ```

## Example

    ````typescript
error(message: string) {
 console.log("The error message.", message);
 console.log("This event will be emitted when viewer encounters an error.");
};
````


