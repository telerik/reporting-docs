---
title: Passing Values to Report Parameters
page_title: Sending Values to Report Parameters from outside HTML5 ReportViewer
description: "Learn how to pass values to report parameters from custom UI components outside the Telerik HTML5 Report Viewer in web applications."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-pass-values-to-report-parameters
tags: how,pass,values,report,parameters
published: True
reportingArea: HTML5
components: [html5, general]
position: 4
previous_url: /html5-report-viewer-howto-custom-parameters
---

# Passing Values to Report Parameters

Use a custom parameter UI to update report parameters instead of the default parameter area in the HTML5 Report Viewer.

The report and its required parameters are stored in a `ReportSource` object. Use the [ReportViewer.reportSource(rs)](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods#reportsource) method to update the report source. In this example, the selector's **Invoice Id** value supplies the report's **OrderNumber** parameter.

The example uses the [Invoice report](https://demos.telerik.com/reporting/invoice) and updates its **OrderNumber** parameter with the selector's **Invoice Id** value.

## Pass values to report parameters

Follow these steps:

1. Set up the HTML5 Report Viewer dependencies on the page:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ViewerPassValuesToReportParameters.html region=Html5ViewerPassValuesToReportParameters}}

2. Display a custom parameter UI with a selector, such as the [select element](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/select), that provides the **Invoice Id** value:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ViewerPassValuesToReportParameters.html region=Html5ViewerPassValuesToReportParameters2}}

3. Add the `ReportViewer` placeholder element:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ViewerPassValuesToReportParameters.html region=Html5ViewerPassValuesToReportParameters3}}

4. Initialize the HTML5 Report Viewer widget with the minimal set of [available ReportViewer options](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/overview). The selector's **Invoice Id** value sets the **OrderNumber** report parameter initially:

	{{source=CodeSnippets\Blazor\Docs\JavaScript\CustomParameterEditors.js region=Html5ViewerPassValuesReportParameters}}

5. Add code that updates the `ReportSource` parameters collection with the selector's **Invoice Id** value. This value supplies the **OrderNumber** report parameter:

	{{source=CodeSnippets\Blazor\Docs\JavaScript\CustomParameterEditors.js region=Html5ViewerUpdateReportSource}}

6. Review the completed HTML page:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ViewerPassValuesToReportParameters_01.html region=Html5ViewerPassValuesToReportParameters4}}

## See Also

* [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview)
* [Custom Parameter Editors](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor)
