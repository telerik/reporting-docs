---
title: Localization
page_title: Localizing the Windows Forms Report Viewer
description: "Find out more about how the Windows Forms Report Viewer localization works and understand how to implement it. See useful advice about resource naming conventions and hierarchy."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/report-viewer-localization
tags: windows, forms, report, viewer, localization
published: True
reporting_area: WinForms
position: 4
previous_url: /report-viewer-localization
---

# Report Viewer Localization

In the Windows Report Viewer, localized resources are stored in separate __RESX__ resource files and loaded according to the current UI culture settings. To understand how localized resources are loaded, it is useful to think of them as being organized in a hierarchical manner.

## Types of Resources in the Hierarchy

* At the top of the hierarchy sit the fallback resources for the default UI culture, which is English ("en") by default. These are the only resources that do not have their own file. They are stored directly in the assembly of the __Report Viewer__.
* Below the fallback resources are the resources for any neutral cultures. A neutral culture is associated with a language but not a region. For example, French ("fr") is a neutral culture. Note that the fallback resources are also for a neutral culture, but a special one.
* Below those are the resources for any specific cultures. A specific culture is associated with a language and a region. For example, French Canadian ("fr-CA") is a specific culture.

When the __Report Viewer__ tries to load any localized resource and does not find it it will travel up the hierarchy until it finds a resource file containing the requested resource.

The best way to store your resources is to generalize them as much as possible. That means to store localized strings in resource files for neutral cultures rather than specific cultures whenever possible. For instance, if you have resources for the French Belgian ("fr-BE") culture and the resources immediately above are the fallback resources in English, a problem may result when someone uses your application on a system configured for the French Canadian culture. The __Report Viewer__ will look for a __RESX__  file named "fr-CA", it will not find it and will load the fallback resource, which is English, instead of loading the French resources. The following picture shows this undesirable scenario.

![Image showing an undesireable localization resources hierarchy.](images/localization1.png)

If you follow the recommended practice of placing as many resources as possible in a neutral resource file for the "fr" culture, the French Canadian user would not see resources marked for the "fr-BE" culture, but he or she would still see strings in French. The following situation demonstrates this preferred scenario.

![Image showing a more optimal localization resources hierarchy.](images/localization2.png)

## Naming Conventions for the Localization Resources

__The Report Viewer__ uses the following naming convention when searching for localized __RESX__ resource files in the main application folder:

* The names of the __RESX__ localization resource files should have the following format: _Telerik.ReportViewer.WinForms.Resources.[culture].resx_, where __[culture]__ is the name of the culture for the specified localization resource. For example, to provide a localization resource for the French Belgian culture, the corresponding resource file should be named as follows: _Telerik.ReportViewer.WinForms.Resources.fr-BE.resx_
* Respectively, to provide a localization resource for the French neutral culture, the corresponding resource file should be named as follows: _Telerik.ReportViewer.WinForms.Resources.fr.resx_
* It is possible to override the default resources for the language neutral culture, which are stored in the assembly of the __Report Viewer__. In that case the resource file should be named as follows: _Telerik.ReportViewer.WinForms.Resources.resx_

As described above, if for example the current UI culture is set to French Belgian, the __Report Viewer__ will search for localized __RESX__ resource files inside the main application folder in the following order:

1. Telerik.ReportViewer.WinForms.Resources.__fr-BE__.resx
1. Telerik.ReportViewer.WinForms.Resources.__fr__.resx
1. Telerik.ReportViewer.WinForms.Resources.resx

	![Image showing how the localization resource fallback mechanism works.](images/localization3.png)

The above diagram illustrates a simple view of the resource fallback for a UI culture set to "fr-BE". The __Report Viewer__ handles the case probing the "fr-BE" __RESX__ resource file for the requested key first, and subsequently falls back to the neutral French culture "fr", ultimately looking in the default assembly resources for a value if a value has still not been found.

## Adding Localization Resources for the Report Viewer

1. Add a new __RESX__ resource file to the main project of the application. Name the newly-created __RESX__ file according to the naming convention described above.
1. In the __Property Inspector__ specify the following properties for the resource file:

	1. __Build Action:__ "*None* "
	1. __Copy to Output Directory:__ "*Copy if newer* " or "*Copy always* "

1. Open the __RESX__ resource file in the __Visual Studio Resource Editor__. Enter the required resource strings to translate the __Report Viewer__ to the desired language.
1. Repeat steps from 1 to 3 for each desired translation of the __Report Viewer__.
1. Compile and run the project. When viewing a __Telerik Report__, the __Report Viewer__ should be translated according to the current UI culture.

## Distributing an Application with a Localized Report Viewer

In order to distribute an application that uses __Telerik Reporting__ with a localized __Report Viewer__, one should distribute all of the required localization __RESX__ resource files, in addition to the main application assemblies. For __Windows Forms Applications__ the __RESX__ files should be placed in the same directory, where the application is installed.

## See Also

* [Windows Forms Application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})
* [How to Add report viewer to a Windows Forms'.NET Framework project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-report-viewer-to-a-windows-forms'-.net-framework-project%})
* [Setting the Culture for Windows Forms Globalization](https://learn.microsoft.com/en-us/dotnet/api/system.globalization.cultureinfo.currentculture?view=net-7.0)
* [Setting the UI Culture for Windows Forms Globalization](https://learn.microsoft.com/en-us/dotnet/api/system.globalization.cultureinfo.currentuiculture?view=net-7.0)
* [Localized Satellite Assemblies](https://learn.microsoft.com/en-us/dotnet/core/extensions/create-satellite-assemblies)
