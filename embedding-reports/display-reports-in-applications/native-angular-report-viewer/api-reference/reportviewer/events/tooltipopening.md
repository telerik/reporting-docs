---
title: toolTipOpening
page_title: toolTipOpening event
description: "Event emitted when a tooltip is opened. Provides an object containing information about the tooltip. The event handler receives a TooltipEventArgs object containing information about the tooltip. The TooltipEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  toolTipOpening"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/tooltipopening
published: True
reportingArea: NativeAngular
---

# The `toolTipOpening` event of the Native Angular Report Viewer

Event emitted when a tooltip is opened. Provides an object containing information about the tooltip. The event handler receives a TooltipEventArgs object containing information about the tooltip. The TooltipEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  toolTipOpening

## Example

    ````html
<reporting-angular-viewer
 (toolTipOpening)="toolTipOpening($event)">
</reporting-angular-viewer>
````


    ````typescript
toolTipOpening(tooltipEventArgs: TooltipEventArgs) {
 console.log("The tooltip arguments.", tooltipEventArgs);
 console.log("This event will be emitted when a tooltip is opened.");
};
````


