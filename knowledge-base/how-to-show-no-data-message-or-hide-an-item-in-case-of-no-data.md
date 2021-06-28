---
title: How to show 'No Data Message' or hide an item in case of No data
description: How to show 'No Data Message' or hide an item in case of No data.
type: how-to
page_title: How to show 'No Data Message' or hide an item in case of No data
slug: how-to-show-no-data-message-or-hide-an-item-in-case-of-no-data
res_type: kb
---

## Description
How to show '*No Data Message*' or hide an item in case of No data returned for the item's data source.  
  
## Solution
- **For Table/List/Crosstab, Graph and Map items**.  
You can use the 'NoDataMessage' feature. Once the data item's NoDataMessage property is set, the message will appear if the item's DataSource gets no records from its source. You can also use the NoDataStyle properties to style the message or hide the item entirely.  
For more details, check [How to: Set a No Data Message](../report-structure-dataitem-set-no-data-message).
- **For Report.**  
If the report's DataSource retrieves no records, static sections like [ReportHeaderSection](../designing-reports-understanding-report-structure)and [static groups' sections](../data-items-grouping-data) are rendered, allowing you to add a message and display it.  
For example, you can add a TextBox item in the ReportHeaderSection and set its Visible property to false. By using [conditional formatting](../styling-conditional-formatting), you can make the TextBox item visible in case an expression like "=Count(1)==0" points there are no visualized data records by the report.
- **For Sub Report.**  
You can display a 'NoDataMessage' in the sub report by using the same approach as **For a Report**.  
 If you want to hide the SubReport item and its content, then you can add a binding in the TextBox item's Bindings collection like:  

```
Property path: Parent.Parent.Parent.Visible

Expression: = Count(1)>0
```

> Note
> </br>
> The *Property path* has to be typed manually, where the *Parent* keyword can be used as many times as needed to get the item in the Main Report, which you want to hide.



