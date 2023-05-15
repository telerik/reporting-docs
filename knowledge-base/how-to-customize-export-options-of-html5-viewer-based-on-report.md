---
title: Filter export options based on the selected report in the Html5 Report Viewer
description: "Learn how to customize the export options displayed by the HTML5 Report Viewer based on the currently selected report."
type: how-to
page_title: Modify available rendering extensions in the Html5 Report Viewer based on report name
slug: how-to-customize-export-options-of-html5-viewer-based-on-report
position: 
tags: html5, report, viewer, hide, filter, export, options, client-side
ticketid: 1397565
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
The available rendering formats are related to the REST Service and are taken from the configuration file of its project. Setting different rendering extensions in the viewer per report definition is not available out of the box. 
  
## Solution
You may bind on the [renderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)%}) event of the viewer and hide the unwanted export options based on the report name (as taken from the [reportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource()%})_.report_ property). Here is a sample code for the page with the viewer:  
  

``` Html
...
<body>
    ...

    <script type="text/javascript">
        $(document).ready(function () {
            var reportName = "",
                hideOptions,
                largeMenuBound = false,
                sideMenuBound = false,
                reportViewer;

            reportViewer = $("#reportViewer1")
                .telerik_ReportViewer({
                    serviceUrl: "api/reports/",
                    reportSource: {
                        report: "Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary",
                    },
                    renderingEnd: onRenderingEnd
                }).data("telerik_ReportViewer");

	    // get report name from the reportSource
            function onRenderingEnd(e, args) {
                reportName = reportViewer.reportSource().report;

                if (reportName.indexOf("Dashboard") !== -1) {
                    reportName = "Dashboard";
                }

	    	// bind menus if not already bound
                if (!sideMenuBound || !largeMenuBound) {
                    setBindings();
                }
            }

            function setBindings() {
                var smallMenu = $(".trv-menu-small"),
                    sideMenu = $(".trv-side-menu").children("ul").data('kendoPanelBar'),
                    largeMenu = $(".trv-menu-large").data("kendoMenu");
		
	    	// bind to the 'activate' event of the main menu
		if (!largeMenuBound && largeMenu) {
                    largeMenu.bind("activate", function (e) {
                        hidingOptions();
                    });

                    largeMenuBound = true;
                }

	    	// bind to the 'expand' event of the side menu
                if (!sideMenuBound && smallMenu) {
                    sideMenu.bind("expand", function (e) {
                        hidingOptions();
                    });

                    sideMenuBound = true;
                }
            }

	    // get the extensions to hide based on the report name
            function hidingOptions() {
                switch (reportName) {
                    case "Dashboard":
                        hideOptions = ["XLSX", "XLS"];
                        break;
                    default:
                        hideOptions = [];
                        break;
                }

	    	// show all extensions
                $('[data-command-parameter]').show();

	    	// hide the specified extensions
                $.each(hideOptions, function (index, item) {
                    var hiddenOption = $('[data-command-parameter="' + item + '"]');
                    if (hiddenOption && hiddenOption.length) {
                        hiddenOption.hide();
                    }

                });
            }

	    // bind menus in case of resizing
            $(window).resize(function () {
                setBindings();
            })

        });
    </script>
    
</body>
...
```
  
Briefly, on _the renderingEnd_ event, the code gets the report name and binds event handlers to the 'open' event of the main menu and to the 'expand' event of the side menu of the viewer's toolbar, if not already bound. The event handlers call _hidingOptions()_ function that iterates over the export menu options and hides those that are not necessary - specified in the _hideOptions_ variable which is filled in a switch-case statement depending on the report name.
