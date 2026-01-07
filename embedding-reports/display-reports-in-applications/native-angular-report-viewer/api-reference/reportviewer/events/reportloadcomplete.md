---
title: reportLoadComplete
page_title: reportLoadComplete event
description: "Event emitted after the rendering of a report ends. Provides complete document information including page count, document map availability, etc. The event handler receives an object of type 'DocumentInfo' containing the document information object. The DocumentInfo type should be imported from '@progress/telerik-common-report-viewer'.  reportLoadComplete"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/reportloadcomplete
published: True
reportingArea: NativeAngular
---

# The `reportLoadComplete` event of the Native Angular Report Viewer

Event emitted after the rendering of a report ends. Provides complete document information including page count, document map availability, etc. The event handler receives an object of type 'DocumentInfo' containing the document information object. The DocumentInfo type should be imported from '@progress/telerik-common-report-viewer'.  reportLoadComplete

## Example

````html
<reporting-angular-viewer
 (reportLoadComplete)="reportLoadComplete($event)">
</reporting-angular-viewer>
````

````typescript
reportLoadComplete(documentInfo: DocumentInfo) {
 console.log("The document information such as the page count, whether it has a document map, etc. will be sent via the documentInfo object.", documentInfo);
 console.log("This event will be emitted after the rendering of a report ends.");
};
````

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/overview%})
* [reportLoadProgress]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/reportloadprogress%})
* [reportVersionMismatch]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/reportversionmismatch%})

