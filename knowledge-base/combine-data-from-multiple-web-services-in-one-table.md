---
title: How to Combine Data from Multiple Web Service End Points in One Table?
description: Use multiple web services in the same table with end-point URLs depending on the parent data
type: how-to
page_title: Using data from Several Web Service End Points 
slug: combine-data-from-multiple-web-services-in-one-table
position: 
tags: 
ticketid: 1588649
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
I want to create a report containing a Table/List with multiple countries, or in the general case, other main objects. I should use an endpoint that provides me 
with all the countries names. 
I should then get a list of countries data objects with some detail data in it (e.g. "name", "region", "population", etc. for the particular country or other main object).
The country name, or in the general case another unique field, can be sent as a parameter to another endpoint to retreive the detailed information about the country or the main object. 

The problem is that the data I need in my table is split into these two endpoints: 
* the first one gives me a list of the main objects
* the second one gives me information about one of the objects in the list through a request parameter

## Solution
Use nested Tables/[Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) and [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) 
to set the inner table `DataSource.ServiceUrl` property.

+ Here is a link to a sample report from our GitHub repo - [TableWithMultipleWebServices.trdp](https://github.com/telerik/reporting-samples/blob/master/TableWithMultipleWebServices.trdp)
+ Here is a [link to a muted video demonstrating how the sample was prepared](http://somup.com/c3XUolwIM2).
+ Here are the main steps:
	1. Add [JsonDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component%}) with the names of the countries, _jsonDataSource1_ in the sample.
	1. Add [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%}) that would return countries details, _webServiceDataSource1_ in the sample. We will use the third party Web Service API [restcountries.com](https://restcountries.com/#api-endpoints-v3-all). Lets set the default `ServiceUrl` of our WebServiceDataSource to [https://restcountries.com/v3.1/name/bulgaria](https://restcountries.com/v3.1/name/bulgaria). Later, we will change the country name in the URL based on the data from the main data source.
	1. Add the main table and set its DataSource to the main data source. In the sample, this is _jsonDataSource1_ with the country names only. We will use the field to construct the `ServiceUrl` of the detailed data source later.
	1. Add a new column on the right of the main table, or where the details should appear.
	1. In the detail cell of the new column add a new table and assign it the detail data source, in the example, this is _webServiceDataSource1_.
	1. Use [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) to change the `DataSource.ServiceUrl` of the inner table to include the field from the main table. In the example, we use the hardcoded main end-point and provide the last part as the country name from the main data source. Here is the Expression:
		`="https://restcountries.com/v3.1/name/" + Fields.CountryName`

		Note that you need to type manually the name of the _Property path_ `DataSource.ServiceUrl`. As you may have noticed in the video, it was initially misspelled, which resulted in an error.

## See Also
* [How to set the content of JsonDataSource through report parameter]({%slug setting-the-content-of-jsondatasource-through-report-parameter%})
* [Change Connection String dynamically through a report parameter]({%slug how-to-pass-connectionstring-to-report-dynamically-through-report-parameter%})
