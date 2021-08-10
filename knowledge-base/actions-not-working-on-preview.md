---
title: Actions not working on Preview
description: Some or all report item actions may not work on previewing the report. A couple of scenario under which this could occur are explained in this article.
type: how-to
page_title: Unable to use interactive actions when previewing the report
slug: actions-not-working-on-preview
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
			<td>Application Type</td>
			<td>Web Application</td>
		</tr>
		<tr>
			<td>Report Designers</td>
			<td>Visual Studio/Standalone Report Designer </td>
		</tr>
	</tbody>
</table>

## Description

In this article, we will discuss a couple of scenarios where report items' [Actions](../designing-reports-interactivity-actions) are not working on previewing the report both in a report viewer and in a report designer.
  
  
## Solution  
  
- **Actions not working in Visual Studio - HTML Preview.**  

    In the Report Designer, integrated in **Visual Studio**, you can find an option for HTML Preview. The browser used by Visual Studio is **Internet Explorer 7**, where the Reporting engine applies [HTML5 standards](../designing-reports-considerations-html) to produce an HTML document from the report definition. As a result actions may not work and the report's layout may appear differently than in HTML5-compliant browsers.  

    You can use a web application with the [HTML5 Viewer](../html5-report-viewer) to preview the result.

- **Actions not working in Print preview of the report.**  

    The [Print preview mode](../report-viewers-interactive-print-view) of a report viewer displays the report the way it will look in a [physical format](../designing-reports-page-layout-rendering-understanding-rendering-behaviors#general-behaviors-for-physical-page-renderers) like PDF. In such formats, actions like *ToggleVisibilityAction* are **not** active.  

    You can switch to *Interactive preview* mode to have actions working. Depending on the media and the selected rendering format, actions may be supported - [Design Considerations for Report Rendering](../designing-reports-considerations-overview).

- **Drillthrough Report Action ([NavigateToReportAction](../designing-reports-interactivity-drill-through-report-links)) is not working in preview in the HTML5 Viewer**.  

    Navigation between reports can be disabled if the target report is specified via *InstanceReportSource|XmlReportSource* ('Object instance'|'XML markup' in the [Load Report Dialog](../ui-choose-reportsource)) on configuring the *NavigateToReportAction*. The **ReportSource** is handled internally by the Reporting REST service's resolver, which is not designed to handle a custom report instance as an action's target report.  

    The usage of an *InstanceReportSource|XmlReportSource* is unnecessary for reports designed by Report Designers without further customization. Using a **TypeReportSource** or **UriReportSource** ('Type name' or 'URL or file') will assure the proper processing and rendering of the action.   

    If you need to handle a custom case where a report instance has to be used, specify via string the target report by using a *TypeReportsource|UriReportSource*. The string will be sent to the service's Report *Resolver*. Then you can plug a [custom resolver](../telerik-reporting-rest-custom-report-resolver) to handle the case in code.

- **Drilldown Report Action ([TogglevisibilityAction](../designing-reports-interactivity-drill-down)) does not toggle the visibility of all required items/sections.**  

    On configuring the *ToggleVisibilityAction*, you can set a list of targets which includes *sub groups*, items and sections. Beside setting the targets, you need to set the targets' **Visible** properties depending on if you want them to be *shown* or *hidden* initially - [How to: Add a Drilldown Action](../designing-reports-interactivity-how-to-add-drilldown-action).

