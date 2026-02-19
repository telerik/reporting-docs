---
title: Missing Export Options in Viewers or Rendering Format Not Available
description: "Learn why the viewers may not show the DOCX, XLSX, PPTX, and XPS export options or when trying to export a report to a rendering format it is failing due to that rendering format not being available."
type: how-to
page_title: OpenXML and XPS options not visible. Unavailable rendering format
slug: missing-docx-xlsx-pptx-xps-export-options
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Rendering Format</td>
			<td>DOCX, XLSX, PPTX, XPS</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>All</td>
		</tr>
	</tbody>
</table>

## Description

Trying to export a report to a rendering format is failing due to that rendering format not being available.

## Error Message

`Missing DOCX, XLSX, PPTX, XPS export options.`

If you export programmatically, the error message will be: 

`{X} rendering format is not available`

where {X} is DOCX, XLSX, PPTX, or XPS.

## Possible Cause

Usually, this is related to not having the Telerik Reporting rendering format specific assemblies referenced in the project or the rendering format being unavailable altogether due to limitations in .NET Core projects - [.NET Core Support]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%}).

## Solution

### XPS

The `XPS` rendering extension requires the `Telerik.Reporting.XpsRendering.dll` assembly. This format is only available for .NET Framework projects.

### DOCX/PPTX/XLSX

The `DOCX/PPTX/XLSX` rendering extensions are OpenXML formats and require two components:

1. A Telerik Reporting OpenXML rendering assembly
1. The [Open XML SDK]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (`DocumentFormat.OpenXml.dll`)

The specific assembly/package you need depends on your project type and the version of `DocumentFormat.OpenXml` you are using.

#### NuGet Packages (Recommended)

To resolve the issue, you can use one of the following NuGet packages:

| NuGet Package | Contains Assembly | Compatible DocumentFormat.OpenXml Version |
|---------------|-------------------|-------------------------------------------|
| `Telerik.Reporting.OpenXmlRendering` | `Telerik.Reporting.OpenXmlRendering.2.7.2.dll` | 2.7.2 and above (up to 3.0.0) |
| `Telerik.Reporting.OpenXmlRendering3` | `Telerik.Reporting.OpenXmlRendering.3.0.1.dll` | 3.0.1 and above |

> The `Telerik.Reporting.OpenXmlRendering3` package was introduced in Telerik Reporting 2024 Q1 (18.0.24.130).

Choose the package that matches your `DocumentFormat.OpenXml` version. For example, if your project uses `DocumentFormat.OpenXml` version 3.x, install the `Telerik.Reporting.OpenXmlRendering3` NuGet package.

#### Direct Assembly References (Manual)

You can also reference assemblies directly, which is common in .NET Framework projects when you manage dependencies manually. The following assemblies are available:

| Assembly | Compatible DocumentFormat.OpenXml Version |
|----------|-------------------------------------------|
| `Telerik.Reporting.OpenXmlRendering.dll` | 2.0.5022.0 and 2.5.5631.0 |
| `Telerik.Reporting.OpenXmlRendering.2.7.2.dll` | 2.7.2.0 and later (up to 3.0.0.0) |
| `Telerik.Reporting.OpenXmlRendering.3.0.1.dll` | 3.0.1.0 and later |

> The base `Telerik.Reporting.OpenXmlRendering.dll` assembly (without version suffix) is only available for .NET Framework projects and is not distributed via NuGet.

#### Binding Redirects (.NET Framework)

Binding redirects apply to .NET Framework apps that load assemblies via `app.config` or `web.config`. If your `DocumentFormat.OpenXml` version differs from the one the Telerik assembly was compiled against, add a binding redirect. See [Deploy Telerik Reporting with newer OpenXML SDK version]({%slug deploy-telerik-reporting-with-newer-openxml-sdk-version%}) for details.

### Where to Add References

Add the assembly/package references to the project that handles report processing:

* If the project uses [ReportProcessor](/api/telerik.reporting.processing.reportprocessor) instance, add the references to that project.
* If the project uses a viewer that operates via [Telerik Reporting Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}), add the references to the service project.
* If the project uses a desktop viewer or the [obsolete ASP.NET WebForms ReportViewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%}), add the references to the viewer project.

On deploying the application, verify that the above-listed assemblies are copied in the `bin` folder. For this purpose, select the references in Visual Studio and set their `CopyLocal` to `true`.

## See Also

* [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%})
* [Deploy Telerik Reporting with newer OpenXML SDK version]({%slug deploy-telerik-reporting-with-newer-openxml-sdk-version%})
* [.NET Core Support]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%})
