---
title: How to Migrate to embedded styles
page_title: How to Migrate to embedded styles | for Telerik Reporting Documentation
description: How to Migrate to embedded styles
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-migrate-to-embedded-styles
tags: how,to,migrate,to,embedded,styles
published: True
position: 11
---

# How to Migrate to embedded styles



With Telerik Reporting R2 2018 SP1 we have introduces implicit XAML styles embedded in         the new Telerik.ReportViewer.Wpf.Themes assembly.         This will further simplify the update process and no manual XAML styles replacement is required.         Once the project is migrated to embedded XAML style, the Upgrade Wizard will         automatically update the Telerik.ReportViewer.Wpf.Themes assembly.       

Migration to embedded XAML styles is only possible for the default implicit XAML styles, that haven't been previously modified.       


1. Add assembly reference to Telerik.ReportViewer.Wpf.Themes.               

1. Update the following XAML styles in the Application.xaml or App.xaml to use the embedded implicit XAML styles:               
   + *System.Windows.xaml* 

   + *Telerik.Windows.Controls.xaml* 

   + *Telerik.Windows.Controls.Input.xaml* 

   + *Telerik.Windows.Controls.Navigation.xaml* 

   + *Telerik.ReportViewer.Wpf.xaml* 
    The Application Resources should look as shown in the following snippet:

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\App.xaml}}
````XML
<Application x:Class="WpfApplication1.App"
         xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
         xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
         StartupUri="MainWindow.xaml">
    <Application.Resources>
        <ResourceDictionary>
            <ResourceDictionary.MergedDictionaries>
                <ResourceDictionary Source="/Telerik.ReportViewer.Wpf.Themes;component/Themes/Fluent/System.Windows.xaml" />
                <ResourceDictionary Source="/Telerik.ReportViewer.Wpf.Themes;component/Themes/Fluent/Telerik.Windows.Controls.xaml" />
                <ResourceDictionary Source="/Telerik.ReportViewer.Wpf.Themes;component/Themes/Fluent/Telerik.Windows.Controls.Input.xaml" />
                <ResourceDictionary Source="/Telerik.ReportViewer.Wpf.Themes;component/Themes/Fluent/Telerik.Windows.Controls.Navigation.xaml" />
                <ResourceDictionary Source="/Telerik.ReportViewer.Wpf.Themes;component/Themes/Fluent/Telerik.ReportViewer.Wpf.xaml" />
            </ResourceDictionary.MergedDictionaries>
        </ResourceDictionary>
    </Application.Resources>
</Application>
````

1. Delete the above XAML files from the project.

