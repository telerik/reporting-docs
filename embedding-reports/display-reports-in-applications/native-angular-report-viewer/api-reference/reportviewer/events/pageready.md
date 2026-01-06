---
title: pageReady
page_title: pageReady event
description: "Event emitted when a report page is ready. Provides information about the rendered page, including page number and content details. The event handler receives an object of type 'PageInfo' containing details about the rendered page. The 'PageInfo' type should be imported from '@progress/telerik-common-report-viewer'.  pageReady"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/pageready
published: True
reportingArea: NativeAngular
---

# The `pageReady` event of the Native Angular Report Viewer

Event emitted when a report page is ready. Provides information about the rendered page, including page number and content details. The event handler receives an object of type 'PageInfo' containing details about the rendered page. The 'PageInfo' type should be imported from '@progress/telerik-common-report-viewer'.  pageReady

## Example

````html
<reporting-angular-viewer
 (pageReady)="pageReady($event)">
</reporting-angular-viewer>
````

````typescript
pageReady(pageInfo: PageInfo) {
 console.log("The current page information such as the page number, the page content, etc.", pageInfo);
 console.log("This event will be emitted when the viewer content has been loaded from the template and is ready to display reports or perform any other operations on it.");
};
````

