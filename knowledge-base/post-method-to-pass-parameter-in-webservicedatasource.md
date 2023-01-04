---
title: Post Method to Pass Parameter in WebServiceDataSource
description: This KB article to pass parameter with POST method in WebServiceDataSource
type: how-to
page_title: How to Pass Parameter in WebServiceDataSource with Post Method
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
The attached project demonstrates using a REST WebService with Post Method for the WebServiceDataSource. The Service returns a *Person* with  *Name* and *Surname*.

## Solution
Configuration of the [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%}) in the report :
1. There are two [report parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%})- *NameParameter* and *SurnameParameter*.
The **MultiValue** property of the second one is set to **True**.
The **AvailableValues** come from a [CSV DataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview%}). 
Note that the single values include quotes so that the corresponding JSON values can be properly configured. 
2. Set the **Value** property of the parameters with the default values.
3. Add the [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%}) and set the **Method** to **Post**.
4. Because the values will be defined through the parameters, set the **Body** as follows:

```
{
  "Name": "@name",
  "Surname": @surname
}
```
![](resources/CDR.png)
You can see that the *Surname* is without quotation marks because it is an array of strings.

5. In the **Configure request parameters**, add a parameter for the header and to set the **Value** and **Design-Time Value** of the report parameters.
![](resources/CRP.png)

## Notes
The **Content-Type** Header parameter that is necessary is case-sensitive. The parameters passed through the body of the POST request should be **Inline** parameters.
The demo application could be downloaded from [here](https://github.com/telerik/reporting-samples/tree/master/PostMethodWebServiceDataSource).
