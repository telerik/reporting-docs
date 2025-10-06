---
title: Embedded Styles
page_title: Migrate to using embedded styles in the WPF Report Viewer
description: "Learn how to migrate to using the embedded XAML styling with the WPF Report Viewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-migrate-to-embedded-styles
tags: how,to,migrate,to,embedded,styles
published: True
reporting_area: WPF
position: 3
previous_url: /wpf-report-viewer-migrate-to-embedded-styles, /embedding-reports/display-reports-in-applications/wpf-application/how-to-migrate-to-embedded-styles
---

# Migrating to Embedded Styling

With [Telerik Reporting R2 2018 SP1(12.1.18.620)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2018-sp1-12-1-18-620) we have introduces implicit XAML styles embedded in the new `Telerik.ReportViewer.Wpf.Themes` assembly. This will further simplify the update process and no manual XAML styles replacement will be required. Once the project is migrated to *embedded* XAML style, the [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}) will automatically update the `Telerik.ReportViewer.Wpf.Themes` assembly.

> Migration to embedded XAML styles is only possible for the default implicit XAML styles, that haven't been previously modified.

1. Add assembly reference to `Telerik.ReportViewer.Wpf.Themes`.
1. Update the following XAML styles in the `Application.xaml`(or `App.xaml`) to use the embedded implicit XAML styles:

	* `System.Windows.xaml`
	* `Telerik.Windows.Controls.xaml`
	* `Telerik.Windows.Controls.Input.xaml`
	* `Telerik.Windows.Controls.Navigation.xaml`
	* `Telerik.ReportViewer.Wpf.xaml`

	The Application Resources should look as shown in the following snippet:

	{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\App.xaml}}


1. Delete the above XAML files from the project.
