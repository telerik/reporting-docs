---
title: Connecting Two Data Sources within a Single Table
description: "Learn how to connect two data sources within a single table in Telerik Reporting."
type: how-to
page_title: How to Connect Two WebAPI Data Sources within a Single Table in Telerik Reporting
slug: connect-two-data-sources-single-table-telerik-reporting
tags: telerik-reporting, data-sources, table
res_type: kb
ticketid: 1636749
---

## Environment

| Property | Value                  |
|----------|------------------------|
| Product  | Progress Telerik Reporting |

---

## Description

I need to use aggregate data from two data sources within a single table in Telerik Reporting. The goal is to find the difference between the total numbers from both sources.

---

## Solution

To achieve this, you can use a [SubReport]({%slug telerikreporting/designing-reports/report-structure/subreport%}) as a workaround since there is no built-in mechanism for combining data across different data sources in Telerik Reporting. Follow these steps:

1. Create a subreport definition that will contain the logic to calculate the difference between the two totals.
1. Reference the subreport in a SubReport item that is placed in the Table Header/Footer of the main report table that uses the first data source. Let the SubReport have the second source as a DataSource
1. Pass the main report table total as a parameter to the SubReport ReportSource.
1. In the subreport definition, use the passed parameter to calculate the difference with its total.

Refer to the attached sample [main report](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/AggregateFromTwoDS/MainReport.trdx) and its [subreport](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/AggregateFromTwoDS/SubReport.trdx) for a demonstration of this solution.

---

## Notes

Keep in mind that this workaround involves using a SubReport and passing parameters between the main report and the SubReport to perform the desired calculations.

## Sample Reports

* [MainReport.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/AggregateFromTwoDS/MainReport.trdx)
* [SubReport.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/AggregateFromTwoDS/SubReport.trdx)
