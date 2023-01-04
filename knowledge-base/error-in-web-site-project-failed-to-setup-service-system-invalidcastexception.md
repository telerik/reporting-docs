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

## Description

Attempting to add a Report Viewer control on the design surface of a WebForm leads to an error being thrown.

For example, attempting to drag the HTML5 ASP.NET WebForms ReportViewer from the VS Toolbox onto a **WebForm.aspx** page in **Design mode**, will result in the described error.

## Error Message

```
Failed to setup service.
System.InvalidCastException: Unable to cast COM object of type 'System.__ComObject' to class type 'Telerik.Reporting.Vs.Common.AssemblyReference'. Instances of types that represent COM components cannot be cast to types that do not represent COM components; however they can be cast to interfaces as long as the underlying COM component supports QueryInterface calls for the IID of the interface.
   at Telerik.Reporting.Vs.Common.DTEReferences.WebSiteReferences.Contains(String assemblyName)
   at Telerik.Reporting.Vs.Common.DTEReferences.WebSiteReferences.Contains(AssemblyName assemblyName)
   at Telerik.ReportViewer.Html5.WebForms.Design.InitialConfigHelper.ConfigureReferences(DTEProject project)
   at Telerik.ReportViewer.Html5.WebForms.Design.InitialConfigHelper.ConfigureFirstTime(IServiceProvider serviceProvider)
```

## Possible Cause

Web Site projects handle assembly references differently, which is the major reason Telerik Reporting not to provide design time support for Web Site projects.

## Solution

The recommended approach is to use reports designed with the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}), or reports from an external assembly referenced by the Web Site project. The Report Viewers have to be configured manually in Web Site projects:

- [HTML5 Report Viewer Manual Setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/manual-setup%})
- [HTML5 ASP.NET MVC Viewer Manual Setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/manual-setup%})
- [HTML5 ASP.NET WebForms Viewer Manual Setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/manual-setup%})

## Notes

The automatic upgrade feature is not designed to work with Web Site projects as well. 

Web Site projects must be upgraded manually - [Upgrading Telerik Reporting Projects]({%slug telerikreporting/upgrade/overview%}).
