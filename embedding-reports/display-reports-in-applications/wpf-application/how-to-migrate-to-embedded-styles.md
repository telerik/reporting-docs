---
title: How to Migrate to embedded styles
page_title: How to Migrate to embedded styles 
description: How to Migrate to embedded styles
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-migrate-to-embedded-styles
tags: how,to,migrate,to,embedded,styles
published: True
position: 11
---

# How to Migrate to embedded styles

With Telerik Reporting R2 2018 SP1 we have introduces implicit XAML styles embedded in the new Telerik.ReportViewer.Wpf.Themes assembly. This will further simplify the update process and no manual XAML styles replacement is required. Once the project is migrated to embedded XAML style, the Upgrade Wizard will automatically update the Telerik.ReportViewer.Wpf.Themes assembly. 

Migration to embedded XAML styles is only possible for the default implicit XAML styles, that haven't been previously modified. 

1. Add assembly reference to _Telerik.ReportViewer.Wpf.Themes_. 

1. Update the following XAML styles in the _Application.xaml_ or _App.xaml_ to use the embedded implicit XAML styles: 

	+ *System.Windows.xaml* 
	
	+ *Telerik.Windows.Controls.xaml* 
	
	+ *Telerik.Windows.Controls.Input.xaml* 
	
	+ *Telerik.Windows.Controls.Navigation.xaml* 

	+ *Telerik.ReportViewer.Wpf.xaml* 
   
	The Application Resources should look as shown in the following snippet:

	{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\App.xaml}}


1. Delete the above XAML files from the project.
