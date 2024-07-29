---
title: Creating and Filtering a Pie Chart with Multiple Parameters in Telerik Reporting
description: Learn how to create a pie chart with multiple parameters and apply filtering in Telerik Reporting.
type: how-to
page_title: How to Create and Filter a Pie Chart with Multiple Parameters in Telerik Reporting
slug: create-filter-pie-chart-multiple-parameters-telerik-reporting
tags: reporting, pie chart, filter, parameters
res_type: kb
ticketid: 1659572
---

## Environment

| Product | Progress® Telerik® Reporting |
| --- | --- |
| Version | 18.1.24.514 |

## Description

Creating a pie chart that supports filtering with several parameters allows for dynamic data visualization based on user selection. This KB article also answers the following questions:
- How can I add multiple parameters to a Telerik Reporting pie chart?
- How do I apply filtering based on these parameters?
- What steps are necessary to allow end-user selection for pie chart data?

## Solution

To create and filter a pie chart with multiple parameters in Telerik Reporting, follow these steps:

1. **Add Report Parameters:** Begin by adding report parameters. These parameters will later connect to the graph filter for dynamic data visualization. For guidance on adding report parameters, refer to the following articles:
   - [Approaches for Adding Report Parameters](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters)
   - [Report Parameters Overview](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/report-parameters/overview)

2. **Configure the Report Parameter Collection Editor:** In the "Report Parameter Collection Editor", set the "MultiValue" option to "True" and adjust the "Value". Use the "Edit Expression" dialog to select "Functions" -> "Aggregates" -> "AllDistinctValues". This configuration allows the parameter to accept multiple values for filtering.

3. **Connect the Parameter to the Pie Chart Filter:** To enable filtering based on the parameter, access the pie chart's "Edit Filters" option and set the "Operator" to "In". This connects the report parameter to the chart, enabling end-user selection and filtering.

4. **Review and Customize the Pie Chart:** Customize the pie chart as needed for your report. Refer to the [Creating and Customizing Pie Charts](https://docs.telerik.com/reporting/report-items/graph/chart-types/pie) documentation for detailed instructions.

5. **Apply Filtering to the Graph Item:** Ensure that the pie chart filters the data based on the selected parameters. For more information on adding filtering, visit [Adding Filtering to Graph Item](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-graph-item).

By following these steps, you can create a dynamic pie chart in Telerik Reporting that allows users to filter the data based on multiple parameters.

## See Also

- [Approaches for Adding Report Parameters](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters)
- [Report Parameters Overview](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/report-parameters/overview)
- [Creating and Customizing Pie Charts](https://docs.telerik.com/reporting/report-items/graph/chart-types/pie)
- [Adding Filtering to Graph Item](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-graph-item)


