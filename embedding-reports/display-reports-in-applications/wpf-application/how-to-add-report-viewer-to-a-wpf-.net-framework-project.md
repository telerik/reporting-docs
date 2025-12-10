---
title: Using in .NET Framework
page_title: Using the WPF Report Viewer in .NET Framework
description: "Learn how to start using the WPF Report Viewer in.NET Framework through the Telerik Reporting Visual Studio Item Templates."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-framework-project
tags: how,to,add,report,viewer,to,a,wpf,.net,framework,project
published: True
reportingArea: WPF
position: 1
previous_url: /wpf-report-viewer-embedding-the-viewer
---

# Integrating the WPF Report Viewer in .NET Framework

The quickest way to add a WPF Report Viewer to your WPF project is with the __Telerik Report Viewer Window__ item template. 

## Telerik Report Viewer Window Item Template

The item template is available in the [Add New Item](https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2010/w0572c5b(v=vs.100)) dialog box under the __WPF category__.

This item template will do the following:

* Build the project and check that the project is using a compatible .NET Framework version.
* Open the Add New Report Viewer dialog to choose a report definition for the report viewer.
* Verify that the project has all the required references to Telerik UI for WPF and if a reference is missing it will ask you to add them according to the Telerik Reporting license.
* Verify that the required styles are merged in the project `App.xaml` (`Application.xaml` for VB.NET).
* If missing, add the Telerik Reporting references (`Telerik.Reporting`, `Telerik.ReportViewer.Wpf`, `Telerik.ReportViewer.Wpf.Themes`, `Telerik.Reporting.XpsRendering`). 
* Add a Window with WPF Report Viewer.
* Setup the viewer's [connection]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine%}) depending on selected __engine type__.
* Show a summary log that lists all of the made changes.

If the selected engine is of remote type (`REST Service` or `Report Server`), the item template will:

* Add a reference to `Telerik.Reporting.Services.HttpClient` to the current project.
* Add a reference to `System.Net.Http` and `System.Net.Http.Formatting` via NuGet package to the current project.

If the selected engine is `REST Service`, additionally, it will do the following:

* Create a new web project that will host the REST service.
* Register the provided REST service URL into IIS Express virtual directories list.
* Register all the needed NuGet packages for the REST service.

   >In some cases, the solution must be rebuilt in order to restore the NuGet packages and start the REST service project correctly.

## See Also

* [How to Add  manually report viewer to a WPF .NET Framework project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project%})
* [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})
* [WPF Application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%})
* [Setting a Theme (Using Implicit Styles)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/setting-a-theme-(using-implicit-styles)%})
