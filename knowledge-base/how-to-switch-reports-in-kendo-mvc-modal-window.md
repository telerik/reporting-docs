---
title: Switch Reports Displayed in Kendo MVC Modal Window
description: How to switch reports effectively in Html5 MVC Report Viewer hosted in Kendo MVC modal window
type: how-to
page_title: Display different reports in Kendo modal window
slug: how-to-switch-reports-in-kendo-mvc-modal-window
position: 
tags: 
ticketid: 1421708
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
</table>


## Description
In many scenarios, it is necessary to display different reports in modal windows. For example, a different report should pop-up depending on the button clicked by the user. Here we explain how this may be achieved effectively with Telerik Reporting and [Kendo MVC modal window](https://docs.telerik.com/aspnet-mvc/helpers/layout/window/overview).

## Solution
Our recommendation is to create the [Html5 MVC Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview%}) once, for example, through a call to the corresponding MVC action, and then replace only the viewer's [reportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}). You may use the 'open' event of the Kendo modal window. This way the action will be hit only once, upon initializing the Kendo window.
Here is sample code for the 'open' event of the modal window:
```JavaScript
<script type="text/javascript">
    const FirstReport = "FirstReport.trdp";
    const SecondReport = "SecondReport.trdp";

    var showFirst = false;

    function Reports_onWindowOpenNew(e) {
        var viewer = $("#reportViewer1").data("telerik_ReportViewer");
        if (viewer) {
            var reportname = SecondReport;
            if (showFirst) {
                reportname = FirstReport;
            }

            showFirst = !showFirst;
            viewer.reportSource({
                report: reportname,
                parameters: {}
            });
        }
    }
</script>
```
This code will switch between two reports on each opening of the Kendo modal window.

The set-up of the modal window may look like (note the [LoadContentFrom](https://docs.telerik.com/aspnet-mvc/helpers/layout/window/content) option) :
```JavaScript
@(Html.Kendo().Window()
            .Name("winReports")
            .Title("Reports")
            .Draggable()
            .Actions(actions => actions.Close())
            .Events(e => e.Open("Reports_onWindowOpenNew"))
            .Modal(true)
            .LoadContentFrom("DisplayReportViewer", "Home")
            .Visible(false)
            .Width(1000)
            .HtmlAttributes(new { style = "margin: 3px" })
)
```
'DisplayReportViewer' is the action from the 'Home' controller that initializes the viewer upon Kendo modal window creation. This is done only once, on the load of the page.

The sample project can be found in [our GitHub demos repository](https://github.com/telerik/reporting-samples/tree/master/SwitchReportsInMvcKendoModal).
