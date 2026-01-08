---
title: Creating Reusable Headers and Footers
page_title: Creating Reusable Headers and Footers
description: Learn how to use SubReports in the Web Report Designer to create reusable headers and footers.
slug: creating-reusable-headers-and-footers
tags: web, report, design, components, subreport, header, footer, reuse
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
position: 4
---

# Creating Reusable Headers and Footers with SubReport

The SubReport item is perfect for creating reusable report components that can be embedded in larger reports later.

Here's a step-by-step tutorial for creating a reusable part of a report (for example, header and footer) using a SubReport:

<iframe width="560" height="315" src="https://www.youtube.com/embed/sMgP2iNkvvM?si=A7g7W7pBGyzlEt9y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Creating the Header Report

1. Create a new report (for example, `HeaderReport.trdp`).

1. Remove the default page header and footer.

1. Add elements like company logos and report titles in the Detail section.

1. Preview and save this report as a standalone file. This will serve as your reusable header part of a bigger report.

## Creating the Footer Report

1. Create a new report (for example, `FooterReport.trdp`).

1. Remove the default page header and footer.

1. Add elements like information text or any other meaningful content to the Detail section of a report.

1. Preview and save this report as a standalone file. This will serve as your reusable footer part of a bigger report.

## Adding SubReports to Your Main Report

1. Create a new report that will serve as the main report.

1. Remove the default page header and page footer.

1. Add a report header and a report footer.

1. Select the Report Header section and add a SubReport item.

1. Navigate to the **INNER REPORT** section and select the **UriReportSource** option.

1. For the **Uri** field, select the `HeaderReport.trdp`.

1. Select the Report Footer section again and add another SubReport item.

1. Navigate to the **INNER REPORT** section and select the **UriReportSource** option.

1. For the **Uri** field, select the `FooterReport.trdp`.

1. Select the Details section and add a TextBox item with a sample text.

1. Preview the report which contains reusable header and footer subreports.

Thus, you can create separate reports that serve as standalone report parts and can be reused in multiple reports according to the specific requirements. 

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Data Sources]({%slug web-report-designer-user-guide-components-data-sources%})
