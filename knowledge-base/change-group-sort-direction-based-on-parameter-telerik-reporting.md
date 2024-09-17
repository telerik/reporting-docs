---
title: Changing Sort Direction Based on a Parameter in Telerik Reporting
description: Learn how to dynamically change the sort direction of a group in Telerik Reporting based on a parameter value.
type: how-toResources
Quality and Feedback
Generate KB Article
page_title: How to Dynamically Change Sorting Direction of Groups in Reports Based on Parameters
slug: change-group-sort-direction-based-on-parameter-telerik-reporting
tags: parameters, sorting, groups, telerik, reporting
res_type: kb
ticketid: 1664543
---

## Environment

| Version | Product | Author |  

| --- | --- | ---- |  

| 18.1.24.514| Telerik Reporting|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to change the sort direction dynamically of a group within a report based on the value of a parameter. The group should be sorted either in descending order or ascending order. 

## Solution

To dynamically control the sort direction of a group based on a parameter, follow these steps:

1. Define a report parameter with the appropriate value type, for example, `SortByDirection`. This parameter will will be used in the expression for sorting the data to achieve interactivity. The **AvailableValues** are: 'ASC' and 'DESC'.

2. In the report designer, navigate to the report properties. Then, the SortByDirections parameter can be used for the report's Sortings collection:
 
3. Apply the changes and preview the report. The sorting direction of the specified group will change based on the value of the `SortByDirection` parameter.

For more information on sorting data in reports and using report parameters, refer to the following Telerik Documentation articles:
- [Ordering Data](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-items/ordering-data/overview)
- [How to Add Report Parameters](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters)

## Notes

- Interactive sorting, allowing users to toggle between ascending and descending order (without any parameter), can also be achieved using sorting actions. For more details, see [Sorting Action Overview](https://docs.telerik.com/reporting/interactivity/actions/sorting-action/overview).

## See Also

- [Report Parameters Documentation](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters)
- [Sorting Data in Reports](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-items/ordering-data/overview)
- [Sorting Action in Reports](https://docs.telerik.com/reporting/interactivity/actions/sorting-action/overview)
