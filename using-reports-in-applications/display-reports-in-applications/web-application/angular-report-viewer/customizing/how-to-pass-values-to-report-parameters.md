---
title: How to Pass Values to Report Parameters
page_title: How to Pass Values to Report Parameters | for Telerik Reporting Documentation
description: How to Pass Values to Report Parameters
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/customizing/how-to-pass-values-to-report-parameters
tags: how,to,pass,values,to,report,parameters
published: True
position: 0
---

# How to Pass Values to Report Parameters

This topic explains how to update the report parameters with values passed from a custom UI instead of using the report viewer's default parameters area. The report identifier and all required parameters values for it are packed in a ReportSource object. To update the report source, the [setReportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/methods%}) method is used. 

## Pass values to report parameters from the application UI

1. Add the custom UI in your application. For example:
    
    ````html
<button (click)="onButtonClick(value)">Update parameter value</button>
````

1. Declare the variable for the viewer and update the viewer's report source with a new parameter value:
    
    ````js
import { Component, ViewChild } from '@angular/core';
import { TelerikReportViewerComponent } from '@progress/telerik-angular-report-viewer';
...
export class AppComponent {
    @ViewChild('viewer1') viewer: TelerikReportViewerComponent;
 ...
    onButtonClick(param: string) {
        var rs = {
            report: 'Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null',
            parameters: { OrderNumber: param }
        };
        this.viewer.setReportSource(rs);
    }
...
}
````

    The setReportSource(rs) method will automatically refresh the report with the new parameter values.


# See Also

* [How To: Use Angular Report Viewer with Angular CLI]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-angular-cli%})

* [How To: Use Angular Report Viewer with SystemJS]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-systemjs%})

