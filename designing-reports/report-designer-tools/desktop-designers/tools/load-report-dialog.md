---
title: Load Report Dialog
page_title: Load Report Dialog | for Telerik Reporting Documentation
description: Load Report Dialog
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/load-report-dialog
tags: load,report,dialog
published: True
position: 15
---

# Load Report Dialog



The Choose Report Source dialog is used to select the source for a report that would be displayed in a report viewer,         SubReport item or drill-through action.       

## 

The dialog offers the available report sources, which are:

* URL or file             

* XML markup             

* Type name (Supported in Visual Studio only)             

* Object instance (Supported in Visual Studio only)             

* Report server (Supported in Visual Studio by WinForms and HTML5.WebForms viewers)               

  ![reportsource-dialog-winforms-viewer](images/reportsource-dialog-winforms-viewer.png)

When the __Report server__  option is selected, the dialog will try to connect to a            [Telerik Report Server](http://docs.telerik.com/report-server/introduction)            instance using the connection details, provided by the report viewer. In case the connection succeeds, the dialog will read the categories and report names that are accessible           to the user and populate the editor fields:           

  ![reportsource-dialog-html 5webforms-viewer](images/reportsource-dialog-html5webforms-viewer.png)

If a connection to the report server instance is not available, the user can just enter the category and report name in the drop-down fields and they will be used in the resulting report source.         

>note The  __Report server__  option provides just a UI for choosing the category and report name from an active Telerik Report Server instance.             It does not provide a new report source type - it uses a  [UriReportSource](/reporting/api/Telerik.Reporting.UriReportSource)  instance             for initialization and returned result.           


For examples that demonstrate how to programmatically create a report source, check the API reference examples below.

Reports can be stored in different locations and in different formats so use the uniform way to access           them via the appropriate option. It would open an additional pane below allowing you to select the report source and           set report source parameters as well.         

>important When choosing  __Type name__  for a source, you must make sure that both reports use the same Telerik Reporting version then rebuild the application in order to load the sub-report report source.           


# See Also


 * [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%}) * [UriReportSource](/reporting/api/Telerik.Reporting.UriReportSource)  * [TypeReportSource](/reporting/api/Telerik.Reporting.TypeReportSource)  * [InstanceReportSource](/reporting/api/Telerik.Reporting.InstanceReportSource)  * [XmlReportSource](/reporting/api/Telerik.Reporting.XmlReportSource) 
