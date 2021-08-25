---
title: Failed to setup service when adding Report Viewer control on the page.
description: Attempting to add a Report Viewer control on the design surface of a WebForm leads to an error being thrown.
type: troubleshooting
page_title: Trying to add a Report Viewer control in a Web Site projects leads to InvalidCastException error.
slug: error-in-web-site-project-failed-to-setup-service-system-invalidcastexception
position: 
tags: 
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>HTML5 ASP.NET WebForms ReportViewer</td>
		</tr>
        <tr>
			<td>Project Type</td>
			<td>Web Site</td>
		</tr>
	</tbody>
</table>

## Possible Cause

Web Site projects handle assembly references differently, which is the major reason Telerik Reporting not to provide design time support for Web Site projects.

## Error Message

```
Failed to setup service.
System.InvalidCastException: Unable to cast COM object of type 'System.__ComObject' to class type 'Telerik.Reporting.Vs.Common.AssemblyReference'. Instances of types that represent COM components cannot be cast to types that do not represent COM components; however they can be cast to interfaces as long as the underlying COM component supports QueryInterface calls for the IID of the interface.
   at Telerik.Reporting.Vs.Common.DTEReferences.WebSiteReferences.Contains(String assemblyName)
   at Telerik.Reporting.Vs.Common.DTEReferences.WebSiteReferences.Contains(AssemblyName assemblyName)
   at Telerik.ReportViewer.Html5.WebForms.Design.InitialConfigHelper.ConfigureReferences(DTEProject project)
   at Telerik.ReportViewer.Html5.WebForms.Design.InitialConfigHelper.ConfigureFirstTime(IServiceProvider serviceProvider)
```

## Description

Attempting to add a Report Viewer control on the design surface of a WebForm leads to an error being thrown.

For example, attempting to drag the HTML5 ASP.NET WebForms ReportViewer from the VS Toolbox onto a **WebForm.aspx** page in **Design mode**, will result in the described error.

## Solution

The recommended approach is to use reports designed with the [Standalone Report Designer](../standalone-report-designer), or reports from an external assembly referenced by the Web Site project. The Report Viewers have to be configured manually in Web Site projects:

- [HTML5 Report Viewer Manual Setup](../html5-report-viewer-embedding)
- [HTML5 ASP.NET MVC Viewer Manual Setup](../html5-mvc-report-viewer-embedding)
- [HTML5 ASP.NET WebForms Viewer Manual Setup](../html5-webforms-report-viewer-manual-setup)

## Notes

The automatic upgrade feature is not designed to work with Web Site projects as well. Web Site projects must be upgraded manually - [Upgrading Telerik Reporting Projects](../installation-upgrading-newer-version).
