---
title: The styles of the ASP.NET Report Viewer's toolbar are messed up.
description: Making sure the styles of the ASP.NET Report Viewer are loaded correctly.
type: troubleshooting
page_title: Troubleshooting what causes incorrect styling of the toolbar of the ASP.NET Report Viewer.
slug: the-styles-of-the-web-report-viewer-s-toolbar-are-messed-up
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
		<tbody>
		<tr>
			<td>Report Viewer</td>
			<td>Legacy ASP.NET Report Viewer</td>
		</tr>
	</tbody>
</table>

## Description

The Legacy ASP.NET Report Viewer's styles are messed up on loading the report viewer in the browser.
   
![web viewer toolbar](resources/viewertoolbar.png)  
   
## Possible Cause

 This usually indicates that the ReportViewer control has not been able to load its **stylesheet**.

## Solution 
 
- When the application is hosted on **IIS7**, i.e. the handler should look like the following:

```xml
<system.webServer>   
    <handlers>   
       <add name="Telerik.ReportViewer.axd_*" path="Telerik.ReportViewer.axd" verb="*" type="Telerik.ReportViewer.WebForms.HttpHandler, Telerik.ReportViewer.WebForms, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" preCondition="integratedMode"   />   
    </handlers>   
    <validation validateIntegratedModeConfiguration="false" />     
</system.webServer>   
```
> Substitute **Version=X.X.X.X** with the exact assembly version you are using! 

- Check for **runat="server"** attribute in the web page's head tag;

- Use a web debugging proxy (e.g. [Fiddler Jam](https://jam.getfiddler.com/)) to see what is the response for the **/ReportViewer.axd?name=Resources.ReportViewerInternal.css&version=x.x.x.x&optype=Resource** request or any request of such kind;

- If you have global styles or themes applied on the page - disable them temporary to verify if they are the culprit. If this proves to be the case, make sure that styles/themes do not affect HTML elements directly, but are applied through the **CssClass** property.

