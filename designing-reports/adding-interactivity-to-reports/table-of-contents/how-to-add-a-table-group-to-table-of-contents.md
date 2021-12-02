---
title: How to Add a Table Group to Table of Contents
page_title: How to Add a Table Group to Table of Contents | for Telerik Reporting Documentation
description: How to Add a Table Group to Table of Contents
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/how-to-add-a-table-group-to-table-of-contents
tags: how,to,add,a,table,group,to,table,of,contents
published: True
position: 2
---

# How to Add a Table Group to Table of Contents



You can add a table of contents to the report and click on entries in the table of contents to jump         to specific areas within a report.       

## Adding a table group to table of contents

1. In __Design view__ , right click outside the report sections, select View and open up the               [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}).             

1. Select a  [Table](/reporting/api/Telerik.Reporting.Table) ,                [Crosstab](/reporting/api/Telerik.Reporting.Crosstab)                or  [List](/reporting/api/Telerik.Reporting.List)  report item, so the __Group Explorer__  shows the respective groups.             

1. Select a group to which you want to add to the table of contents, right click on it and select               __Group Properties__ . The properties for the selected group appear in the __Edit Table Group__  dialog.             

1. In the  [TocText](/reporting/api/Telerik.Reporting.TableGroup#Telerik_Reporting_TableGroup_TocText)  property,               type the text that you want to appear in the table of contents. Alternatively, click the ellipsis to open the __Expression__                dialog box to specify an expression that evaluates to a text.               Typically for a group, the expression you type should match the group expression.             

1. Click __OK__ .             

1. Repeat steps 1-5 for every group that you want to appear in the table of contents.

1. Enable the table of contents section from the report's context menu.

1. Run the report - the table of contents displays the group values. Click any TOC entry to jump to the report page with that group instance.

# See Also


 * [Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/overview%})
