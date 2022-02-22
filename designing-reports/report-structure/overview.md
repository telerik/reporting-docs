---
title: Report Structure Overview
page_title: Overview 
description: Overview
slug: telerikreporting/designing-reports/report-structure/overview
tags: overview
published: True
position: 0
---

# Report Structure Overview

This article describes the structure of a Telerik Report. 

## Report Structure

The design of a report is divided into sections and you can open your report in [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) or [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) to see its sections. To create more functional reports, you need to understand how each section works. For example, the section in which you choose to place a data bound item determines how Telerik Reporting calculates the results. 

Report sections divide the report vertically. Depending on their type (e.g. Page sections, Group sections, etc.) they appear on specific places in the report document and the report items they contain are processed and rendered differently. 

A report can be bound to data. To create a data bound report you need to assign the Report or its nested [Data Item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) a data source. Then you should specify [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) for the items within the report or corresponding data item where to display the actual data. To learn more about creating a data bound report, see the [Connecting to Data]({%slug telerikreporting/designing-reports/connecting-to-data/overview%}) and [Using Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%}) sections. 

The styling of the report items may be reused in stylesheets. If a report uses stylesheets, they can be saved to XML file and shared between multiple reports in your application (for more information, see [Exporting and Reusing Style Sheets]({%slug telerikreporting/designing-reports/styling-reports/exporting-and-reusing-style-sheets%})). 

### Report Sections

The __Telerik Report__ consists of several different sections that may contain report items. Each report section represents specific area on the report page, and defines how to render the report items that belong to it. Every section is an instance of the  [ReportSectionBase](/reporting/api/Telerik.Reporting.ReportSectionBase) class. The __Height__ property defines the space that a section occupies on the page. Other specific properties such as __PrintOnFirstPage__ and __PrintOnLastPage__ define the particular section's behavior. 

When a new Telerik Report is added to a project, it is initially divided into three sections - __PageHeader__, __Detail__ and __PageFooter__. The section type specifies how the items inside will be rendered, their rendering order and how many times they will be rendered when the report is data bound. 

The following table presents a summary of the section types and their usage (in the default order of appearance in the report document):

<style>
table th:first-of-type {
    width: 20%;
}
table th:nth-of-type(2) {
    width: 80%;
}
</style>

