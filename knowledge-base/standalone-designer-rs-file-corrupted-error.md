---
title: File Contains Corrupted Data When Saving to Report Server
description: "Resolve the File contains corrupted data error when a Standalone Report Designer for .NET Framework connects to Telerik Report Server for .NET."
type: troubleshooting
page_title: Fix File Contains Corrupted Data in Standalone Report Designer
meta_title: Fix File Contains Corrupted Data in Standalone Report Designer
slug: standalone-designer-rs-file-corrupted-error
tags: reporting, standalone designer, error, file corrupted, report server, .net
res_type: kb
ticketid: 1720587
---

## Environment

<table>
<tbody>
<tr>
<td> Products </td>
<td>
Telerik Reporting, Telerik Report Server
</td>
</tr>
<tr>
<td> Telerik Reporting Version </td>
<td>
20.3.26.1110
</td>
</tr>
<tr>
<td> Report Designer </td>
<td> Standalone Report Designer for .NET Framework </td>
</tr>
<tr>
<td> Report Server </td>
<td> Report Server for .NET </td>
</tr>
</tbody>
</table>

## Description

When you create or save a blank report directly on Report Server, the [Standalone Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview) may display `File contains corrupted data`.

The reported scenario uses the Standalone Report Designer for .NET Framework with Report Server for .NET. The error can occur even if you can sign in to the server.

A local save followed by an upload through the Report Server web application can succeed. That operation bypasses the direct server connection, but does not correct the designer mismatch.

## Error Message

The error includes the following stack trace:

```text
System.IO.FileFormatException: File contains corrupted data.
   at MS.Internal.IO.Zip.ZipIOEndOfCentralDirectoryBlock.FindPosition(Stream archiveStream)
   at MS.Internal.IO.Zip.ZipIOEndOfCentralDirectoryBlock.SeekableLoad(ZipIOBlockManager blockManager)
   at MS.Internal.IO.Zip.ZipArchive..ctor(Stream archiveStream, FileMode mode, FileAccess access, Boolean streaming, Boolean ownStream)
   at MS.Internal.IO.Zip.ZipArchive.OpenOnStream(Stream stream, FileMode mode, FileAccess access, Boolean streaming)
   at System.IO.Packaging.ZipPackage..ctor(Stream s, FileMode mode, FileAccess access, Boolean streaming)
   at System.IO.Packaging.Package.Open(Stream stream, FileMode packageMode, FileAccess packageAccess, Boolean streaming)
   at Telerik.Reporting.Utils.ZipFile.Open(Stream stream)
   at Telerik.Reporting.Utils.ZipResourceHandler.LoadResources(Stream stream)
   at Telerik.Reporting.ReportPackager.UnpackageDocument(Stream packageStream)
   at Telerik.Reporting.Interfaces.IAnalyticsExtensions.<>c__DisplayClass0_0.<AnalyticsUseFeature>b__0()
   at Telerik.Reporting.Interfaces.IAnalyticsExtensions.UseFeature[T](IAnalytics analytics, Func`1 func, String featureName, String featureCategory, Field[] extraParams)
   at Telerik.ReportDesigner.Packages.ReportDesigner.Serialization.PackageDocDataHandler.DeserializeReportDocument(IDesignerLoaderHost targetHost)
   at Telerik.ReportDesigner.Packages.ReportDesigner.Serialization.ReportDocumentDesignerLoader.PerformLoad(IDesignerSerializationManager serializationManager)
```

## Cause

A mismatch between the server and designer framework variants can cause this failure. The .NET Framework and .NET variants use different serialization implementations. A successful connection or matching report-definition schema does not establish compatibility between these variants.

The stack trace shows a failure while the designer reads a report package. The message alone does not establish that an existing saved report is damaged.

## Solution

Use the Standalone Report Designer distributed with the target Report Server, or the one from lan independently downloaded Reporting version that matches both the framework variant and the server's release.

The following table identifies the corresponding executables:

| Report Server | Standalone Report Designer |
| --- | --- |
| Report Server for .NET Framework 4.6.2 | `Telerik.ReportDesigner.exe` or `Telerik.ReportDesigner.x86.exe` |
| Report Server for .NET | `Telerik.ReportDesigner.Net.exe` or `Telerik.ReportDesigner.Net.x86.exe` |

To correct the direct connection:

1. Confirm whether the target server uses .NET or .NET Framework. Ask your server administrator if necessary.
1. Save any reports with unsaved changes to local files before you close the current designer.
1. For Report Server for .NET, enable **Enable Standalone Report Designer** under **Configuration** > **Designer** if needed. This setting requires administrator access. For details, see [Report Server Designer Settings](https://docs.telerik.com/report-server/implementer-guide/configuration/designer#standalone-report-designer).
1. In the target server's web management application, use the new-report or edit action to access its designer download. Download and start the executable for that server. See [Accessing the Standalone Report Designer](https://docs.telerik.com/report-server/user-guide/report-designer#access).
1. For the reported .NET scenario, start `Telerik.ReportDesigner.Net.exe`, not `Telerik.ReportDesigner.exe`. Connect to the same server and create a blank report with a new name to avoid overwriting an existing report.
1. Save and publish the report, then preview it in Report Server to verify the result. For the procedure, see [Working with Report Server Reports](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/working-with-report-server-reports).

>important After a server upgrade, download a fresh copy of the designer from that server. A newer designer from another installation may use a schema that the server does not support.

This solution addresses direct server/designer communication. If you upload a local report instead, verify that the server supports its schema, format, features, and dependencies. Preview the report after upload.

## Further Troubleshooting

If the error persists with the server-provided designer, preserve the original report and provide Telerik Support with the following details:

- Report Server and Standalone Report Designer versions and framework variants
- Full exception and whether it occurs for a new blank report, an existing report, or both

## See Also

- [Server and Designer Compatibility](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/working-with-report-server-reports#server-and-designer-compatibility)
- [Report Server Schema Compatibility](https://docs.telerik.com/report-server/user-guide/report-designer#schema-compatibility)
- [Declarative Report Definition](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/xml-report-definition)
