---
title: Creating Reusable Report Headers and Footers
page_title: Creating Reusable Report Headers and Footers
description: Learn how to use SubReports in the Web Report Designer to create reusable headers and footers.
slug: creating-reusable-headers-and-footers
tags: web, report, design, components, subreport, header, footer, reuse
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
components: [wrdhtml5, wrdblazorwrapper, general]
position: 4
---

# Creating Reusable Report Headers and Footers with SubReport

The SubReport item is perfect for creating reusable report components that can be embedded in larger reports later. It can be useful for creating, for example, **report** or **group** headers and footers.

Here's a step-by-step tutorial for creating a reusable part of a report (for example, header and footer) using a SubReport:

<iframe width="560" height="315" src="https://www.youtube.com/embed/BEfNQsuqzME?si=hSHQuYQ1IPvTYopW" title="Creating reusable report headers and footers with SubReport" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Creating the Header Report

1. Create a new report (for example, `HeaderReport.trdp`).

1. Remove the default **page** header and footer.

1. Add elements like company logos and report titles in the Detail section.

1. Preview and save this report as a standalone file. This will serve as your reusable header part of a bigger report.

## Creating the Footer Report

1. Create a new report (for example, `FooterReport.trdp`).

1. Remove the default **page** header and footer.

1. Add elements like information text or any other meaningful content to the Detail section of a report.

1. Preview and save this report as a standalone file. This will serve as your reusable footer part of a bigger report.

## Adding SubReports to Your Main Report

1. Create a new report that will serve as the main report.

1. Remove the default **page** header and **page** footer if not needed.

1. Add a **report** header and a **report** footer.

1. Select the Report Header section and add a SubReport item.

1. Navigate to the **INNER REPORT** section and select the **UriReportSource** option.

1. For the **Uri** field, select the `HeaderReport.trdp`.

1. Select the Report Footer section again and add another SubReport item.

1. Navigate to the **INNER REPORT** section and select the **UriReportSource** option.

1. For the **Uri** field, select the `FooterReport.trdp`.

1. Select the Details section and add a TextBox item with a sample text.

1. Preview the report which contains reusable header and footer subreports.

Thus, you can create separate reports that serve as standalone report parts and can be reused in multiple reports according to the specific requirements. 

## Passing Data to SubReports

Instead of using fixed data in the report headers/footers, it is possible to pass a title (or any text) from a main report to a TextBox in a SubReport, using the parameter‑passing mechanism. The above example can be further extended by replacing the "Telerik Reporting" text in the HeaderReport.trdp with a value coming from the main report. 

Here are the steps to pass a title from the main report to a TextBox in the SubReport:

1. Define a parameter in the SubReport:

    1. Open `HeaderReport.trdp` in the Report Designer.

    1. Select the report and expand **Data** > **Report parameters**.

        <img style="border: 1px solid gray;" src="images/subreport-title-report-parameter.png" alt="HeaderReport properties with the Report parameters collection expanded and no items added." />

    1. Add a new parameter with these settings:

        * **Name**: `title_parameter`
        * **Type**: `String`
        * **Allow null**: selected (optional)
        * **Allow blank** and **Mergeable**: selected, as shown in the example
        * **Auto-refresh**, **Multi-value**, and **Visible**: cleared
        * **Text** and **Value**: empty

        Select **Save** to add the parameter.

        <img style="border: 1px solid gray;" src="images/add-title-report-parameter.png" alt="Add New Item dialog for the title_parameter report parameter." />

1. Bind a TextBox in the SubReport to that parameter:

    1. Select the TextBox inside `HeaderReport.trdp` where the title should appear.

    1. Set its **Value** to the following expression:

        ```text
        =Parameters.title_parameter.Value
        ```

        The TextBox displays the title passed from the main report.

1. Map the main report value to the SubReport parameter:

    1. Open the main report and select the SubReport header item.

    1. Expand **Inner Report** > **Report source** > **Parameters**. Keep **Type** set to `UriReportSource` and **Uri** set to `HeaderReport.trdp`.

        <img style="border: 1px solid gray;" src="images/add-title-report-paramete-in-main-report.png" alt="Header SubReport properties with the report source Parameters collection expanded." />

    1. Add a parameter with **Name** set to `title_parameter` and **Value** set to `Your custom title`, then select **Save**.

        <img style="border: 1px solid gray;" src="images/custom-title.png" alt="Add New Item dialog mapping title_parameter to a custom title." />

1. Preview the report. The header now displays `Your custom title` above the main report's sample text, `My First Report`.

    <img style="border: 1px solid gray;" src="images/preview-custom-title.png" alt="Main report preview with the parameter-driven header above the report content and reusable footer." />


## See Also

* [Web Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview)
* [Data Sources](slug:web-report-designer-user-guide-components-data-sources)
* [Report Sections](slug:user-guide/components/report-sections)
