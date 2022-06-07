---
title: Using the HTML5 MVC Report Viewer and Binding the Report with Data
description: This article explains how to use the HTML5 Report Viewer in MVC applications and bind it with a data from a model
type: how-to
page_title: How to Use the HTML5 Viewer in MVC Applications and Binding the Report with Data from Model
slug: using-the-html5-viewer-in-mvc-applications-and-binding-data
position: 
tags: 
ticketid: 
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>HtmlReportViewer</td>
		</tr>
		<tr>
			<td>Technology</td>
			<td>MVC</td>
		</tr>
	</tbody>
</table>


## Description
In the MVC architectures, data can be transferred between views and controllers via model.
A frequently asked question is how to use the modified data object for reports displayed by the [HTML5 Report Viewer](./html5-report-viewer) or its wrappers.

In general, the HTML5 Report Viewer and [Reporting REST service](./telerik-reporting-rest-conception) use a client-server architecture, for which the project with the HTML5 Report Viewer appears as a client for the Reporting REST service, even if the service is added in the same project as the viewer.

The HTML5 Report Viewer sends only short JSON serialized string messages to the Reporting REST Service. The messages include details what report and resources to be processed and rendered on the server, and then delivered to the client by the service.



## Solution
The MVC application allows users to modify and save data on the server. Once data is on the server, reports can retrieve it via data source component like [SqlDataSource](./sqldatasource), [SqlDataSource](./sqldatasource) and etc.

General information:
The purpose of data source components on designing reports is to let you specify how data to be retrieved in a declarative manner. When a report is processed, the Reporting engine uses the information from data source components how to retrieve data from the server and creates the needed data objects on its own.

Other scenarios requiring you to create or modify reports at run-time based on data are covered in the [How to Implement a Custom Report Source Resolver](./telerik-reporting-rest-custom-report-resolver) article.

## Demo
The attached demo project illustrates the scenario. The data source is a text file that is updated by the MVC application. When data is saved back in the text file, it can be pulled by the report requested in preview by the HTML5 Viewer hosted in the MVC application.

[Download the final Mvc application](resources/HtmlMvcViewerAndBindingData.zip).

### See Also
- [HTML5 Report Viewer](./html5-report-viewer)
- [Reporting REST service](./telerik-reporting-rest-conception)
- [SqlDataSource](./sqldatasource)
- [SqlDataSource](./sqldatasource)
- [How to Implement a Custom Report Source Resolver](./telerik-reporting-rest-custom-report-resolver)
