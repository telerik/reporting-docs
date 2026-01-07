---
title: toolTipClosing
page_title: toolTipClosing event
description: "Event emitted when a tooltip is closed. Provides an object containing information about the tooltip. The event handler receives a TooltipEventArgs object containing information about the tooltip. The TooltipEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  toolTipClosing"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/tooltipclosing
published: True
reportingArea: NativeAngular
---

# The `toolTipClosing` event of the Native Angular Report Viewer

Event emitted when a tooltip is closed. Provides an object containing information about the tooltip. The event handler receives a TooltipEventArgs object containing information about the tooltip. The TooltipEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  toolTipClosing

## Example

````html
<reporting-angular-viewer
 (toolTipClosing)="toolTipClosing($event)">
</reporting-angular-viewer>
````

````typescript
toolTipClosing(tooltipEventArgs: TooltipEventArgs) {
 console.log("The tooltip arguments.", tooltipEventArgs);
 console.log("This event will be emitted when a tooltip is closed.");
};
````

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/overview%})
* [toolTipOpening]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/tooltipopening%})
* [updateUI]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/updateui%})

