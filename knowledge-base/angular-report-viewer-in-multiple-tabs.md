---
title: Angular ReportViewer Renders Reports Only in the First Tab
page_title: How to Display Angular Report Viewer in Multiple Tabs
description: "Learn ho to display Angular reports in different tabs when using the Angular ReportViewer."
type: how-to
slug: angular-report-viewer-in-multiple-tabs
tags: telerik, reporting, display, angular, reports, in, multiple, different, tabs
ticketid: 1450621
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Report Viewer</td>
			<td>Angular</td>
		</tr>
	</tbody>
</table>


## Description

How can I display the Angular ReportViewer reports in multiple tabs and not only in the first tab?

## Solution

To solve the issue, use [lazy loading](https://material.angular.io/components/tabs/overview#lazy-loading) for the content of the tab:

```JavaScript
mat-tab-group [(selectedIndex)]="selectedTab">
             <mat-tab label="Tab Rpt Works">
                <ng-template matTabContent>
                  <button type="button" (click)="onLoad1Click($event)">Load</button>
                  <tr-viewer #reportViewer
                    [containerStyle]="viewerContainerStyle"
                    [serviceUrl]="reportServerUrl"
                    [viewMode]="'INTERACTIVE'"
                    [scaleMode]="'SPECIFIC'"
                    [scale]="1.0">
                  </tr-viewer>
                </ng-template>                  
              </mat-tab>  
 </mat-tab-group>
```

By default, the tab content is eagerly loaded. Eagerly loaded tabs will initialize the child components but not inject them into the DOM until the tab is activated.

To download the demo application, go to the [GitHub repository](https://github.com/telerik/reporting-samples/tree/master/AngularReportViewerInMultipleTabs):

1. Open the **MyRestService** project and run the [Upgrade Wizard]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard %}).
2. Rebuild the project to recover the required references and packages.
3. Start the application.
4. Open the Angular project and run `npm install`. Then, execute `ng serve`.


