---
title: Angular ReportViewer Renders Reports Only in the First Tab
page_title: Displaying Angular Report Viewer reports in Multiple Tabs
description: "Learn how to display Telerik Reporting reports in different tabs when using the Angular Report Viewer."
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

````HTML
<div class="container">
  <form>
    <div class="form-group">
      <div class="input-group-prepend" style="display: flex; justify-content: center;">
          <mat-tab-group [(selectedIndex)]="selectedTab" style="width: 75vw;">
              <mat-tab label="Tab 1">
                <ng-template matTabContent>
                  <button mat-button type="button" (click)="onLoad1Click()">Load</button>
                  <tr-viewer #rptViewer1
                    [containerStyle]="viewerContainerStyle"
                    [serviceUrl]="reportServerUrl"
                    [viewMode]="'INTERACTIVE'"
                    [scaleMode]="'SPECIFIC'"
                    [scale]="1.0">
                  </tr-viewer>
                </ng-template>
              </mat-tab>

              <mat-tab label="Tab 2">
                <ng-template matTabContent>
                  <button mat-button type="button" (click)="onLoad2Click()">Load</button>
                  <tr-viewer #rptViewer2
                    [containerStyle]="viewerContainerStyle"
                    [serviceUrl]="reportServerUrl"
                    [viewMode]="'INTERACTIVE'"
                    [scaleMode]="'SPECIFIC'"
                    [scale]="1.0">
                  </tr-viewer>
                </ng-template>
              </mat-tab>
          </mat-tab-group>
       </div>
    </div>
  </form>
</div>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { MatTabsModule } from '@angular/material/tabs';
import { MatButtonModule } from '@angular/material/button';
import { TelerikReportViewerComponent, TelerikReportingModule } from '@progress/telerik-angular-report-viewer';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, MatTabsModule, MatButtonModule, TelerikReportingModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})

export class AppComponent {
  //@ts-ignore
  @ViewChild('rptViewer1', { static: false }) rptViewer1: TelerikReportViewerComponent;
  //@ts-ignore
  @ViewChild('rptViewer2', { static: false }) rptViewer2: TelerikReportViewerComponent;

  title = 'my-app';
  selectedTab: number = 0;
  reportServerUrl: string;
  viewerContainerStyle: any;

  constructor() {
    this.reportServerUrl = 'https://demos.telerik.com/reporting/api/reports';
    this.viewerContainerStyle = {
      "position": 'relative',
      "width": '75vw',
      "height": '90vh',
      ['font-family']: 'ms sans serif'
    };
  }

  onLoad1Click() {

    var reportSource = {
      report: "Report Catalog.trdx",
    };

    if (this.rptViewer1) {
      this.rptViewer1.setReportSource(reportSource);
    }
  }

  onLoad2Click() {

    var reportSource = {
      report: "Dashboard.trdx",
    };

    if (this.rptViewer2) {
      this.rptViewer2.setReportSource(reportSource);
    }
  }
}
````

By default, the tab content is eagerly loaded. Eagerly loaded tabs will initialize the child components but not inject them into the DOM until the tab is activated.

## Demo Project

To download the demo application, go to our [GitHub Reporting Samples repository](https://github.com/telerik/reporting-samples/tree/master/AngularReportViewerInMultipleTabs).
