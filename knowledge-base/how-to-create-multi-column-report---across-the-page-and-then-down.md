---
title: How to Create Multi-Column Report - Across the Page and Then Down
description: How to Create Multi-Column Report - Across the Page and Then Down.
type: how-to
page_title: How to Create Multi-Column Report - Across the Page and Then Down
slug: how-to-create-multi-column-report---across-the-page-and-then-down
res_type: kb
---
## Description
Out of the box Telerik Reporting offers multi-column reports with data flow - down the page and then across. How to set up this report layout is elaborated in the <a href="../advanced-creating-multi-column-reports" target="_blank">How to: Create a Multi-Column Report</a> help article. However in some cases you may need a multi-column report layout with data flow across the page and then down.   
   
## Solution  
 Due to the data driven nature of Telerik Reporting this can be easily achieved with our <a href="../table-working-with-table-cross-table-list-items" target="_blank">Table/Crosstab/List</a> item and indexed data as elaborated in the following steps:  
 
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
 
 > **Note**
> <br />
> The *MyDataIndex* field should start at 0.
 
 ## Additional resources
[Download a sample report](resources/MultiColumnReport.zip).


