---
title: Troubleshoot Report Definitions
page_title: Tips for troubleshooting your reports
description: "Learn how to troubleshoot report structure problems when working with the Telerik Reporting Report Designer tools."
slug: troubleshoot-report-definition-tips
tags: telerik, reporting, creating, designing, reports, troubleshoot, tips
published: True
position: 20
reportingArea: General
---

# Tips for Troubleshooting Report Design

## Fixing Report Designer Warnings

Ensure there are no yellow triangle warnings shown in design time when editing your report definitions in the report designers. Hover the corresponding warning triangle to check the exact problem described in the tooltip.

For example, the following image shows the tooltip of the warning stating that "Report is too wide to horizontally fit on a single page.":
![Warning triangle in the Standalone Report Designer with the tooltip explaining that the report is too wide.](images/warning-triangle-standalone-designer.png)

To fix the above warning, you may:
*Decrease the Report `Width`
*Increase the Report Page Width in one of the following manners:
	+ Change the Report [`PageSettings`](/api/telerik.reporting.drawing.pagesettings) > `PaperKind` to a bigger one that will accommodate the content;
	+ Inrease the Report [`PageSettings`](/api/telerik.reporting.drawing.pagesettings) > `PaperSize` > `Width` for `Custom` paper kind;
	+ Decrease the Report [`PageSettings`](/api/telerik.reporting.drawing.pagesettings) > `Margins` > `Left` and/or `Right`.

Check for [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) and [Conditional Formatting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting%}) that may be altering the report layout only at runtime.

## Troubleshooting Report Layout

Use different __Styles__, for example, `Background Color` and `Borders`, to easily distinguish between report sections and items and identify which one is responsible for the observed inconsistency in the report layout. For complex reports, with many nested items, start by coloring the top-level containers first, and then dig deeper by coloring that container's nested items as well, until you find the item responsible for the issues. 

### Unexpected Page Breaks

* Page Break Properties:
	Inspect the [Report Sections]({%slug report_structure_groups_sections%}#report-sections) for the `PageBreak` property and [Report Groups]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%}) and the [Table Groups]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item%}) for the `GroupPageBreak` property settings.

* Keep Together Settings:
	Most of the Report Items and Sections expose the property `KeepTogether`. The Groups expose `GroupKeepTogether`.
	When the property value is `True`, the Reporting Engine tries to render the entire item/section/group content on the same page. If it doesn't fit, it attempts to move the whole content to a new page. When the content fits on the new page, the previous page may remain partly blank. If this is not the desired outcome, ensure the corresponding report items/sections/groups have their keep together values set to false.

* Horizontal Pagination:
	Generally, the [Report items]({%slug telerikreporting/designing-reports/report-structure/overview%}) grow only vertically to accommodate larger content. Only [Crosstabs and Tables/Lists with column gouping]({%slug table_template_items%}), _rotated Tables_ and [SubReports]({%slug telerikreporting/designing-reports/report-structure/subreport%}) may grow horizontally. In case of unexpected horizontal page breaks, inspect the items' runtime content.

### Report Items Order in Accessibility

When enabling the [Accessibility feature]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/accessibility%}) of your reports, the items will be read according to their logical item order. This order may be seen and changed in the [Report Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-explorer%})] in the [report designers]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}). 

### Expression Values

Use a temporary `TextBox` in the same [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) or [report section]({%slug report_structure_groups_sections%}#report-sections), ensuring the same [scope]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope-%}) to display the actually evaluated content in the [Binding]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}), [Conditional Formatting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting%}) or other [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%}).

## Type Reports in Visual Studio Report Designer

The [Visual Studio Report Designer for .NET Framework]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) automatically generates the code for the CS/VB reports and stores it in the `InitializeComponent` method of the file `_ReportName_.designer.cs/_ReportName_.Designer.vb`. Check the file for errors if the report cannot be opened in the report designer.


## See Also

* [Understanding Pagination]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-pagination%})
* [Interactive and Print Layouts]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%})
* [Properties and Settings of the Report Definition]({%slug report_item_properties_settings%})
