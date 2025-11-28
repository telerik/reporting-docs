---
title: Using Rounded Corners
page_title: Set Rounded Corners in the WPF Report Viewer
description: "Learn how to change the corner radius of the WPF Report Viewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/customizing/how-to-use-rounded-corners
tags: how,to,use,rounded,corners,border,radius
published: True
reportingArea: WPF
position: 0
---

# Defining the Border Radius

With the [2024 Q3 (18.2.24.806)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2024-q3-18-2-24-806) release of Telerik Reporting, the border radius of the WPF Report Viewer's borders can be modified from the code behind or the XAML:

````C#
public MainWindow()
{
	this.InitializeComponent();
	this.ReportViewer1.CornerRadius = new CornerRadius(15);
}
````
````XAML
<tr:ReportViewer.ReportSource>
	<telerikReporting:UriReportSource Uri="..\..\..\..\..\..\..\Report Designer\Examples\Report Catalog.trdp" />
				</tr:ReportViewer.ReportSource>
				<tr:ReportViewer.Style>
					<Style TargetType="tr:ReportViewer" BasedOn="{StaticResource {x:Type tr:ReportViewer}}">
						<Setter Property="CornerRadius" Value="5"/>
						<Setter Property="Padding" Value="5"/>
						<Setter Property="BorderThickness" Value="3"/>
						<Setter Property="BorderBrush" Value="Yellow"/>
					</Style>
				</tr:ReportViewer.Style>
</tr:ReportViewer>
````


Supported in all of the themes available to the WPF Report Viewer.

## See Also

* [Migrate to using embedded styles in the WPF Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-migrate-to-embedded-styles%})
* [Setting the Theme of WPF Report Viewer (Using Implicit Styles)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/setting-a-theme-(using-implicit-styles)%})
* [WPF Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/report-viewer-localization%})
