---
title: Post Method to Pass Parameter in WebServiceDataSource
description: "Learn hot to pass parameter with POST method in WebServiceDataSource component in Telerik Reporting."
type: how-to
page_title: Pass Parameter in WebServiceDataSource with Post Method
slug: post-method-to-pass-parameter-in-webservicedatasource
position: 
tags: 
ticketid: 1417375
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>12.2.18.1129+</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description

The attached project demonstrates using a REST Web Service with `Post` Method for the WebServiceDataSource. The Service returns a `Person` with `Name` and `Surname`.

## Solution

Configuration of the [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%}) in the report:

1. There are two [report parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%})- `NameParameter` and `SurnameParameter`.

	The `MultiValue` property of the second one is set to `True`.

	The `AvailableValues` come from a [CSV DataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview%}). Note that the single values include quotes so that the corresponding JSON values can be properly configured.

1. Set the `Value` property of the parameters with the default values.
1. Add the WebServiceDataSource and set the `Method` to `Post`.
1. Because the values will be defined through the parameters, set the `Body` as follows:

	````JSON
{
		"Name": "@name",
		"Surname": @surname
	}
````

	![Configure Data Retrieval page of the Web Service DataSource wizard in the Standalone Designer with Body parameters Name and Surname](resources/CDR.png)

	You can see that the `Surname` is without quotation marks because it is an array of strings.

1. In the **Configure request parameters**, add a parameter for the header and to set the `Value` and `Design-Time Value` of the report parameters.

	![Configure Request Parameters page of the Web Service DataSource wizard in the Standalone Designer with all necessary parameters set](resources/CRP.png)

## Notes

* The `Content-Type` Header parameter that is necessary is **case-sensitive**.
* The parameters passed through the `Body` of the `POST` request should be `Inline` parameters.
* The demo application could be downloaded from [our Reporting-Samples GitHub repository](https://github.com/telerik/reporting-samples/tree/master/PostMethodWebServiceDataSource).
