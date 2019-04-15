---
title: Run Time Problems. When deploying a project on a server, you  get the error "Could not load file or assembly 'Telerik.ReportViewer.WebForms' or one of its dependencies".
description: When deploying a project with Telerik Reporting on a server, you  get the following error "Could not load file or assembly 'Telerik.ReportViewer.WebForms', Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be or one of its dependencies. The system cannot find the file specified".
page_title: When deploying a project on a server, you  get the error "Could not load file or assembly 'Telerik.ReportViewer.WebForms' or one of its dependencies".
slug: troubleshooting-runtime-when-deploying-a-project-with-telerik-reporting-on-a-server-you-get-error-could-not-load-file-or-assembly-telerik-reportviewer-webforms
position: 
tags: 
ticketid: 
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
When deploying a project with Telerik Reporting on a server, you  get the following error: 

"Could not load file or assembly 'Telerik.ReportViewer.WebForms, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' or one of its dependencies. The system cannot find the file specified"
## Solution
During the installation of Telerik Reporting on a dev machine, the Telerik Reporting assemblies are added to [GAC](https://docs.microsoft.com/en-us/dotnet/framework/app-domains/gac). When deploying a project using Visual Studio's built-in functionality, the assemblies from the _GAC_ are not copied automatically, so you need to make sure the assemblies physically exist in the _bin_ folder of your application. Full details are available in the [Deploying Web Applications](../installation-deploying-on-web-application) help article.
