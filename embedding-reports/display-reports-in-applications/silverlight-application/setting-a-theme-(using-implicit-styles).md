---
title: Setting a Theme (Using Implicit Styles)
page_title: Setting a Theme (Using Implicit Styles) 
description: Setting a Theme (Using Implicit Styles)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/setting-a-theme-(using-implicit-styles)
tags: setting,a,theme,(using,implicit,styles)
published: True
position: 2
previous_url: /silverlight-report-viewer-implicit-styles
reportingArea: General
---

# Setting a Theme (Using Implicit Styles)

> The Silverlight Report Viewer and its WCF Reporting Service are no longer supported and deployed with the installation of Telerik Reporting. The last release of Telerik Reporting with included Silverlight Report Viewer is [R1 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2023-17-0-23-118).

With the official Q1 2014 release of Telerik Reporting you will have to disable the Telerik StyleManager and to style the controls using implicit styles (e.g. Style without x:Key attribute). There are a number of benefits of using implicit styles over the Telerik StyleManager. Some are listed below: 

* Custom themes are now much easier  - created only via merged dictionaries

* Basing styles on a theme is made simple

* Improved Blend support

You will find the XAML files with the implicit styles in {Telerik Reporting installation path}/Silverlight/__Themes__/_{Theme Name}_.

This article explains details on using implicit styles with the Silverlight Report Viewer and covers the following topics: 

* [Applying Report Viewer theme globally in your application](#applying-report-viewer-theme-globally-in-your-application)

* [Basing styles on Report Viewer style](#basing-styles-on-an-existing-report-viewer-theme)

* [Setting Implicit Style for the Silverlight Report Viewer Example](#setting-implicit-style-for-the-silverlight-report-viewer-example)

## Applying Report Viewer theme globally in your application

The newly included Themes folder lists resource dictionaries by theme name. These resource dictionaries contain implicit styles and relevant needed resources. They can be merged in the resources of your application (in App.xaml) and as a result will be applied implicitly on any Report Viewer that does not have a __local__ Style set. 

For the Silverlight Report Viewer you need to add these xaml files for the selected theme: 

* System.Windows.xaml

* Telerik.Windows.Controls.xaml

* Telerik.Windows.Controls.Input.xaml

* Telerik.Windows.Controls.Navigation.xaml

Additionally the xaml file with the corresponding Report Viewer theme has to be added too: 

* Telerik.ReportViewer.Silverlight.xaml

>You should not set Application Theme using the StyleManager when using implicit styles. 

## Basing styles on an existing Report Viewer theme

Currently to change an existing Report Viewer theme you can simply copy the original theme and edit the copy. All the styles that are part of the Report Viewer can be found in the respective xaml file. If you need to edit existing Silverlight UI Controls please check the respective article for more information: [Telerik UI for Silverlight - Setting a Theme (Using Implicit Styles)](http://www.telerik.com/help/silverlight/styling-apperance-implicit-styles-overview.html) 

## Setting Implicit Style for the Silverlight Report Viewer Example

We will apply implicit styles for the Vista theme in our example project. 

* First add references to the required assemblies (Telerik UI for Silverlight) from Binaries.NoXaml folder.

* Then add references to the required assemblies for Telerik Reporting - __Telerik.Reporting__ and __Telerik.ReportViewer.Silverlight__.

* Create a Themes folder in your project and copy the corresponding XAML files (Telerik UI for Silverlight) from __Themes.Implicit/../Vista/../Themes/__ folder.

* In the Themes folder of the project add the respective Report Viewer theme (in our case Vista) from __Silverlight/Themes__ folder.

* The next step is to merge these ResourceDictionaries in the App.xaml file: 
    
	````XML
<Application x:Class="SilverlightApplication1.App"
			xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
			xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
			>
	 <Application.Resources>
	   <ResourceDictionary>
		 <ResourceDictionary.MergedDictionaries>
		   <ResourceDictionary Source="/SilverlightApplication1;component/Themes/System.Windows.xaml"/>
		   <ResourceDictionary Source="/SilverlightApplication1;component/Themes/Telerik.Windows.Controls.xaml"/>
		   <ResourceDictionary Source="/SilverlightApplication1;component/Themes/Telerik.Windows.Controls.Input.xaml"/>
		   <ResourceDictionary Source="/SilverlightApplication1;component/Themes/Telerik.Windows.Controls.Navigation.xaml"/>
		   <ResourceDictionary Source="/SilverlightApplication1;component/Themes/Telerik.ReportViewer.Silverlight.xaml"/>
		 </ResourceDictionary.MergedDictionaries>
	   </ResourceDictionary>
	 </Application.Resources>
	</Application>
````

