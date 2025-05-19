---
title: Providing Custom Templates
page_title: Providing Custom Templates for the HTML5 Report Viewer Explained
description: "Learn how to provide Custom Templates for changing the layout of the HTML5 Report Viewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates
tags: providing,custom,templates
published: True
position: 3
previous_url: /html5-report-viewer-customizing-providing-template
---

# Providing Custom Templates for the HTML5 Report Viewer

The article elaborates on how to use a customized HTML template for the HTML5 Report Viewer.

Once you create a custom HTML template, you can provide it to the HTML5 Report through the `templateUrl` property:

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
	serviceUrl: "api/reports/",
	templateUrl: '/custom-template-directory/telerikReportViewerTemplate.html',
	reportSource: { 
		report: "Product Catalog.trdp" 
		}
});
````

The HTML template file is essentially a page that includes HTML document fragments nested inside __template__ tags. For example, this is what the report parameter template looks like:

````HTML
    <template id="trv-parameter">
        <div class="trv-parameter-container k-card">
            <div class="trv-parameter-header k-card-header">
                <div class="trv-parameter-title k-card-title"></div>
            </div>
            <div class="trv-parameter-error k-notification k-notificaiton-error">
                <span class="k-notification-status k-icon k-i-x-outline"></span>
                <span class="trv-parameter-error-message k-notification-content"></span>
            </div>
            <div class="trv-parameter-value k-card-body"></div>
        </div>
    </template>
````

The templates are loaded during the initialization of the __telerik_ReportViewer__ widget. Since this is an asynchronous network operation(the template HTML is loaded with an `HTTP GET` request) that takes an unpredictable amount of time, the widget is not operational until the template is loaded successful. 

To find when the report viewer is loaded, provide a callback function to the __telerik_ReportViewer__ widget's [ready()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/ready()%}) event:

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
	serviceUrl: "api/reports/",
	templateUrl: '/custom-template-directory/telerikReportViewerTemplate.html',
	reportSource: { 
		report: "Product Catalog.trdp" 
		},
	ready: function() {
		// report viewer is now ready for action
	}
});
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
