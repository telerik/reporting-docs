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

Out of the box, Telerik Reporting offers multi-column reports with data flow - down the page and then across. How to set up this report layout is elaborated in the <a href="../advanced-creating-multi-column-reports" target="_blank">How to: Create a Multi-Column Report</a> help article. However, in some cases you may need a multi-column report layout with data flow across the page and then down.

Due to the data driven nature of Telerik Reporting this can be easily achieved with our <a href="{% slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview %}" target="_blank">Table/Crosstab/List</a> item and indexed data 
   
## Solution    
 
- Add a List item to your report definition;

- Set the List.DataSource according to your datasource. For more info see: <a href="../designing-reports-connecting-data-to-report" target="_blank">Connecting to Data</a> help articles;

- Open the <a href="../ui-group-explorer" target="_blank">Group Explorer</a> in extended mode;

- Set the (Detail) row group Grouping expression to:  
 *=Fields.MyDataIndex/3*  

    Where the number should equal the number of expected columns.
- Set the (Static) column group Grouping expression to:  
 *=Fields.MyDataIndex%3*  

    Where the number should equal the number of expected columns.
- Add the necessary items to the List item's Panel;

- Preview the report.  
 
> The *MyDataIndex* field should start at 0.
 
## Additional resources

[Download a sample report](resources/MultiColumnReport.zip).

