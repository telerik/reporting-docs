---
title: Avoid Blank Pages in PrintPreview
description: Avoid unwanted blank pages that can appear in the rendered report preview
page_title: Remove Blank Pages from PrintPreview
type: troubleshooting
slug: problem-telerik-reporting-renders-blank-pages
res_type: kb
category: knowledge-base
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

In PrintPreview mode, the report engine might render blank pages. Note that the pages are not actually blank. Rather there is some content that cannot fit on the current page and is carried over to the next page. There are several cases when this happens:

- Report Width is greater than than the available page space (Page Width - Left Margin - Right Margin).
- There is a sub-report, which contains a report that is too wide, and while at design-time that is not obvious, at run-time it might cause the carry-over to occur.
- There is a report item with boundaries going out to the right from its parent section.
- There is an error in the report, where the error message is rendered in a red box, which goes beyond the set size of the report.
- The layout uses a Table/List/Crosstab item, and the item has a row higher than the available space in the physical page. **This case is valid only for reports using Telerik Reporting version number smaller than R2 2016 (10.1.16.504)**.

Since often the background color (white in most cases) of the item that is carried over to the next page is the same as the background of the report/sections the page seems to be blank.

## Solution

Note that Telerik Reporting engine skips the generated blank pages by default, after version **R1 2021 SP1 (15.0.21.224)**. Use the property <a href="/api/telerik.reporting.report#Telerik_Reporting_Report_SkipBlankPages" target="_blank">Report.SkipBlankPages</a> to control this behavior.

To see which items are causing the problem, simply change their background to a different, more contrasting color and run the report in PrintPreview mode. The rendered report will immediately give you a clue about the items which are at fault. Then simply try making the report items smaller until the "blank" pages disappear or decrease the report width. You can use are the report's <a href="/api/telerik.reporting.drawing.pagesettings#properties" target="_blank">PageSettings properties</a> to change the physical page size.

We would advise creating the items so that they do not overlay other items, section ends, etc. because the processing engine might produce unexpected results. Always leave a little space (a couple of pixels/points) around report items to prevent unexpected behavior.

Red error message boxes can be avoided by handling errors on report processing in the report's <a href="/api/telerik.reporting.report" target="_blank">Error event</a>.

Blank pages can appear because a section has its **KeepTogether** property set to **true** and the rendering engine attempts to render content on a single page (it is later that it "realizes" that this is impossible).
For example, if the first page contains the ReportHeader or another section, the rendering engine tries to render the detail on the second page, which has more available space.
Setting the **KeepTogether** property of the Section to **false** allows page breaks in the section. Reporting items and sections have KeepTogether properties, and groups have GroupKeepTogether property.

In the case of a layout with a Table/List/Crosstab item, the paging mechanism does not apply page breaks in a row's content. Improvements for such layouts are applied in R2 2016. In previous versions, you can replace the Table item with TextBox items or a SubReport item loading external report to achieve a similar layout.

## See Also

- [Understanding Pagination](/designing-reports-page-layout-rendering-understanding-pagination)
