---
title: WPF Report Viewer Takes Themes from the XAML Files
description: "Learn how to refer Themes in ResourceDictionary from XAML files instead of Telerik.ReportViewer.Wpf.Themes.dll in Telerik Reporting WPF Report Viewer."
type: how-to
page_title: Use styles from XAML files in Telerik WPF Report Viewer
slug: wpf-viewer-themes-from-xaml
tags: WPF,report,viewer,XAML,themes
ticketid: 1342969
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product Version</td>
		<td>12.1.18.620+</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewers</td>
		<td>WPF</td>
	</tr>
</table>

## Description

Sometimes it is more convenient to refer the Themes for the WPF Report Viewer from the corresponding XAML files as opposed to `Telerik.ReportViewer.Wpf.Themes.dll` assembly introduced with [Telerik Reporting 12.1.18.620](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2018-sp1-12-1-18-620).

## Solution

Add a folder (e.g. **Themes**) in the WPF Viewer project and copy the XAML files with the Themes there. The themes are distributed with Telerik Reporting and can be found in `{Telerik Reporting installation folder}\Wpf\Themes`, for example `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Wpf\Themes`.

The themes can be referred directly in the `App.xaml` file, or alternatively in the _code behind_.

1. In the `App.xaml` instead of content of the `<ResourceDictionary.MergedDictionaries>` element from step 4 in the [WPF Report Viewer Manual Setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project%}) article use the following (the example uses the _Material_ theme):

   ```XML
   <Application.Resources >
   //....
   <ResourceDictionary>
   	<ResourceDictionary.MergedDictionaries>
   	<ResourceDictionary Source="Themes/Material/System.Windows.xaml" />
   	<ResourceDictionary Source="Themes/Material/Telerik.Windows.Controls.xaml" />
   	<ResourceDictionary Source="Themes/Material/Telerik.Windows.Controls.Input.xaml" />
   	<ResourceDictionary Source="Themes/Material/Telerik.Windows.Controls.Navigation.xaml" />
   	<ResourceDictionary Source="Themes/Material/Telerik.ReportViewer.Wpf.xaml" />
   	</ResourceDictionary.MergedDictionaries>

   	// YOU MAY ADD OTHER STYLES IN THE <ResourceDictionary> TAG :
   	//....
   </ResourceDictionary>
   //....
   </Application.Resources>
   ```

1. In the code behind use the following code that first clears the already merged dictionaries (if any), and then adds the new ones:

   ```C#
   public partial class ReportViewerWindow1 : Window
   {
   static readonly string[] dictionaries = new[]
   		{
   			"Themes/{0}/System.Windows.xaml",
   			"Themes/{0}/Telerik.Windows.Controls.xaml",
   			"Themes/{0}/Telerik.Windows.Controls.Input.xaml",
   			"Themes/{0}/Telerik.Windows.Controls.Navigation.xaml",
   			"Themes/{0}/Telerik.ReportViewer.Wpf.xaml"
   		};

   	public ReportViewerWindow1()
   	{
   		InitializeComponent();
   		MergeResourceDictionaries("Material"); // Set the required theme name here
   	}

   	static void MergeResourceDictionaries(string theme)
   	{
   		var mergedDictionaries = Application.Current.Resources.MergedDictionaries;
   		mergedDictionaries.Clear();
   		foreach (var dictionary in dictionaries)
   		{
   			var uri = string.Format(dictionary, theme);
   			mergedDictionaries.Add(new ResourceDictionary()
   			{
   				Source = new Uri(uri, UriKind.RelativeOrAbsolute)
   			});
   		}
   	}
   }
   ```
