---
title: Angular Report Viewer in Multiple Tabs
description: When displaying Angular report viewer in different tabs it renders in the first tab only
type: how-to
page_title: How to Display Angular Report Viewer in Multiple Tabs
slug: angular-report-viewer-in-multiple-tabs
position: 
tags: 
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
Sometimes when you want to display the Angular Report Viewer in multiple tabs only in the first tab the report is rendered. 

## Solution
You need to use [lazy loading](https://material.angular.io/components/tabs/overview#lazy-loading) for the tab's content:
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
By default, the tab contents are eagerly loaded. Eagerly loaded tabs will initialize the child components but not inject them into the DOM until the tab is activated.

## Sample Application
The demo application could be downloaded from [here](https://github.com/telerik/reporting-samples/tree/master/AngularReportViewerInMultipleTabs). 
1. Open **MyRestService** project and run the [Upgrade Wizard](../ui-upgrade-wizard).
2. Rebuild the project to recover the required
references and packages. 
3. Start the application. 
4. Open the Angular project and run:
```
npm install 
```
and
```
ng serve
```
