---
title: Setting the Theme (Implicit Styles)
page_title: Setting the Theme of WPF Report Viewer (Using Implicit Styles)
description: "Learn how to set the theme of the WPF Report Viewer using implicit styling and how to edit an existing theme in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/setting-a-theme-(using-implicit-styles)
tags: setting,theme,implicit,styles
published: True
reportingArea: WPF
position: 2
previous_url: /wpf-report-viewer-implicit-styles, /embedding-reports/display-reports-in-applications/wpf-application/setting-a-theme-(using-implicit-styles)
---

# Setting a Theme (Using Implicit Styles)

With the official Q1 2014 release of Telerik Reporting, you will have to disable the [Telerik StyleManager](https://docs.telerik.com/devtools/wpf/styling-and-appearance/stylemanager/common-styling-apperance-setting-theme-wpf) and style the controls using implicit styles (e.g., Style without `x:Key` attribute). There are a number of benefits of using implicit styles over the __Telerik StyleManager__. Some are listed below:

* Creating custom themes is now much easier via merged dictionaries
* Basing styles on a theme is made simple
* Improved Blend support

>note The XAML files with the implicit styles can be found in `%programfiles(x86)%\Progress\Telerik Reporting {{site.suiteversion}}\Wpf\Themes\{Theme Name}`.

The available themes are listed in the Telerik UI for WPF article [Themes Suite](https://docs.telerik.com/devtools/wpf/styling-and-appearance/themes-suite/available-themes).

This article explains details on using implicit styles with the WPF Report Viewer and covers the following topics:

* [Applying Report Viewer theme globally in your application](#applying-report-viewer-theme-globally-in-your-application)
* [Basing styles on Report Viewer style](#basing-styles-on-an-existing-report-viewer-theme)
* [Setting Implicit Style for the WPF Report Viewer Example](#setting-embedded-implicit-style-for-the-wpf-report-viewer-example)

## Applying Report Viewer theme globally in your application

The newly included Themes folder lists resource dictionaries by theme name. These resource dictionaries contain implicit styles and the relevant resources. They can be merged in the resources of your application (in `App.xaml`) and, as a result, will be applied implicitly on any Report Viewer that does not have a __local__ Style set.

For the WPF Report Viewer, you need to add these xaml files for the selected theme:

* `System.Windows.xaml`
* `Telerik.Windows.Controls.xaml`
* `Telerik.Windows.Controls.Input.xaml`
* `Telerik.Windows.Controls.Navigation.xaml`
* `Telerik.Windows.Controls.ConversationalUI.xaml`

Additionally, the XAML file with the corresponding Report Viewer theme has to be added too:

* `Telerik.ReportViewer.Wpf.xaml`

> Do not set Application Theme using the StyleManager when using implicit styles.

## Basing styles on an existing Report Viewer theme

Currently, to change an existing Report Viewer theme, you can simply copy the original theme and edit the copy. All the styles that are part of the Report Viewer can be found in the respective XAML file. If you need to edit existing WPF UI Controls, please check the respective article for more information: [Telerik UI for WPF - Setting a Theme (Using Implicit Styles)](https://docs.telerik.com/devtools/wpf/styling-and-appearance/styling-apperance-setting-a-theme-overview)

## Setting Embedded Implicit Style for the WPF Report Viewer Example

We will apply embedded implicit styles for the Fluent theme in our example project. The embedded implicit styles are upgradable with the [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}).

* Replace the referenced Telerik UI for WPF assemblies with assemblies from the `Binaries.NoXaml` folder.

	If the Telerik UI for WPF assemblies are only used for the report viewer, use the Telerik UI for WPF assemblies available with the local demos. They are internally unlocked for the WPF Report Viewer, but can only be used with the report viewer. The .NET Framework assemblies containing *Telerik UI for WPF* are located in `%programfiles(x86)%\Progress\Telerik Reporting {{site.suiteversion}}\Bin\WpfViewerDependencies\Framework`.

* Add reference to the Telerik.ReportViewer.Wpf.Themes assembly.
* The next step is to merge these `ResourceDictionaries` in the `App.xaml` file:

	{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\App.xaml}}


## Setting Customizable Implicit Style for the WPF Report Viewer Example

We will apply implicit styles for the `Vista` theme in our example project. Having the XAML style files in your project enables WPF Report Viewer style customizations.

* Replace the referenced Telerik UI for WPF assemblies with assemblies from the `Binaries.NoXaml` folder.

	If the Telerik UI for WPF assemblies are only used for the report viewer, use the Telerik UI for WPF assemblies available with the local demos. They are internally unlocked for the WPF Report Viewer, but can only be used with the report viewer. The Telerik UI for WPF assemblies are located in `%programfiles(x86)%\Progress\Telerik Reporting {{site.suiteversion}}\Bin\WpfViewerDependencies\Framework`.

* Create a Themes folder in your project and copy the corresponding XAML files (Telerik UI for WPF) from `Themes.Implicit/../Vista/../Themes/` folder.
* In the Themes folder of the project, add the respective Report Viewer theme (in our case Vista) from the `WPF/Themes` folder.
* The next step is to merge these [`ResourceDictionaries`](https://learn.microsoft.com/en-us/dotnet/api/system.windows.resourcedictionary?view=windowsdesktop-7.0) in the `App.xaml` file:

	````XAML
<Application x:Class="WpfApplication1.App"
			xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
			xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
			StartupUri="MainWindow.xaml">
	 <Application.Resources>
	   <ResourceDictionary>
		 <ResourceDictionary.MergedDictionaries>
		   <ResourceDictionary Source="/Themes/System.Windows.xaml"/>
		   <ResourceDictionary Source="/Themes/Telerik.Windows.Controls.xaml"/>
		   <ResourceDictionary Source="/Themes/Telerik.Windows.Controls.Input.xaml"/>
		   <ResourceDictionary Source="/Themes/Telerik.Windows.Controls.Navigation.xaml"/>
		   <ResourceDictionary Source="/Themes/Telerik.Windows.Controls.ConversationalUI.xaml"/>
		   <ResourceDictionary Source="/Themes/Telerik.ReportViewer.Wpf.xaml"/>
		 </ResourceDictionary.MergedDictionaries>
	   </ResourceDictionary>
	 </Application.Resources>
	</Application>
````

