---
title: Resolve Kendo UI for jQuery License Warning in ASP.NET Core with Telerik Reporting
page_title: Fix Kendo jQuery License Warnings When Using Report Viewer or Web Report Designer
description: "Learn how to resolve Kendo UI for jQuery license validation warnings in ASP.NET Core applications that use Telerik Reporting viewers or Web Report Designer without other Telerik UI components."
type: troubleshooting
slug: kendo-jquery-license-warning-aspnetcore-reporting
tags: telerik, reporting, kendo, jquery, license, warning, asp.net core, report viewer, web report designer
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
            <td>Progress® Telerik UI for ASP.NET Core</td>
		</tr>
		<tr>
			<td>Version</td>
			<td>19.0.25.211+</td>
            <td>2025.1.227+</td>
		</tr>
	</tbody>
</table>

## Description

When using the HTML5 Report Viewer or Web Report Designer in an ASP.NET Core application that references the full Kendo UI for jQuery library (for example, `kendo.all.min.js` from a CDN), a license validation warning appears in the browser console.

The warning appears specifically on pages that contain only the Report Viewer or Web Report Designer without any other [Telerik UI for ASP.NET Core](https://www.telerik.com/aspnet-core-ui) components.

Example CDN reference in `_Layout.cshtml`:

```HTML
<script src="https://kendo.cdn.telerik.com/2025.1.227/js/kendo.all.min.js"></script>
```

## Cause

This issue occurs because you are referencing the full Kendo UI for jQuery distribution instead of the Telerik Reporting Kendo UI subset.

Telerik Reporting includes a special Kendo UI for jQuery subset that contains only the components required by the Report Viewer and Web Report Designer. The subset files are located in the Telerik Reporting installation directory:

- **Report Viewer**: `C:\Program Files (x86)\Progress\Telerik Reporting {VERSION}\Html5\ReportViewer\js\telerikReportViewer.kendo-{VERSION}.js`
- **Web Report Designer**: `C:\Program Files (x86)\Progress\Telerik Reporting {VERSION}\Html5\ReportDesigner\js\webReportDesigner.kendo-{VERSION}.min.js`

These subset files include only the Kendo UI components required by the Report Viewer and Web Report Designer, which is why they do not require license validation but have limited capabilities compared to the full Kendo UI for jQuery library.

When you reference the full Kendo UI for jQuery library, it requires license validation. Telerik UI for ASP.NET Core includes Kendo UI for jQuery as part of the product and performs this validation automatically by detecting Telerik UI for ASP.NET Core components on the page.

Since Telerik Reporting is a separate product with its own licensing, the Report Viewer and Web Report Designer do not automatically trigger the Telerik UI for ASP.NET Core license validation mechanism when they are the only components on the page.

## Solution

Add the `ActivateKendoScripts()` helper method to pages that contain the Report Viewer or Web Report Designer. This method acts as a placeholder component that activates the Kendo UI for jQuery license validation.

```CSHTML
@(Html.Kendo().ActivateKendoScripts())

<div id="reportViewer1"></div>

<script>
    $(document).ready(function () {
        $("#reportViewer1").telerik_ReportViewer({
            serviceUrl: "api/reports/",
            reportSource: {
                report: "Report1.trdp"
            },
            viewMode: telerikReportViewer.ViewModes.INTERACTIVE,
            scaleMode: telerikReportViewer.ScaleModes.SPECIFIC,
            scale: 1.0
        });
    });
</script>
```

After adding `ActivateKendoScripts()`, the Telerik UI for ASP.NET Core license validation mechanism will detect a component on the page and properly activate the Kendo UI for jQuery license, eliminating the warning.

## Notes

- The `ActivateKendoScripts()` method does not render any visible content; it only serves as a placeholder component for license activation.
- This solution is only necessary when using the full Kendo UI for jQuery library.
- If your application does not use other **Telerik UI for ASP.NET Core** components, consider using the Telerik Reporting Kendo UI subset (described in the [Cause](#cause) section) instead of the full library to avoid this issue entirely.

## See Also

- [HTML5 Report Viewer in ASP.NET Core](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-in-an-asp.net-core-in-.net-5-application)
- [Web Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview)
- [Hosting the Reporting REST Service in ASP.NET Core with Minimal API](slug:how-to-host-reports-service-in-aspnet-core-in-net-6-with-minimal-api)
