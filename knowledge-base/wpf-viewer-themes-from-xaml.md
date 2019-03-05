---
title: Set up the WPF Report Viewer to take Themes from the XAML files instead of the dedicated assembly
description: Refer Themes in ResourceDictionary from XAML files instead of Telerik.ReportViewer.Wpf.Themes.dll
type: how-to
page_title: Use styles from XAML files in WPF Viewer
slug: wpf-viewer-themes-from-xaml
position: 
tags: 
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
</table>


## Description
Sometimes it is more convenient to refer the Themes for the WPF Report Viewer from the corresponding XAML files as opposed to _Telerik.ReportViewer.Wpf.Themes.dll_ assembly introduced with [Telerik Reporting 12.1.18.620](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2018-sp1-12-1-18-620).

## Solution
Add a folder (e.g. __Themes__) in the WPF Viewer project and copy the XAML files with the Themes there. The themes are distributed with Telerik Reporting and can be found in (_Telerik Reporting installation folder_)\Wpf\Themes (e.g. _C:\Program Files (x86)\Progress\Telerik Reporting R3 2018\Wpf\Themes_).

The themes can be referred directly in the _App.xaml_ file, or alternatively in the _code behind_.

1. In the _App.xaml_ instead of content of the <ResourceDictionary.MergedDictionaries> element from step 4 in the [WPF Report Viewer Manual Setup](../wpf-report-viewer-manual-setup) article use the following (the example uses _Material_ theme) :

``` XML
<Application.Resources >
.....
  <ResourceDictionary>
    <ResourceDictionary.MergedDictionaries>
      <ResourceDictionary Source="Themes/Material/System.Windows.xaml" />
      <ResourceDictionary Source="Themes/Material/Telerik.Windows.Controls.xaml" />
      <ResourceDictionary Source="Themes/Material/Telerik.Windows.Controls.Input.xaml" />
      <ResourceDictionary Source="Themes/Material/Telerik.Windows.Controls.Navigation.xaml" />
      <ResourceDictionary Source="Themes/Material/Telerik.ReportViewer.Wpf.xaml" />
    </ResourceDictionary.MergedDictionaries>
     
    // YOU MAY ADD OTHER STYLES IN THE <ResourceDictionary> TAG :
    .....
  </ResourceDictionary>
.....
</Application.Resources>
```

2. In the code behind use the following code that first clears the already merged dictionaries (if any), and then adds the new ones :
```CSHARP
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

