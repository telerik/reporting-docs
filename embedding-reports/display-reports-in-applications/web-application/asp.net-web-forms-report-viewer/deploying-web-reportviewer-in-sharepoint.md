---
title: Deploying on SharePoint
page_title: Deploying the ASP.NET WebFoms ReportViewer on SharePoint
description: "Learn how the ASP.NET WebForms Report Viewer can be deployed on SharePoint by following this tutorial."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/deploying-web-reportviewer-in-sharepoint
tags: deploying,web,reportviewer,in,sharepoint
published: True
position: 4
previous_url: /asp-net-report-viewer-deploying-web-reportViewer-in-MOSS
reportingArea: General
---

# Deploying on SharePoint Overview

> This is a legacy report viewer and for new projects our recommendation is to use the latest WebForms Report Viewer - [HTML5 Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})

This topic outlines the required steps that need to be taken to deploy the web ReportViewer prior to implementing it within an existing `MOSS` web site.

1. First you need to install `Telerik.Reporting.dll` and `Telerik.ReportViewer.WebForms.dll` in the [`GAC (Global Assembly Cache)`](https://learn.microsoft.com/en-us/dotnet/framework/app-domains/gac) of your SharePoint server. For more information please refer to [How to: Install an Assembly into the Global Assembly Cache](https://learn.microsoft.com/en-us/dotnet/framework/app-domains/install-assembly-into-gac)

1. Next you should tell SharePoint that the Reporting assemblies are safe to use. To do so you should
 add a few `<SafeControl>` entries within the `<SafeControls>` section of your `web.config`:
    
	````XML
<SafeControl Assembly="Telerik.Reporting, Version=x.x.x.xxxx, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.Reporting" TypeName="*" Safe="True" />
	<SafeControl Assembly="Telerik.ReportViewer.WebForms, Version=x.x.x.xxxx, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.ReportViewer" TypeName="*" Safe="True" />
````

1. In order for the report viewer to function properly, you need to register its handler in the `<system.web>`/`<httpHandlers>` section in the `web.config`:
    
	````XML
<add path="Telerik.ReportViewer.axd" type="Telerik.ReportViewer.WebForms.HttpHandler, Telerik.ReportViewer.WebForms, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" verb="*" validate="true" />
````

When the application is hosted on IIS 7+, the handler of the report viewer should be registered in the `<system.webServer>`/`<handlers>` section as well:
    
	````XML
<add name="Telerik.ReportViewer.axd_*" path="Telerik.ReportViewer.axd" verb="*" type="Telerik.ReportViewer.WebForms.HttpHandler, Telerik.ReportViewer.WebForms, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" preCondition="integratedMode" />
````

1. Open the page where you want to add the ReportViewer control (e.g. e.g. `default.master`) and if prompted to check out the file select “Yes”. Now you need to register the `Telerik.ReportViewer.WebForms` assembly in the master page. Do so by adding the following directive:
    
	````XML
<%@ Register TagPrefix="telerik" Namespace="Telerik.ReportViewer.WebForms"
        Assembly="Telerik.ReportViewer.WebForms, Version=x.x.x.xxxx, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" %>
````

   >note The version of an assembly is specified in each `<SafeControl>` tag. Make sure that you input the correct version you use before proceeding.

   >The ReportViewer uses the session state to preserve the report instance assigned to its Report property during page postbacks and for some other design reasons as well. Thus have in mind that you should enable session state on your SharePoint server.

## See Also

* [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%})

* [How to Add report viewer to a web page]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/how-to-add-report-viewer-to-a-web-page%})

* [Medium Trust Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/medium-trust-support%})

* [AJAX support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/ajax-support%})
