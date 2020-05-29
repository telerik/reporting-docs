---
title: Selective export of Angular Report Viewer reports
description: How to customize the export options of the viewer based on the report
type: how-to
page_title: Modify available rendering extensions in the Angular Report Viewer based on report name
slug: how-to-customize-export-options-of-angular-report-viewer
position: 
tags: angular,report viewer,export options
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
The available rendering formats are provided from the REST Service based on the project configuration file and references. 
Setting different rendering extensions in the viewer per report definition is not available out of the box. 
  
## Solution
You may bind on the [renderingEnd](../html5-report-viewer-reportviewer-events-renderingend) event of the viewer 
and hide the unwanted export options based on the report name 
(as taken from the [reportSource](../html5-report-viewer-reportviewer-methods-reportsource)_.report_ property). 
Add the following classes to the Angular project:  

``` TypeScript
import * as $ from 'jquery';

class HideOption {

    reportName: string;
    formatsToHide = [];

    constructor(reportName: string, formatsToHide: any) {
        this.reportName = reportName;
        this.formatsToHide = formatsToHide;
    }
}

export class ExportOptionsHider {

    public static instance : ExportOptionsHider;
    public static init(){
        if(!ExportOptionsHider.instance){
            ExportOptionsHider.instance = new ExportOptionsHider();
        }
        ExportOptionsHider.instance.bindEvents();
    }

    private largeMenuBound = false;
    private sideMenuBound = false;
    private reportSource = "";
    private hideOptions = [
        new HideOption("Dashboard.trdp", ["XLSX"]),
        new HideOption("ReportCatalog.trdp", ["PDF", "XLSX"])
    ];

    public update(reportSource: string){
        this.reportSource = reportSource;
        // show all extensions
        $('[data-command-parameter]').show();
    }

    private bindEvents() {
        const sideMenu = $(".trv-side-menu").children("ul").data('kendoPanelBar');
        const largeMenu = $(".trv-menu-large").data("kendoMenu");
        const smallMenu = $(".trv-menu-small");

        // bind to the 'open' event of the main menu
        if (!this.largeMenuBound && largeMenu) {
            largeMenu.bind("open", () => {
                this.hideUnwantedOptions();
            });

            this.largeMenuBound = true;
        }

        // bind to the 'expand' event of the side menu
        if (!this.sideMenuBound && smallMenu) {
            sideMenu.bind("expand", () => {
                this.hideUnwantedOptions();
            });

            this.sideMenuBound = true;
        }
    }

    private hideUnwantedOptions() {
        this.hideOptions.forEach((hideOption) => {
            if (this.reportSource.startsWith(hideOption.reportName)) {
                hideOption.formatsToHide.forEach((item) => {
                    var hiddenOption = $('[data-command-parameter="' + item + '"]');
                    if (hiddenOption && hiddenOption.length) {
                        hiddenOption.hide();
                    }
                });
                return;
            }
        });
    }
}
```
 Attach the events in the component template:
 ``` Html
 ....
    [ready]="ready"
    [renderingEnd]="onRenderingEnd">
</tr-viewer>
```

Handle the events in the component
``` TypeScript
.....
    @HostListener('window:resize', ['$event'])
    onResize() {
        ExportOptionsHider.init();  
    }

    ready() {
        ExportOptionsHider.init();
    }

    onRenderingEnd(e, args): void {
        ExportOptionsHider.instance.update(e.target.reportSource().report);
    }
```
On _the renderingEnd_ event, the code gets the report name. On Report Viewer ready and Window resize we bind the event handlers to the 'open' event of the main menu and to the 'expand' event of the side menu of the viewer's toolbar, if not already bound. The event handlers call _hideUnwantedOptions()_ that iterates over the export menu options and hides those that are not necessary - specified in the _hideOptions_ array.
