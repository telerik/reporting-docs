---
title: 'Telerik.Blazor.Components.TelerikWindow' does not have a property matching the name 'Centered'
description: Learn how to address the error thrown by Blazor Native Viewer Object of type 'Telerik.Blazor.Components.TelerikWindow' does not have a property matching the name 'Centered'
type: how-to
page_title: Blazor Native Viewer throws Object of type 'Telerik.Blazor.Components.TelerikWindow' does not have a property matching the name 'Centered'
meta_title: Blazor Native Viewer throws Object of type 'Telerik.Blazor.Components.TelerikWindow' does not have a property matching the name 'Centered'
slug: telerikwindow-does-not-have-property-matching-name-centered
tags: reporting,blazor-native-viewer,error,telerik-ui-for-blazor,telerikwindow,centered
res_type: kb
ticketid: 1693434
---

## Environment

<table>
    <tbody>
        <tr>
            <td> Product </td>
            <td> Reporting Blazor Native Viewer </td>
        </tr>
        <tr>
            <td> Version </td>
            <td> Current </td>
        </tr>
    </tbody>
</table>

## Description

I upgraded my Telerik Reporting project, which uses the [Blazor Native Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}). After the upgrade, I encountered the following error:

````
System.InvalidOperationException: Object of type 'Telerik.Blazor.Components.TelerikWindow' does not have a property matching the name 'Centered'.
   at Microsoft.AspNetCore.Components.Reflection.ComponentProperties.ThrowForUnknownIncomingParameterName(Type targetType, String parameterName)
   at Microsoft.AspNetCore.Components.Reflection.ComponentProperties.SetProperties(ParameterView& parameters, Object target)
   at Telerik.Blazor.Components.TelerikWindow.SetParametersAsync(ParameterView parameters)
   at Microsoft.AspNetCore.Components.Rendering.ComponentState.SupplyCombinedParameters(ParameterView directAndCascadingParameters)
````

This error occurs because the Blazor Native Viewer depends on version `7.1.0` of the Telerik UI for Blazor components and tries to access the `Centered` parameter of the TelerikWindow component. This parameter was removed in version `9.0.0`. Compatibility issues arise due to the dependency mismatch.

## Solution

To resolve this issue, choose one of the following approaches:

### Downgrade Telerik UI for Blazor

Downgrade the `Telerik.UI.for.Blazor` package in your project to version `7.1.0` to ensure compatibility between the Blazor Native Viewer and the Telerik UI for Blazor components.

### Switch to Blazor Report Viewer

Use the [Blazor HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%}) instead of the Blazor Native Viewer. The Blazor Report Viewer acts as a wrapper for the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and does not depend on Telerik UI for Blazor components.

### Wait for Updated Dependencies

The Reporting team plans to update the `Telerik.UI.for.Blazor` dependency in the Q3 2025 release. Monitor the release notes for updates addressing this issue.

## See Also

* [Breaking Changes in 9.0.0: Window](https://www.telerik.com/blazor-ui/documentation/upgrade/breaking-changes/9-0-0#window)
* [Forum: TelerikWindow does not have a property matching the name 'Centered'](https://www.telerik.com/forums/telerik-blazor-components-telerikwindow-does-not-have-a-property-matching-the-name-centered?_gl=1*1ky0ygo*_ga_9JSNBCSF54*czE3NTMwODAxMjUkbzEzJGcxJHQxNzUzMDg2ODQzJGo3JGwwJGgw)
* [Feature Request: Native Blazor Viewer Throws Error Related to 'Centered'](https://feedback.telerik.com/reporting/1693306-native-blazor-viewer-throws-telerik-blazor-components-telerikwindow-does-not-have-a-property-matching-the-name-centered?_gl=1*18c1v11*_gcl_au*MTU2NDQxNzkuMTc1MzA4NzAzMQ..*_ga*MzAyODQwMTI5LjE3NTMwODcwMzE.*_ga_9JSNBCSF54*czE3NTMwODAxMjUkbzEzJGcxJHQxNzUzMDg3MzA3JGozMyRsMCRoMA..)
* [HTML5 Report Viewer Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
