---
title: currentPageChanged
page_title: currentPageChanged event
description: "Event emitted when the current page changes. Provides information about the new current page and report document ID. The event handler receives an object of type 'CurrentPageOptions' containing the new current page number and report document ID.  currentPageChanged"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/currentpagechanged
published: True
reportingArea: NativeAngular
---

# The `currentPageChanged` event of the Native Angular Report Viewer

Event emitted when the current page changes. Provides information about the new current page and report document ID. The event handler receives an object of type 'CurrentPageOptions' containing the new current page number and report document ID.  currentPageChanged

## Example

````html
<reporting-angular-viewer
 (currentPageChanged)="currentPageChanged($event)">
</reporting-angular-viewer>
````

````typescript
currentPageChanged(currentPageChangedEventArgs: CurrentPageChangedEventArgs) {
 console.log("The page number and document id.", currentPageChangedEventArgs);
 console.log("This event will be emitted when the viewer changes its currently displayed page.");
};
````

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/overview%})
* [error]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/error%})
* [exportDocumentReady]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/exportdocumentready%})

