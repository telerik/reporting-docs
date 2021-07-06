---
title: Change Sub Report based on Main Report's Data
description: Change Sub Report based on Main Report's Data.
type: how-to
page_title: Change Sub Report based on Main Report's Data
slug: change-sub-report-based-on-main-report-s-data
res_type: kb
---

    
## Description  
This article explains how to change the report source of the SubReport based on Main Report's Data.  
  
## Solution  

You can use a [user function](../expressions-user-functions) in a [binding](../expressions-bindings) to the SubReport item's ReportSource property. The function should return a valid [ReportSource object](../report-sources) that wraps a report - the subreport.

For example, the following user function:    

```cs
public static ReportSource SetReportSource(string field)
  {
      var TRS = new TypeReportSource();
      TRS.Parameters.Add("Parameter1", field);
      if (field.ToLower() == "yes")
          TRS.TypeName = typeof(SubReport1).AssemblyQualifiedName;
      else
          TRS.TypeName = typeof(SubReport2).AssemblyQualifiedName;
      return TRS;
  }
```
  
You should set the following Binding to the SubReport item in the Main report:

**Property path:** ReportSource

**Expression:** = SetReportSource(Fields.MainReportFieldX


