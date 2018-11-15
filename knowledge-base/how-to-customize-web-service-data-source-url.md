---
title: How to customize WebServiceDataSource URL
description: Modify WebServiceDataSource URL dynamically
type: how-to
page_title: Provide WebServiceDataSource URL as inline parameter
slug: how-to-customize-web-service-data-source-url
position: 
tags: 
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
Sometimes it is necessary to modify the WebServiceDataSource URL dynamically, for example depending on the environment (i.e. test or production).

## Solution
1. The **Service Url** property of the _WebServiceDataSource_ should be set as an inline parameter **@Url**, i.e. in _Configure data retrieval_ dialog of the [WebServiceDataSource Wizard](https://docs.telerik.com/reporting/webservicedatasource-wizard) :

_Service Url:_| __@Url__
---|---

2. The value of _@Url_ should be provided as an [Expression](https://docs.telerik.com/reporting/report-expressions) (i.e. taken from a Report Parameter) so that its value to be evaluated run time - in _Configure request parameters_ dialog of the Wizard : 

  _Name_|_Type_|_Value_|_Design-Time Value_
  ---|---|---|---
  @Url|__Inline__|= Parameters.Url.Value|https://www.googleapis.com/books/v1/volumes
