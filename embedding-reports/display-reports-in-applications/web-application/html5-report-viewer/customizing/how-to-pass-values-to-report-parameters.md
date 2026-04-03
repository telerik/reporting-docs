---
title: Passing Values to Report Parameters
page_title: Sending Values to Report Parameters from outside HTML5 ReportViewer
description: "Learn How to pass Values to Report Parameters from Components Located Outside the HTML5 ReportViewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-pass-values-to-report-parameters
tags: how,pass,values,report,parameters
published: True
reportingArea: HTML5
position: 4
previous_url: /html5-report-viewer-howto-custom-parameters
---

# Passing Values to Report Parameters from Components Outside the HTML5 Report Viewer

This article explains how to use custom parameters UI to update the report parameters instead of using the report viewer's default implementation of the parameters area.

The report and all required parameters for it are packed in a `ReportSource` object. To update the report source, the [ReportViewer.reportSource(rs)](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)) method is used.

To give an example we will use the [Invoice](https://demos.telerik.com/reporting/invoice) report from our examples and will update its **OrderNumber** parameter from a custom parameter UI.

## Pass values to report parameters

1.  Setup the HTML5 Report Viewer dependencies on the page:

{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ViewerPassValuesToReportParameters.html region=Html5ViewerPassValuesToReportParameters}}

1.  Display the custom parameter UI with a selector such as the [select element](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/select) with a few values :

{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ViewerPassValuesToReportParameters.html region=Html5ViewerPassValuesToReportParameters2}}

1.  Add the ReportViewer placeholder element:

{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ViewerPassValuesToReportParameters.html region=Html5ViewerPassValuesToReportParameters3}}

1.  Now, initialize the HTML5 Report Viewer widget. We will use the minimal set of all [possible options](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization). Note that the value from the custom UI is used to set the **OrderNumber** report parameter initially:

    ```JavaScript
    $(document).ready(function () {
    	$("#reportViewer1").telerik_ReportViewer({
    		serviceUrl: "api/reports/",
    		reportSource: {
    			report: "Invoice.trdp",
    			parameters: {
    				OrderNumber: $('#invoiceId option:selected').val()
    				}
    		}
    	});
    });
    ```

1.  Add code that updates the `ReportSource` parameters collection with the selected **Invoice Id** from the dropdown selector:

    ```JavaScript
    $('#invoiceId').change(function () {
    	var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
    	reportViewer.reportSource({
    		report: reportViewer.reportSource().report,
    		parameters: { OrderNumber: $(this).val() }
    	});
    });
    ```

1.  The HTML page that we have just created should look like this:

{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ViewerPassValuesToReportParameters_01.html region=Html5ViewerPassValuesToReportParameters4}}

## See Also

- [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview)
- [Custom Parameter Editors](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor)
