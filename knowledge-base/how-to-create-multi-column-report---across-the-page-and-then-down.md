---
title: How to Create a Multi-Column Report - Across the Page and Then Down
description: How to Create a Report Layout with Multiple Columns - Across the Page and Then Down.
type: how-to
page_title: How to Set Up a Multi-Column Report - Across the Page and Then Down
slug: how-to-create-multi-column-report---across-the-page-and-then-down
res_type: kb
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

Out of the box, Telerik Reporting offers multi-column reports with data flow - down the page and then across. How to set up this report layout is elaborated in the help article [How to: Create a Multi-Column Report]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-multi-column-report%}). However, in some cases you may need a multi-column report layout with data flow across the page and then down.

Due to the data driven nature of Telerik Reporting this can be easily achieved with our [Table/Crosstab/List]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) item and indexed data. 
   
## Solution    
 
- Add a List item to your report definition;

- Set the List.DataSource according to your datasource. For more info see: [Connecting to Data]({%slug telerikreporting/designing-reports/connecting-to-data/overview%}) help articles;

- Open the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) in extended mode;

- Set the (Detail) row group Grouping expression to: `=Fields.MyDataIndex/3`, where the number (i.e. 3) should equal the number of expected columns;

- Set the (Static) column group Grouping expression to: `=Fields.MyDataIndex%3`, where the number (i.e. 3) should equal the number of expected columns;

- Add the necessary items to the List item's Panel;

- Preview the report.  
 
> The *MyDataIndex* field should start at 0.
 
## Additional resources

[Download a sample report](resources/MultiColumnReport.zip)
