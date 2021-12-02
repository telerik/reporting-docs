---
title: How to Add report viewer to a WPF .NET Framework project
page_title: How to Add report viewer to a WPF .NET Framework project | for Telerik Reporting Documentation
description: How to Add report viewer to a WPF .NET Framework project
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-framework-project
tags: how,to,add,report,viewer,to,a,wpf,.net,framework,project
published: True
position: 1
---

# How to Add report viewer to a WPF .NET Framework project



The quickest way to add a WPF Report Viewer to your WPF project is with the __Telerik Report Viewer Window__  item template.       

## Telerik Report Viewer Window Item Template

The item template is available in the             [Add New Item](https://msdn.microsoft.com/en-us/library/w0572c5b%28v=vs.100%29.aspx)             dialog box under the __WPF category__ .         

This item template will do the following:         

* Build the project and check that the project is using a compatible .NET version.             

* Open the Add New Report Viewer dialog to choose a report definition for the report viewer.             

* Verify that the project is having all the required references to Telerik UI for WPF and if a reference is missing               it will ask you to add them according the Telerik Reporting license.             

* Verify that the required styles are merged in the project App.xaml (Application.xaml for VB.NET).             

* If missing add the Telerik Reporting references                (Telerik.Reporting, Telerik.ReportViewer.Wpf, Telerik.ReportViewer.Wpf.Themes, Telerik.Reporting.XpsRendering).             

* Add a Window with WPF Report Viewer.             

* Setup the viewer's [connection]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine%}) depending on selected __engine type__ .             

* Show a summary log that list all of the made changes.             

If the selected engine is of remote type (__REST Service__  or __Report Server__ ), the item template will:         

* Add a reference to *Telerik.Reporting.Services.HttpClient*  to the current project.             

* Add a reference to *System.Net.Http*  and *System.Net.Http.Formatting*  via NuGet package to the current project.             

If the selected engine is __REST Service__  additionally it will do the following:         

* Create a new web project that will host the REST service.             

* Register the provided REST service URL into IIS Express virtual directories list.             

* Register all the needed NuGet packages for the REST service.             

* 

   >note In some cases the solution must be rebuilt in order to invalidate the NuGet packages and start the REST service project correctly.               
