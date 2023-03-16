---
title: Programmatic Initialization of Report Parameter Values in Telerik Reporting Silverlight Viewer 
description: Setting Report Parameter Values in Telerik Reporting Silverlight Viewer By Code.
type: how-to
page_title: How To Initialize The Report Parameter Values in Telerik Reporting Silverlight Viewer Through Code
slug: programmatic-initialization-of-report-parameter-values-in-telerik-reporting-silverlight-viewer
res_type: kb
sitemap: false
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>Silverlight Application</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>Silverlight viewer</td>
	</tr>
</table>

> The Silverlight Report Viewer and its WCF Reporting Service are no longer supported and deployed with the installation of Telerik Reporting. The last release of Telerik Reporting with included Silverlight Report Viewer is [R1 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2023-17-0-23-118).

## Description

Usually, one may control the report appearance and the data it displays through report parameters. The Silverlight report viewer, offers built-in user interface that enables end users to interact with the reports. Still, there are cases when one may further need to control the report definition according to a custom logic that runs in the client application. However, since we have introduced the [Silverlight Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/how-to-add-report-viewer-to-a-silverlight-application%}), the greatest challenge our clients have faced is that there is no direct access to the report definition in the Silverlight application.

## Solution

To provide the ability to specify the parameter values, we have decided to add a new event to the **ReportViewer** control called **RenderBegin**. As its name suggests it is raised just before the actual request for rendering is sent and has two arguments: **sender** which is an instance of the **ReportViewer** control and an instance of the **RenderBeginEventArgs** class.

The parameter values can now be set through the **ParameterValues** property of the event argument. It is a **name** (string) – **value** (object) dictionary in which the key is the parameter name and the value is the designated parameter value.

Here is a simple example of setting report parameter values programmatically. Consider a scenario in which we want to set initial values for the cascading parameters of the [Product Line Sales](https://demos.telerik.com/reporting/product-line-sales) report:

````CSharp
public MainPage()
{
	InitializeComponent();
	this.ReportViewer1.RenderBegin += new RenderBeginEventHandler(ReportViewer1_RenderBegin);
}

void ReportViewer1_RenderBegin(object sender, RenderBeginEventArgs args)
{
	//single value parameter
	args.ParameterValues["ProductCategory"] = "Components";
	//multi value parameter
	args.ParameterValues["ProductSubcategory"] = new object[] { "Brakes", "Chains" };
}
````

## Notes

The Silverlight Report Viewer runs on the **client** and the reports are on the **server**, there is no way to know whether or not a parameter with a given name in the dictionary exists for the specified report on the server. The match is performed on the server **after** the request is sent. For this reason you have to pay extra attention that the names in the dictionary and the report parameter names in the report definition match completely. This is valid for their types as well.

> The values in the example are hardcoded for simplicity and in real project you can take the actual values from your **Silverlight UI** controls. Notice that passing multiple values is achieved through an object array. In all other cases the value is set directly with its actual type.
