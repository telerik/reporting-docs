---
title: How to use Guid as value for report parameter or data source parameter?
description: Explaination on how to use guid as value for report parameter or data source parameter
type: how-to
page_title: How to set a Guid as value for report parameter or data source parameter
slug: how-to-use-a-guid-as-value-for-report-parameter-or-data-source-parameter-
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

The article explains how to use a Guid as value for report parameter or data source parameter. 
  
## Solution 1

Set the Type of the [ReportParameter](/api/telerik.reporting.reportparameter) to String. Use the **CStr(System.Object)** [built-in conversion function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview%}) to convert the Guid to String for the  [ValueMember](/api/telerik.reporting.reportparameteravailablevalues#collapsible-Telerik_Reporting_ReportParameterAvailableValues_ValueMember) property of the report parameter [AvailableValues](/api/telerik.reporting.reportparameteravailablevalues).  

When using Guid [DataSourceParameter](/api/telerik.reporting.datasourceparameter) and its value is set to a [ReportParameter](/api/telerik.reporting.reportparameter), create an [User Function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) to handle the conversion:  


````cs
public static Guid ConvertToGuid(string guid)
{
           return new Guid(guid);
}
````
````vb
Public Shared Function ConvertToGuid(guid As String) As Guid
    Return New Guid(guid)
End Function
````  

Finally, set the value for the [DataSourceParameter](/api/telerik.reporting.datasourceparameter):   

`= ConvertToGuid(Parameters.Parameter1.Value)`  

## Solution 2  
  
Convert the Guid value to a **String** value in the data-retrieval method, or [add a calculated field]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/calculated-fields%}) to the data source component by using the **CStr(System.Object)** [built-in conversion function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview%}) to convert the Guid to String. Then, you can use the *String* report parameters directly.