| Section Type | Description |
| ------ | ------ |
| __Page Header__ |This section is printed at the top of every page. For example, you can use the page header to repeat the report title on every page. Since the paging of a report strongly depends on the format it is rendered to, this section and its items are processed by the corresponding rendering extension after the report data has been processed, which has the following implications:<ul><li> The built-in [PageNumber and PageCount objects]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}) (which contain the current page number and the total report pages count) can be used in this section. All [Page Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/page-functions%}) can also be used in this section.</li><li> It is possible to suppress the printing of the Page Header section on the first (set *PrintOnFirstPage*) and last page of a report (set *PrintOnLastPage*), or hide it using [Conditional Formatting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting%}). In this case the space taken up would be used from the rest of the report content. It is not possible to use the expression __"= (PageNumber = PageCount)"__ to hide the PageHeader or PageFooter on the last page. This is a known limitation due to the fact that the resulting page count depends on the visibility of the PageHeader and PageFooter sections as this modifies the available space for the rest of the report content. In the same time, the above expression sets the visibility of the page section(s) to depend on the page count. This leads to uncertainty and the page count cannot be properly estimated.</li><li> The Height of the section may be changed runtime with [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}). Our recommendation is to set the default height of the section to the maximal expected one. Then, you may reduce the height of each Page section with a proper Binding. The reason behind this is to assure that the available height of the page after rendering the Page Header and Footer will be positive, allowing for detailed content to be placed on the page. If the Page Header and Page Footer combined height is bigger than the page height, the Page sections will be ignored and only the content will be rendered. The [behavior of the KeepTogether property]({%slug telerikreporting/designing-reports/report-structure/design-considerations-for-report-item-layout%}#Pagination1) may also change due to Page sections growing more than expected. Setting the Page section height with Binding to a larger than the default value may result in other unpredictable behavior.The height of the Page section should not depend on the data rendered on the page. The logic behind is that the Page Section height is estimated prior to evaluating the corresponding page data as the Reporting engine needs to calculate the available space on each page before rendering the data on it.</li><li> It is not possible to use [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) in this section.</li><li> [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) in this section are evaluated against the report [Data Scope]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope-%}) defined by the data source of the report after the data has been filtered. In order to work with data from the current page only you have to use the [PageExec]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/page-functions%}) function or the other Page functions with specified scope.</li></ul>|
| __Table of Contents (TOC)__ |This section provides a set of navigational links to report items and displays the page numbers where they can be found. The user can click the entries in the table of contents to navigate to the report page which displays that item. The TOC section can be displayed before or after the Report Header/Report Footer section based on the user preferences. For more information see [Table of Contents]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/overview%}).|
| __Report Header__ |This section is printed just once, at the beginning of the report. If there is Page Header on the first page, the Report Header will be rendered after it. If there is TOC section, you may specify its position with respect to Report Header (e.g. Before or After). Use the report header for information that might normally appear on a cover page, such as a logo, a title, or a date. In the Report Header section all data fields must be aggregated, even if the data source returns only one row. Typically you should use the FIRST() function for character and date data and the SUM() function for numeric data. When you place a databound report item that uses an aggregate function in the report header, it is calculated for the entire report data.|
| __Group Header__ |This section is printed at the beginning of each new group of records. Use the group header to print the group name. For example, in a report that is grouped by product, use the group header to print the product name. In the Group Header section all data fields must be aggregated, even if the data source returns only one row. Typically you should use the FIRST() function for character and date data and SUM() function for numeric data. When you place a databound report item that uses an aggregate function in the Group Header, it is calculated for the entire group data.|
| __Detail__ |This section is printed once for every row in the data source. This is where you place the report items that constitute the main body of the report. The detailed information will be displayed in this section.|
| __Group Footer__ |This section is printed at the end of each group of records. Use a group footer to print summary information for a group. Similar to the Group Header section, you should always use aggregate functions for the databound items that are calculated for the group data.|
| __Report Footer__ |This section is printed just once, at the end of the report. If there is Page Footer on the last page, the Report Footer will be rendered before it. If there is TOC section, you may specify its position with respect to Report Footer (e.g. Before or After). Use the report footer to print report totals or other summary information for the entire report. Similar to the Report Header section, you should always use aggregate functions for the databound items that are calculated for the entire report data.|
| __Page Footer__ |This section is printed at the end of every page. Use a page footer to print page numbers or per-page information. This section and its items are processed by the corresponding rendering extension after the report data has been processed. Therefore, the same implications listed for the Page Header apply also to the Page Footer section.It is possible to hide this section for particular pages using [Conditional Formatting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting%}) expression over the __Style.Visible__ property. For example, you may hide it on all even pages. To hide it on first and/or last pages there are dedicated Boolean properties called __PrintOnFirstPage__ and __PrintOnLastPage__. Hiding the section leads to freeing page space for the rest of the report content. Keep in mind that setting the PrintOnLastPage to true may lead to unintuitive pagination of the section preceding the last PageFooter. This occurs because determining the last page number and hiding the last PageFooter are interdependent when the last non-PageFooter section would fit in the space regularly occupied from the PageFooter. For example, this may be observed when replacing the last PageFooter section with a ReportFooter section.|


### Report Groups

Report Groups allow you to separate groups of data visually and to display introductory and summary data for each group. Report groups provide logical sections of data within the report while the group header and footer sections provide visual representation of the group boundaries. For example, you can group sales by date shipped and calculate the total amount of sales for each day. 

Usually, the data that identifies the group will be displayed in a separate section at the beginning of the group, e.g. a group header. The group footer is generally used to summarize the group data in a separate section at the end of the group. 

The data within the report can be grouped by fields and expressions. Report groups are defined by adding __Group__ objects to the report’s __Groups__ collection. Report groups are always nested according to the order in the Groups collection. To display summary group data one should use the __GroupHeaderSection__ and __GroupFooterSection__ that appear once for each group member at the beginning and the end, respectively. The __DetailSection__ displays report detail data and always appears inside the innermost group. 

### Report Items

Report items are used in the report depending on the data that should be displayed e.g. [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%}) item for static or data bound text, [PictureBox]({%slug telerikreporting/designing-reports/report-structure/picturebox%}) for displaying images, [Barcode]({%slug telerikreporting/designing-reports/report-structure/barcode/overview%}) for showing barcode in a label report etc. Every report item is an instance of the [ReportItemBase](/reporting/api/Telerik.Reporting.ReportItemBase) class. Report items can reside inside report sections or containers (e.g. [Panel]({%slug telerikreporting/designing-reports/report-structure/panel%}) or [Table/Crosstab/List]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) items). 


# See Also

* [How to Layout Report Items]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-layout-report-items%})

* [How to Add groups to Report]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%})

* [How to Add/Remove Report Header & Footer Sections]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-report-header---footer-sections%})

* [How to Add/Remove Page Header & Footer Sections]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-page-header---footer-sections%})
