---
title: Deploying Web ReportViewer in SharePoint
page_title: Deploying Web ReportViewer in SharePoint | for Telerik Reporting Documentation
description: Deploying Web ReportViewer in SharePoint
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/deploying-web-reportviewer-in-sharepoint
tags: deploying,web,reportviewer,in,sharepoint
published: True
position: 4
---

# Deploying Web ReportViewer in SharePoint



>note This is a legacy report viewer and for new projects our recommendation is to use the latest web forms report viewer -           [HTML5 Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})


## 

This topic outlines the required steps that need to be taken to deploy the web ReportViewer prior        	to implementing it within an existing MOSS web site.

1. First you need to install __Telerik.Reporting.dll__  and __Telerik.ReportViewer.WebForms.dll__  in the __GAC (Global Assembly Cache__  ) of your SharePoint server. For more information please refer to [How to: Install an Assembly into the Global Assembly Cache](http://msdn.microsoft.com/en-us/library/dkkx7f79.aspx) 

1. Next you should tell SharePoint that the Reporting assemblies are safe to use. To do so you should
				add a few __```<SafeControl>```__  entries within the __```<SafeControls>```__  section of your web.config:

	
      ````xml
					<SafeControl Assembly="Telerik.Reporting, Version=x.x.x.xxxx, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.Reporting" TypeName="*" Safe="True" />
					<SafeControl Assembly="Telerik.ReportViewer.WebForms, Version=x.x.x.xxxx, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.ReportViewer" TypeName="*" Safe="True" />
````



1. In order for the report viewer to function properly, you need to register its handler in the __```<system.web>```\```<httpHandlers>```__  section in the web.config:

	
      ````XML
					<add path="Telerik.ReportViewer.axd" type="Telerik.ReportViewer.WebForms.HttpHandler, Telerik.ReportViewer.WebForms, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" verb="*" validate="true" />
````

When the application is hosted on IIS 7+, the handler of the report viewer should be registered in the 				__```<system.webServer>```\```<handlers>```__  section as well: 				

	
    ````XML
                 <add name="Telerik.ReportViewer.axd_*" path="Telerik.ReportViewer.axd" verb="*" type="Telerik.ReportViewer.WebForms.HttpHandler, Telerik.ReportViewer.WebForms, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" preCondition="integratedMode" />
````



1. Open the page where you want to add the ReportViewer control (e.g. e.g. default.master) and if prompted to check out the file select “Yes”. Now you need to register the Telerik.ReportViewer.WebForms assembly in the master page. Do so by adding the following directive:

	
      ````XML
				<%@ Register TagPrefix="telerik" Namespace="Telerik.ReportViewer.WebForms"
						Assembly="Telerik.ReportViewer.WebForms, Version=x.x.x.xxxx, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" %>
````



   >note Note that the version of an assembly is specified in each  __```<SafeControl>```__  tag. Make sure that you input the correct version you use before proceeding.

   >note The ReportViewer uses the session state to preserve the report instance assigned to its Report property during page postbacks and for some other design reasons as well. Thus have in mind that you should enable session state on your SharePoint server.

# See Also


 * [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%})

 * [How to Add report viewer to a web page]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/how-to-add-report-viewer-to-a-web-page%})

 * [Medium Trust Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/medium-trust-support%})

 * [AJAX support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/ajax-support%})
