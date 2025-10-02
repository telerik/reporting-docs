---
title: Switch Reports Displayed in Kendo Modal Window
description: "Learn how to switch reports effectively in HTML5-based Report Viewers rendered within a Kendo Modal window."
type: how-to
page_title: Render different reports in Kendo Modal Window
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

In many scenarios, it is necessary to display different reports in modal windows. For example, a different report should pop up depending on a button clicked by the user. In this article, we will demonstrate how this may be achieved effectively with Telerik Reporting and the [Kendo UI for jQuery Window](https://demos.telerik.com/kendo-ui/window/index) widget.

In this example, the button for switching the report will be a custom action on the `Kendo Window` itself - [Customizing Actions](https://demos.telerik.com/kendo-ui/window/actions).

## Solution

1. Create the element that is to be used for the initialization of the window, and insert in it the element that will be used for initializing the HTML5 Report Viewer.

   ```HTML
   <div id="winReports">
       <div id="reportViewer1">
           Loading...
       </div>
   </div>
   ```

1. Create the function for switching the reports - `switchReport` and the function that will initialize the Kendo Window widget - `showWindow`:

   ```JavaScript
   function switchReport() {
           var viewer = $("#reportViewer1").data("telerik_ReportViewer");

               showFirst = !showFirst;
               viewer.reportSource({
                   report: showFirst ? FirstReport : SecondReport,
                   parameters: {}
               });
       }

       function showWindow() {
           var windowOptions = {
               actions: [ "Custom", "Close"],
               title: {
                   text: "Reports",
               },
               modal: true,
               draggable: true,
               visible: false,
               width: "1200px",
               open: switchReport
           };

           const kendoWindow = $("#winReports").kendoWindow(windowOptions).data("kendoWindow");

           kendoWindow.center(true).open();

           // custom action for report switching
           var customAction = kendoWindow.wrapper.find(".k-window-actions [aria-label='Custom']");

           // edit custom button look
           customAction.find("span").removeClass().text("Switch Report");

           customAction.click(function (e) {
               e.preventDefault();
               switchReport();
           });
       }
   ```

1. When the document is ready - [$( document ).ready()](https://learn.jquery.com/using-jquery-core/document-ready/), initialize an empty report viewer and the Kendo Window, as well as some globally scope variables to keep the state of the report viewer(which report is currently loaded):

   ```HTML
   <script type="text/javascript">
       const FirstReport = "Barcodes Report.trdx";
       const SecondReport = "Dashboard.trdx";
       var showFirst = true;

       $(document).ready(function () {

           // init empty report viewer
           $("#reportViewer1")
               .telerik_ReportViewer({
                   serviceUrl: "https://demos.telerik.com/reporting/api/reports/",
               });

           // init and open kendo window
           showWindow()
       });
   </script>
   ```

## Sample Project

The sample project can be found in [our GitHub demos repository - SwitchReportsInKendoModal](https://github.com/telerik/reporting-samples/tree/master/SwitchReportsInMvcKendoModal).
