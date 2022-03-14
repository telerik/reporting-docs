---
title: Actions Are Not Working on Preview
page_title: Unable to Use Interactive Actions When Previewing the Report
description: "Learn how to handle the scenario when some or all report item actions do not work on previewing the Telerik report."
type: how-to
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

The [Actions]({% slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/overview %}) of the report items are not working on previewing the report both in a report viewer and in a report designer.

## Solution  

Depending on the exact scenario, use any of the following approaches to solve this issue:

- **Actions not working in Visual Studio - HTML Preview**  

    The Report Designer integrated in Visual Studio provides the **HTML Preview** option. Visual Studio uses Internet Explorer 7 as a browser where the Reporting engine applies [HTML5 standards]({% slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/html-rendering-design-considerations %}) to produce an HTML document from the report definition. As a result, actions may not work and the layout of the report may appear different from that in HTML5-compliant browsers.  

    To solve this issue, use a web application with the [HTML5 Viewer]({% slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview %}) to preview the result.

- **Actions not working in the Print preview of the report**  

    The [Print preview mode]({% slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout %}) of a report viewer displays the report the way it will look in a [physical format]({% slug telerikreporting/designing-reports/rendering-and-paging/understanding-rendering-behaviors %}#general-behaviors-for-physical-page-renderers) like PDF. In such formats, actions like `ToggleVisibilityAction` are not active.  

    To solve this issue, switch to the Interactive preview mode. Depending on the media and the selected rendering format, [actions may be supported]({% slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/overview %}).

- **The drill-through report action ([`NavigateToReportAction`]({% slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action %}) is not working in preview in the HTML5 Viewer**

    Navigation between reports can be disabled if the target report is specified through the `InstanceReportSource|XmlReportSource` ('Object instance'|'XML markup' in the [Load Report Dialog]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/load-report-dialog %}) on configuring the `NavigateToReportAction`. The `ReportSource` is handled internally by the Reporting REST service resolver, which is not designed to handle a custom report instance as the target report of an action.  

    It is unnecessary to use the `InstanceReportSource|XmlReportSource` for reports designed by Report Designers without further customization. Use a `TypeReportSource` or `UriReportSource` ('Type name' or 'URL or file') will assure the proper processing and rendering of the action.   

    To handle a custom case where a report instance has to be used, specify the target report by using a `TypeReportsource|UriReportSource` with a string. The string will be sent to the service Report `Resolver`. Then, plug a [custom resolver]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver %}) to handle the case in code.

- **The drill-down report action ([`TogglevisibilityAction`]({% slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drilldown-report-action %}) does not toggle the visibility of all required items/sections**  

    By configuring the `ToggleVisibilityAction`, you can set a list of targets which includes sub groups, items, and sections. Beside setting the targets, you need to set the `Visible` properties of the targets depending on [whether you want them to be initially shown or hidden]({% slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-drilldown-toggle-visibility-action %}).
