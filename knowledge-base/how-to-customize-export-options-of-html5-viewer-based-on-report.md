---
title: Selective export of reports from Html5 Viewer
description: How to customize the export options of the viewer based on the report
type: how-to
page_title: Modify available rendering extensions in the Html5 Report Viewer based no report name
slug: how-to-customize-export-options-of-html5-viewer-based-on-report
position: 
tags: 
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
You may bind on the [renderingEnd](https://docs.telerik.com/reporting/html5-report-viewer-reportviewer-events-renderingend) event of the viewer and hide the unwanted export options based on the report name (as taken from the [reportSource](https://docs.telerik.com/reporting/html5-report-viewer-reportviewer-methods-reportsource)_.report_ property). Here is a sample code for the page with the viewer:  
  

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

            function onRenderingEnd(e, args) {
                reportName = reportViewer.reportSource().report;

                if (reportName.indexOf("Dashboard") !== -1) {
                    reportName = "Dashboard";
                }

                if (!sideMenuBound || !largeMenuBound) {
                    setBindings();
                }
            }

            function setBindings() {
                var smallMenu = $(".trv-menu-small"),
                    sideMenu = $(".trv-side-menu").children("ul").data('kendoPanelBar'),
                    largeMenu = $(".trv-menu-large").data("kendoMenu");

                if (!largeMenuBound && largeMenu) {
                    largeMenu.bind("open", function (e) {
                        hidingOptions();
                    });

                    largeMenuBound = true;
                }

                if (!sideMenuBound && smallMenu) {
                    sideMenu.bind("expand", function (e) {
                        hidingOptions();
                    });

                    sideMenuBound = true;
                }
            }

            function hidingOptions() {
                switch (reportName) {
                    case "Dashboard":
                        hideOptions = ["XLSX", "XLS"];
                        break;
                    default:
                        hideOptions = [];
                        break;
                }

                $('[data-command-parameter]').show();

                $.each(hideOptions, function (index, item) {
                    var hiddenOption = $('[data-command-parameter="' + item + '"]');
                    if (hiddenOption && hiddenOption.length) {
                        hiddenOption.hide();
                    }

                });
            }

            $(window).resize(function () {
                setBindings();
            })

        });
    </script>
    
</body>
...
```
  
Briefly, on _the renderingEnd_ event, the code gets the report name and binds event handlers to the 'open' event of the large menu and to the 'expand' event of the small/side menu of the viewer's toolbar, if not already bound. The event handlers call _hidingOptions()_ function that iterates over the export menu options and hides those that are not necessary - specified in the _hideOptions_ variable which is filled in a switch-case statement depending on the report name.  
  
Another possible workaround is to modify the report viewer and hide the export option from the report viewer toolbar. Then, you may provide a [Custom Template](https://docs.telerik.com/reporting/html5-report-viewer-customizing-providing-template) and use the [Html5 viewer's commands](https://docs.telerik.com/reporting/html5-report-viewer-reportviewer-properties-commands).
