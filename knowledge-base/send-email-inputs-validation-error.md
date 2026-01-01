---
title: Send Email Inputs Cause Form Validation Error
page_title: Send Email Inputs Validation Error
description: "Learn how to resolve the form validation error caused by hidden 'Send Email' inputs in the HTML5 Report Viewer when the Send Email functionality is disabled."
slug: send-email-inputs-validation-error
tags: telerik, reporting, html5-viewer, send-email, form, validation, inputs, focusable, webforms
published: True
type: troubleshooting
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
			<td>Version</td>
			<td>19.2.25.813</td>
		</tr>
	</tbody>
</table>

## Description

When the HTML5 Report Viewer is rendered inside an HTML form, and a button in that form triggers a form submission, the browser throws a validation error:

````
An invalid form control with name='from' is not focusable. 
An invalid form control with name='to' is not focusable. 
An invalid form control with name='subject' is not focusable.
````

This error occurs even though the "Send Email" functionality is disabled in the viewer configuration.

## Cause

The HTML5-based report viewers include input fields for the "Send Email" dialog in its HTML output by default, regardless of whether the "Send Email" functionality is enabled or disabled. When these hidden input fields are part of a form submission, the browser's form validation logic identifies them as invalid form controls that cannot receive focus, which causes the validation error.

## Solution

A potential solution is to place the viewer outside of the form element if your application structure allows it. However, if this is not feasible, the workaround is to use a custom HTML template that excludes the "Send Email" input elements from the viewer's HTML output. Follow these steps:

1. Locate the default template: Inspect the Network tab in your browser's developer tools. When the report viewer loads, you will see a request for the default template file (typically named something like `telerikReportViewerTemplate-x.x.x.x.html`).

2. Copy the template locally: Copy the content of the default template response and save it as an HTML file in your project (for example, `custom-report-viewer-template.html`).

3. Remove the Send Email dialog: In your local template file, locate and remove the `div` element with the `trv-send-email-dialog` class. This element contains all the problematic input fields related to the "Send Email" functionality.

4. Configure the viewer to use your custom template: Pass the path to your custom template through the `TemplateUrl` option (or `templateUrl` in camelCase depending on the viewer) when initializing the viewer.

### Examples

* For HTML5 ASP.NET WebForms report viewer

````C#
<telerik:ReportViewer
    ID="reportViewer1"
    ServiceUrl="api/reports"
    Width="1300px"
    Height="900px"
    TemplateUrl="/custom-report-viewer-template.html"
    runat="server">
    <ReportSource IdentifierType="UriReportSource" Identifier="SampleReport.trdp">
    </ReportSource>
</telerik:ReportViewer>
````


* For HTML5 report viewer

````HTML
<div id="reportViewer1"></div>
<script>
    $(document).ready(function() {
        $("#reportViewer1").telerikReportViewer({
            serviceUrl: "/api/reports/",
            reportSource: {
                report: "SampleReport.trdp"
            },
            templateUrl: "/custom-report-viewer-template.html"
        });
    });
</script>
````

By using a custom template without the "Send Email" input elements, the form validation error will no longer occur, and your form submissions will work as expected.

>caution Be aware that this workaround requires maintaining a custom template. When you upgrade to a newer version of Telerik Reporting, you will need to repeat this process if the template structure changes. The Telerik Reporting team is aware of this issue and has planned to release a permanent fix. You can track the progress on the [public feedback item](https://feedback.telerik.com/reporting/1696913-send-email-inputs-are-included-in-the-html-even-if-the-send-email-functionality-is-disabled).

## See Also

- [HTML5 Report Viewer Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web/html5-report-viewer/overview%})
- [Customizing the HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web/html5-report-viewer/customizing/overview%})
- [ASP.NET Web Forms Reporting]({%slug telerikreporting/using-reports-in-applications/embed-reports-in-applications/asp-net-reporting%})