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

    largeMenuBound = false;
    sideMenuBound = false;
    reportSource = "";
    hideOptions = [
        new HideOption("Telerik.Reporting.Examples.CSharp.Dashboard", ["XLSX"]),
        new HideOption("Telerik.Reporting.Examples.CSharp.ReportCatalog", ["PDF", "XLSX"])
    ];

    update(){
        // show all extensions
        $('[data-command-parameter]').show();
    }

    bindEvents() {
        const sideMenu = $(".trv-side-menu").children("ul").data('kendoPanelBar');
        const largeMenu = $(".trv-menu-large").data("kendoMenu");
        const smallMenu = $(".trv-menu-small");

        // bind to the 'open' event of the main menu
        if (!this.largeMenuBound && largeMenu) {
            largeMenu.bind("open", () => {
                this.hideOptionsHandler();
            });

            this.largeMenuBound = true;
        }

        // bind to the 'expand' event of the side menu
        if (!this.sideMenuBound && smallMenu) {
            sideMenu.bind("expand", () => {
                this.hideOptionsHandler();
            });

            this.sideMenuBound = true;
        }
    }

    hideOptionsHandler() {
        console.log("hide export options for" + this.reportSource);
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
    exportOptionsHider: ExportOptionsHider;

    @HostListener('window:resize', ['$event'])
    onResize(event) {
        this.exportOptiosnHider.bindEvents();
    }

    ready() {
        console.log('ready');
        this.exportOptionsHider = new ExportOptionsHider();
        this.exportOptionsHider.bindEvents();
    }

    onRenderingEnd(e, args): void {
        this.exportOptionsHider.reportSource = e.target.reportSource().report;
        this.exportOptionsHider.update();
    }
```
Briefly, on _the renderingEnd_ event, the code gets the report name. On ready and window size change we bind the event handlers to the 'open' event of the main menu and to the 'expand' event of the side menu of the viewer's toolbar, if not already bound. The event handlers call _hideOptionsHandler()_ that iterates over the export menu options and hides those that are not necessary - specified in the _hideOptions_ property..
