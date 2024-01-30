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

Usually, this is related to not having Telerik Reporting rendering format specific assemblies not being referenced in the project or the rendering format being unavailable altogether due limitations in .NET Core projects - [.NET Core Support]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%}).

## Solution

### XPS

The `XPS` rendering extension requires the `Telerik.Reporting.XpsRendering.dll` assembly.

### DOCX/PPTX/XLSX

`DOCX/PPTX/XLSX` rendering extensions are OpenXML formats and they require `Telerik.Reporting.OpenXmlRendering.dll` and [Open XML SDK 2.0 for Microsoft Office]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (`DocumentFormat.OpenXml.dll v.2.0.5022.0` or above).

If you are using `DocumentFormat.OpenXml` of version `2.5.5631.0`, you will need binding redirect for the `DocumentFormat.OpenXml.dll` assembly - [Deploy Telerik Reporting with newer OpenXML SDK version]({%slug deploy-telerik-reporting-with-newer-openxml-sdk-version%}).

In newer versions of the `DocumentFormat.OpenXml` assembly the `PublicKeyToken` is changed. Thus, if you are using `DocumentFormat.OpenXml` of version `2.7.2.0` or newer you have to reference `Telerik.Reporting.OpenXmlRendering.2.7.2.` or `Telerik.Reporting.OpenXmlRendering.3.0.1.`

**Note:** `Telerik.Reporting.OpenXmlRendering.3.0.1.` is introduced in Telerik Reporting 2024 Q1 (18.0.24.130)

> For even newer versions, also add the required `binding redirect`.

The assembly references must be added in the project that handles reports:

* If the project uses [ReportProcessor](/api/telerik.reporting.processing.reportprocessor) instance, assembly references must be added in that project's configuration file;
* If the project uses a viewer that operates via [Telerik Reporting Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}), the assembly references must be added in the service project's configuration file;
* If the project uses a desktop viewer or the [obsolete ASP.NET WebForms ReportViewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%}), assembly references must be added in the viewer project's configuration file;
* If you are testing the design-time preview in the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}), it is configured to let export in DOCX, PPTX, XLSX and XPS without additional settings;
* If you are testing the design-time preview in [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}), you may not have all export options, unless OpenXML SDK 2.0 is installed on the machine, or if OpenXML SDK 2.5 or greater is installed and you manually add a binding redirect for `DocumentFormat.OpenXml.dll` assembly in the corresponding `devenev.exe.config` file (Visual Studio configuration file). During the [installation]({%slug telerikreporting/installation%}), Telerik Reporting assemblies are automatically registered in the machine's GAC and the design-preview will load them automatically.

## Notes

* If you do not want to install OpenXML SDK, copy `DocumentFormat.OpenXml.dll` next to the corresponding `devenv.exe` (the Visual Studio executable).
* On deploying the application, verify that the above-listed assemblies are copied in the `bin` folder. For this purpose, select the references in Visual Studio and set their `CopyLocal` to `true`.
