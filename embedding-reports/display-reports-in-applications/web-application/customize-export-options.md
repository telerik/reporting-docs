---
title: Customizing Export Options
page_title: Customizing Export Options in Telerik Reporting Web Viewers
description: "Learn how to set default values, make settings read-only, and hide settings through Reporting REST Service configuration for Telerik Reporting web viewers."
slug: customize-export-options
tags: export,settings,rest-service,viewer
tag: new
published: True
position: 11
reportingArea: General
components: [general]
---

# Customizing Export Options in Telerik Reporting Web Viewers

Configure rendering extension settings on the Reporting REST Service to set default values, make settings read-only, or hide settings in the Export Options dialog. The viewer displays the settings returned by the service.

> The feature was introduced with [Telerik Reporting 2026 Q3 (20.2.26.1007)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q3-(20-2-26-1007)).

## Prerequisites

- An ASP.NET Core Reporting REST Service or a .NET Framework Web API service that uses a custom `ReportsController`.
- A web report viewer connected to that service.

## Overview

Customize settings for each rendering extension, such as PDF. You can prepopulate values, prevent users from changing selected values in the dialog, or omit settings from the dialog.

> note The read-only and hidden states apply to both the Export Options dialog and document creation on the REST service.

## .NET

The ASP.NET Core Reporting REST Service supports controller overrides and a callback during service registration.

### Customize Settings in an ASP.NET Core Controller

In an ASP.NET Core REST Service, override `GetExportOptions` in the `ReportsController` subclass. Call `base.GetExportOptions` to retain the default filtering behavior. This example sets PDF defaults, makes the document author read-only, and hides security-related settings:

{{source=CodeSnippets\Blazor\Docs\Controllers\ReportsController.cs region=Customize_GetExportOptions}}

The sample changes only settings for the PDF rendering extension. Update the extension name and setting names to match the format you want to customize.

### Customize Settings During Service Registration

When you configure the Reporting REST Service through `AddTelerikReporting`, pass an `ExportOptionsContext` with a callback:

{{source=CodeSnippets\Blazor\Docs\ProgramGetExportOptions.cs region=ServiceRegistration_GetExportOptions}}

## .NET Framework

In a .NET Framework Web API service, derive your controller from `Telerik.Reporting.Services.WebApi.ReportsControllerBase` and override `GetExportOptions`. The following example applies the same PDF policy as the ASP.NET Core example:

{{source=CodeSnippets\MvcCS\Controllers\ReportsControllerGetExportOptions.cs region=GetExportOptions}}

The .NET Framework Web API controller uses the same `GetExportOptions` policy as ASP.NET Core. The service enforces hidden and read-only settings when it creates documents, including direct exports.

## Notes

The REST service applies the same export policy before it creates each document. ASP.NET Core controllers, minimal APIs, and .NET Framework Web API controllers enforce these rules:

- `ReadOnly` prevents changes in the dialog. The service applies the configured value even if the client supplies another value or omits the setting.
- `Hidden` omits the setting from the dialog. The service discards client overrides. If the callback changes the hidden value, the service applies that value.
- Removing a setting from the returned options also prevents client overrides of that setting.

By default, the service discards client overrides of PDF settings in the Security group and the JavaScript setting. A custom policy can explicitly expose these settings.

These rules also apply to direct exports when the Export Options dialog is disabled. The service removes blocked overrides before it calculates the document cache key. Trusted application configuration and report runtime settings remain in effect when a client override is discarded.

In .NET Framework Web API controllers, the trusted `OnCreateDocument` hook runs after the service applies the export policy to client settings.

## Next Steps

- [Review Export Options behavior across Telerik Reporting web viewers](slug:web-report-viewers-export-options-dialog)

## See Also

- [Configure Export Options in the HTML5 Report Viewer](slug:html5-report-viewer-export-options-dialog)
- [Configure Export Options in the Native Angular Report Viewer](slug:native-angular-report-viewer-export-options-dialog)
- [Configure Export Options in the Native Blazor Report Viewer](slug:native-blazor-report-viewer-export-options-dialog)
