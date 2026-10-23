---
title: Troubleshoot Report Resolution Failures in Linux Docker with Skia
description: "Learn how to diagnose ReportSerializable errors that persist in Linux Docker containers after enabling the Skia graphics engine."
type: troubleshooting
page_title: Diagnose Report Resolution Errors After Enabling Skia in Docker
slug: troubleshoot-report-resolution-linux-docker-skia
tags: docker, linux, skia, report-resolution, troubleshooting
res_type: kb
---

## Environment

| Property | Value |
| --- | --- |
| Product | Progress Telerik Reporting |
| Deployment | Linux Docker container |
| Graphics Engine | Skia |
| Author |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)|

## Description

An error naming `ReportSerializable` while resolving a TRDX report does not identify the underlying cause. If the application still fails after enabling Skia, collect diagnostic evidence before adding more libraries or changing report storage.

## Solution

1. Capture the complete server-side exception, including every inner exception and the stack trace. Use the tracing steps in [Troubleshooting Reporting Implementation in ASP.NET Core Applications](slug:how-to-troubleshoot-errors-in-asp-net-core-applications). Reproduce the failure inside the container, not only on the Windows development machine, and ensure the application can write to the selected log location.
1. Verify the deployed configuration used by the application hosting the Reporting engine. Check the `processing.graphicsEngine.engineName` setting against the [processing Element](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element#graphics-engine) and confirm that the host references and publishes `Telerik.Drawing.Skia`. Editing configuration or adding a reference in another project does not establish what the running container uses.
1. Compare the Reporting and graphics dependencies published before and after the update. Include `SkiaSharp`, `SkiaSharp.HarfBuzz`, and the native-assets packages required by the selected Telerik release. Inspect the deployed output as well as project references, especially when copying assemblies manually.
1. Verify the final runtime image, including its Linux distribution, architecture, native libraries, and report fonts. Dependencies installed only in a build stage do not establish their availability in the final image. If the Dockerfile already installs the required libraries, verify the image actually running before repeating the installation steps.
1. Use the innermost exception to select the next check:

| Exception evidence | Next check |
| --- | --- |
| `PlatformNotSupportedException` mentioning `System.Drawing.Common` or `Gdip` | Verify the effective graphics configuration and whether report code or resources still invoke System.Drawing. The [platform-error KB](slug:system-drawing-common-is-not-supported-on-non-windows-platforms) distinguishes its historical .NET 6 workaround from Skia guidance. Do not apply that .NET 6 workaround as a .NET 10 Linux fix. |
| `DllNotFoundException` or another native-loading error | Identify the library named by the exception and check the native assets, architecture, and system dependencies in the runtime image. Do not replace native-assets packages solely because the outer message names `ReportSerializable`. |
| `MethodAccessException` or `MissingMethodException` naming a Skia or HarfBuzz API | Check compatibility among the deployed managed and native graphics dependencies. Apply [SkiaSharp conflict guidance](slug:telerik-reporting-skia-harfbuzz-conflict-solution) only when its exception and version conditions match. |
| A file, resource, permission, or report-definition error | Investigate the specific path, resource, access requirement, or serializer error reported by the inner exception. Verify files inside the container instead of treating every resolution failure as a missing graphics library. |

## See Also

* [Linux Docker Container Deployment](slug:telerikreporting/using-reports-in-applications/dot-net-core-support#linux-docker-container)