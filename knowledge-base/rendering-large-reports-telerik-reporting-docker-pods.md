---
title: Rendering Large Reports with 300,000+ Records
description: Learn how to optimize resource allocation and report design to render large reports with 300,000+ records in Telerik Reporting without failures.
type: how-to
page_title: Handling Large Reports in Telerik Reporting on Docker Pods
meta_title: Handling Large Reports in Telerik Reporting on Docker Pods
slug: rendering-large-reports-telerik-reporting-docker-pods
tags: reporting, large-datasets, performance, optimization, docker-pods, resource-allocation
res_type: kb
ticketid: 1703352
---

## Environment

<table>
   <tbody>
      <tr>
         <td>Product</td>
         <td>Reporting</td>
      </tr>
      <tr>
         <td>Version</td>
         <td>19.1.25.521</td>
      </tr>
   </tbody>
</table>

## Description

Rendering reports with large datasets, such as more than 300,000 records, can be resource-intensive and cause failures, especially in containerized environments like Docker pods. When rendering such reports, the pod may restart due to hitting resource limits, such as memory and CPU throttling. It is essential to understand the minimum resource requirements, optimize resource allocation, and adhere to best practices in report design to avoid failures.

## Solution

To render large reports effectively, follow these steps:

1. **Ensure Sufficient Resources**  
   - Allocate a dual-core processor and at least 2 GB of RAM for basic report processing.  
   - For reports with hundreds of thousands of records, increase memory and CPU allocations based on report complexity and export format.

1. **Optimize Resource Allocation in Pods**  
   - Review container orchestration settings and increase memory and CPU limits for the pod running the reporting microservice.  
   - Avoid resource throttling by setting appropriate limits in Kubernetes or other container orchestration platforms.

1. **Follow Best Practices for Report Design**  
   - Limit the data processed and displayed in a single report.  
   - Use paging, filtering, and aggregation to reduce the dataset size.  
   - Split data into smaller batches for export if needed.

1. **Consider Alternatives for Raw Data Export**  
   - Telerik Reporting is optimized for presenting aggregated data rather than exporting massive datasets.  
   - Use dedicated ETL or export tools for raw data export if required.

### Recommended Resources for Optimization
* [Performance Factors at a Glanceg]({%slug telerikreporting/designing-reports/performance-considerations%})
* [Filtering Data at a Glance]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%})
* [Best Practices for Data Retrieval](https://www.telerik.com/blogs/best-practices-data-retrieval-telerik-reporting)

By allocating sufficient resources and following these optimization practices, you can reduce pod restarts and improve report rendering reliability.

## See Also

* [Telerik Reporting Overview]({%slug telerikreporting/welcome-to-telerik-reporting!%})
* [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%})
