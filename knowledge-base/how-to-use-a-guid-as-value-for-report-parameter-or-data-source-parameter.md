---
title: How to use guid as value for report parameter or data source parameter?
description: Explains how to use guid as value for report parameter or data source parameter
type: how-to
page_title: Using a Guid as value for report parameter or data source parameter
slug: how-to-use-a-guid-as-value-for-report-parameter-or-data-source-parameter-
res_type: kb
---
 
# Description  
The article explains how to use a Guid as value for report parameter or data source parameter. 
  
# Solution

Set the Type of the [ReportParameter](../t-telerik-reporting-reportparameter) to String. Use the **CStr(System.Object)** [built-in conversion function](../expressions-functions) to convert the Guid to String for the  [ValueMember](../p-telerik-reporting-reportparameteravailablevalues-valuemember) property of the report parameter [AvailableValues](../properties-t-telerik-reporting-reportparameteravailablevalues).  

When using Guid [DataSourceParameter](../t-telerik-reporting-datasourceparameter) and its value is set to a [ReportParameter](../t-telerik-reporting-reportparameter), create an [User Function](../expressions-user-functions) to handle the conversion:  


```cs
public static Guid ConvertToGuid(string guid)
{
           return new Guid(guid);
}
```
```vb
Public Shared Function ConvertToGuid(guid As String) As Guid
    Return New Guid(guid)
End Function
```
   

Finally, set the value for the [DataSourceParameter](../t-telerik-reporting-datasourceparameter):   
  


`= ConvertToGuid(Parameters.Parameter1.Value)`  

## Solution 2  
  
Convert the Guid value to a String value in the data-retrieval method, or [add a calculated field](../datasource-calculated-fields) to the data source component by using the **CStr(System.Object)** [built-in conversion function](../expressions-functions) to convert the Guid to String. Then you can use the String report parameters directly.

