---
title: How to Add report viewer to a Windows Forms' .NET Framework project
page_title: How to Add report viewer to a Windows Forms' .NET Framework project 
description: How to Add report viewer to a Windows Forms' .NET Framework project
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-report-viewer-to-a-windows-forms'-.net-framework-project
tags: how,to,add,report,viewer,to,a,windows,forms',.net,framework,project
published: True
position: 1
---

# How to Add report viewer to a Windows Forms' .NET Framework project

The quickest way to add a Windows Form Report Viewer to your Windows Form project is with the __Telerik Report Viewer Form__ item template. 

## Telerik Report Viewer Form Item Template

The item template is available in the [Add New Item](https://msdn.microsoft.com/en-us/library/w0572c5b%28v=vs.100%29.aspx) dialog box under the __Windows Form category__. 

This item template will do the following: 

* Build the project and check that the project is using a compatible .NET version.

* Open the Add New Report Viewer dialog to choose a report definition for the report viewer.

* If missing add the required Telerik Reporting references: 

	* Telerik.Reporting
	
	* Telerik.ReportViewer.WinForms 

* Add a Form with Windows Form Report Viewer.

* Setup the viewer's [connection]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine%}) depending on selected __engine type__.

* Show a summary log that list all of the made changes.

If the selected engine is of remote type (__REST Service__ or __Report Server__), the item template will: 

* Add a reference to *Telerik.Reporting.Services.HttpClient* to the current project. 

* Add a reference to *System.Net.Http* and *System.Net.Http.Formatting* via NuGet package to the current project. 

If the selected engine is __REST Service__ additionally it will do the following: 

* Create a new web project that will host the REST service. 

* Register the provided REST service URL into IIS Express virtual directories list. 

* Register all the needed NuGet packages for the REST service. 

	>In some cases the solution must be rebuilt in order to restore the NuGet packages and start the REST service project correctly. 
   

If the current application has to be declared as DPI-aware, an additional element needs to be added to the application manifest file, as explained in [Declaring the application as DPI-aware]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}#declaring-the-application-as-dpi-aware). 

# See Also

* [How to: Add New Project Items](https://msdn.microsoft.com/en-us/library/w0572c5b%28v=vs.100%29.aspx)

* [How to Add manually report viewer to a Windows Forms'.NET Framework project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-manually-report-viewer-to-a-windows-forms'-.net-framework-project%})[](66CD7D60-7708-42D5-8BB4-506676E8679E)

* [Windows Forms Application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})

* [Quickstart Overview]({%slug telerikreporting/quickstart/overview%})

* [Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/report-viewer-localization%})
