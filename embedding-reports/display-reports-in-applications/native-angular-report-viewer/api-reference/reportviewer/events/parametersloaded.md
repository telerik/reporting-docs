---
title: parametersLoaded
page_title: parametersLoaded event
description: "Event emitted when report parameters are loaded. Provides an array of parameter information including their values and metadata. The event handler receives an array of type 'ParameterInfo[]' containing parameter information objects. The ParameterInfo type should be imported from '@progress/telerik-common-report-viewer'.  parametersLoaded"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/parametersloaded
published: True
reportingArea: NativeAngular
---

# The `parametersLoaded` event of the Native Angular Report Viewer

Event emitted when report parameters are loaded. Provides an array of parameter information including their values and metadata. The event handler receives an array of type 'ParameterInfo[]' containing parameter information objects. The ParameterInfo type should be imported from '@progress/telerik-common-report-viewer'.  parametersLoaded

## Example

````html
<reporting-angular-viewer
 (parametersLoaded)="parametersLoaded($event)">
</reporting-angular-viewer>
````

````typescript
parametersLoaded(parameterInfos: ParameterInfo[]) {
 console.log("An array of the parameter values is sent via the parameterInfos object.", parameterInfos);
 console.log("This event will be emitted after the Get Report Parameters request is made.");
};
````

