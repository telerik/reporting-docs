---
title: How to Add report viewer to a Windows Forms' .NET Framework project
page_title: How to Add report viewer to a Windows Forms' .NET Framework project | for Telerik Reporting Documentation
description: How to Add report viewer to a Windows Forms' .NET Framework project
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-report-viewer-to-a-windows-forms'-.net-framework-project
tags: how,to,add,report,viewer,to,a,windows,forms',.net,framework,project
published: True
position: 1
---

# How to Add report viewer to a Windows Forms' .NET Framework project



The quickest way to add a Windows Form Report Viewer to your Windows Form project is with the __Telerik Report Viewer Form__  item template.       

## Telerik Report Viewer Form Item Template

The item template is available in the            [Add New Item](https://msdn.microsoft.com/en-us/library/w0572c5b%28v=vs.100%29.aspx)            dialog box under the __Windows Form category__ .         

This item template will do the following:         

If the selected engine is of remote type (__REST Service__  or __Report Server__ ), the item template will:         

* Add a reference to *Telerik.Reporting.Services.HttpClient*  to the current project.             

* Add a reference to *System.Net.Http*  and *System.Net.Http.Formatting*  via NuGet package to the current project.             

If the selected engine is __REST Service__  additionally it will do the following:         

* Create a new web project that will host the REST service.             

* Register the provided REST service URL into IIS Express virtual directories list.             

* Register all the needed NuGet packages for the REST service.             

* 

   >note In some cases the solution must be rebuilt in order to invalidate the NuGet packages and start the REST service project correctly.               

If the current application has to be declared as DPI-aware, an additional element needs to be added to the application manifest file, as explained           [here](F25EB909-7941-4B78-B24C-4025257A26C4#dpiAware).         

# See Also


# See Also

 * [How to: Add New Project Items](https://msdn.microsoft.com/en-us/library/w0572c5b%28v=vs.100%29.aspx)

 * [How to Add manually report viewer to a Windows Forms' .NET Framework project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-manually-report-viewer-to-a-windows-forms'-.net-framework-project%})[](66CD7D60-7708-42D5-8BB4-506676E8679E)

 * [Windows Forms Application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})

 * [Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/report-viewer-localization%})
