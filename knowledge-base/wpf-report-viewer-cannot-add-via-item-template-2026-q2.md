---
title: WPF Report Viewer Cannot Be Added via Item Template in 2026 Q2
page_title: WPF Report Viewer Cannot Be Added through Item Templates in Telerik Reporting 2026 Q2 (20.1.26.520) in .NET Framework
description: "Resolve the issue where the Telerik Reporting WPF Report Viewer item template fails in Visual Studio after upgrading .NET Framework projects to 2026 Q2 (20.1.26.520)."
type: troubleshooting
slug: wpf-report-viewer-cannot-add-via-item-template-2026-q2
tags: wpf, report viewer, item template, visual studio, 2026 q2, installation, .net framework
res_type: kb
---

## Environment

<table>
	<tbody>
	<tr>
			<td>Target Framework</td>
			<td>.NET Framework 4.6.2+</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Product Version</td>
			<td>2026 Q2 (20.1.26.520)</td>
		</tr>
		<tr>
			<td>Viewer</td>
			<td>WPF Report Viewer</td>
		</tr>
	</tbody>
</table>

## Description

After upgrading to [Telerik Reporting 2026 Q2 (20.1.26.520)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q2-(20-1-26-520)), adding the WPF Report Viewer to a .NET Framework project through the **Telerik Report Viewer Window 2026 Q2 (.NET Framework)** item template in Visual Studio does not complete successfully.

## Error

![Error when adding the WPF Report Viewer 2026 Q2 to a .NET Framework WPF project via Item Template.](images\wpf-viewer-cannot-add-via-item-template-2026-q2.png)

## Cause

The **Telerik Report Viewer Window 2026 Q2 (.NET Framework)** item template shipped with Telerik Reporting 2026 Q2 has a known issue that prevents it from completing the viewer setup correctly. This is a regression introduced in this release that is fixed in later releases.

Telerik Reporting distributes the required Telerik UI for WPF dependencies for the WPF Report Viewer with the Reporting installer. The viewer's item template gets the version of the Telerik UI for WPF packages it tries to install from the offline assemblies in the Reporting installation folder. This version is wrong, `2026.1.520` and the required WPF packages cannot be found. The correct version of the WPF controls is `2026.2.520`.

## Solution 1: Use Item Template Wizard

When adding the Telerik WPF Report Viewer to your project through the **item template wizard**, use one of the following approaches to add the required Telerik UI for WPF dependencies:

* Ensure adding them as direct references from the Telerik Reporting installation folder, by default, 'C:\Program Files (x86)\Progress\Telerik Reporting 2026 Q2\Bin\WpfViewerDependencies\Framework'.
* Add manually the Telerik UI for WPF NuGet packages or assemblies with the correct version (`2026.2.520` or later) to your project. You may need binding redirects to the newer version as explained in the [Binding Redirects](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project#binding-redirects) article section.

## Solution 2: Manual Setting

Add manually your Telerik WPF Report Viewer, following the steps in the article [Manually Setting Up the WPF Report Viewer in .NET Framework](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project).

## See Also

* [WPF Report Viewer Overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview)
* [Integrating the WPF Report Viewer in .NET Framework](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-framework-project)
* [Manually Setting Up the WPF Report Viewer in .NET Framework](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project)
* [Visual Studio Extensions for Telerik Reporting](slug:reporting-integration-with-visual-studio)
