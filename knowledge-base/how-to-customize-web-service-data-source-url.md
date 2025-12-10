---
title: How to Customize WebServiceDataSource URL
description: "Learn how to modify WebServiceDataSource URL dynamically."
type: how-to
page_title: Provide WebServiceDataSource URL as an inline parameter
slug: how-to-customize-web-service-data-source-url
ticketid: 1345801
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

Sometimes it is necessary to modify the WebServiceDataSource URL dynamically, for example, depending on the environment (i.e., test or production).

## Solution

1. The **Service Url** property of the _WebServiceDataSource_ should be set as an inline parameter **@Url**, i.e. in _Configure data retrieval_ dialog of the [WebServiceDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/webservicedatasource-wizard%}):
	
	_Service Url:_| __@Url__
	---|---

1. The value of _@Url_ should be provided as an [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) (i.e., taken from a Report Parameter) so that its value can be evaluated at run time in the _Configure request parameters_ dialog of the Wizard: 

	_Name_|_Type_|_Value_|_Design-Time Value_
	---|---|---|---
	@Url|__Inline__|= Parameters.Url.Value|_A valid URL to a Web Service_
