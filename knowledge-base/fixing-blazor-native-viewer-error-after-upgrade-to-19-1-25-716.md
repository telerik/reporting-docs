---
title: Resolving Error After Upgrading to 19.1.25.716 with Blazor Native Viewer
description: Learn how to address the error thrown by Blazor Native Viewer after upgrading to Telerik Reporting version 19.1.25.716.
type: how-to
page_title: Fixing the Blazor Native Viewer Error After Upgrade to 19.1.25.716
meta_title: Fixing the Blazor Native Viewer Error After Upgrade to 19.1.25.716
slug: fixing-blazor-native-viewer-error-after-upgrade-to-19-1-25-716
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

I upgraded my project to Telerik Reporting version 19.1.25.716, which uses the [Blazor Native Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}). After the upgrade, I encountered the following error:

```
System.InvalidOperationException: Object of type 'Telerik.Blazor.Components.TelerikWindow' does not have a property matching the name 'Centered'.
   at Microsoft.AspNetCore.Components.Reflection.ComponentProperties.ThrowForUnknownIncomingParameterName(Type targetType, String parameterName)
   at Microsoft.AspNetCore.Components.Reflection.ComponentProperties.SetProperties(ParameterView& parameters, Object target)
   at Telerik.Blazor.Components.TelerikWindow.SetParametersAsync(ParameterView parameters)
   at Microsoft.AspNetCore.Components.Rendering.ComponentState.SupplyCombinedParameters(ParameterView directAndCascadingParameters)
```

This error occurs because the Blazor Native Viewer depends on version `7.1.0` of the Telerik UI for Blazor components and tries to access the `Centered` parameter of the TelerikWindow component. This parameter was removed in version `9.0.0`. Compatibility issues arise due to the dependency mismatch.

## Solution

To resolve this issue, choose one of the following approaches:

### Downgrade Telerik UI for Blazor

1. Downgrade the `Telerik.UI.for.Blazor` package in your project to version `7.1.0`.
1. Ensure compatibility between the Blazor Native Viewer and the Telerik UI for Blazor components.

### Switch to Blazor Report Viewer

1. Use the [Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) instead of the Blazor Native Viewer.
1. The Blazor Report Viewer acts as a wrapper for the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and does not depend on Telerik UI for Blazor components.
1. Replace the Blazor Native Viewer in your project with the Blazor Report Viewer to avoid conflicts.

### Wait for Updated Dependencies

1. The Reporting team plans to update the `Telerik.UI.for.Blazor` dependency in the Q3 2025 release.
1. Monitor the release notes for updates addressing this issue.

## See Also

* [Breaking Changes in 9.0.0: Window](https://www.telerik.com/blazor-ui/documentation/upgrade/breaking-changes/9-0-0#window)
* [Forum: TelerikWindow does not have a property matching the name 'Centered'](https://www.telerik.com/forums/telerik-blazor-components-telerikwindow-does-not-have-a-property-matching-the-name-centered?_gl=1*1ky0ygo*_ga_9JSNBCSF54*czE3NTMwODAxMjUkbzEzJGcxJHQxNzUzMDg2ODQzJGo3JGwwJGgw)
* [Feature Request: Native Blazor Viewer Throws Error Related to 'Centered'](https://feedback.telerik.com/reporting/1693306-native-blazor-viewer-throws-telerik-blazor-components-telerikwindow-does-not-have-a-property-matching-the-name-centered?_gl=1*18c1v11*_gcl_au*MTU2NDQxNzkuMTc1MzA4NzAzMQ..*_ga*MzAyODQwMTI5LjE3NTMwODcwMzE.*_ga_9JSNBCSF54*czE3NTMwODAxMjUkbzEzJGcxJHQxNzUzMDg3MzA3JGozMyRsMCRoMA..)
* [HTML5 Report Viewer Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
