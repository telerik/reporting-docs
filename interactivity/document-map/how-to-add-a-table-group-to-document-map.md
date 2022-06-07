---
title: How to Add a Table group to Document Map
page_title: How to Add a Table group to Document Map 
description: How to Add a Table group to Document Map
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/document-map/how-to-add-a-table-group-to-document-map
tags: how,to,add,a,table,group,to,document,map
published: True
position: 3
---

# How to Add a Table group to Document Map

A user can click items in the document map to jump to areas within a report.

## Adding a Table group to document map

1. In __Design view__, right click outside the report sections, select View and open up the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}).

1. Select a [Table](/reporting/api/Telerik.Reporting.Table), [Crosstab](/reporting/api/Telerik.Reporting.Crosstab) or [List](/reporting/api/Telerik.Reporting.List) report item, so the __Group Explorer__  shows the respective groups.

1. Select a group to which you want to add a document map, right click on it and select __Group Properties__. The properties for the selected group appear in the __Edit Table Group__ dialog.

1. In the [DocumentMapText](/reporting/api/Telerik.Reporting.TableGroup#Telerik_Reporting_TableGroup_DocumentMapText) property, 
	type the text that you want to appear in the document map. Alternatively, click the ellipsis to open the __Expression__ dialog box to specify an expression that evaluates to a text.
	Typically for a group, the expression you type should match the group expression.

1. Click __OK__.

1. Repeat steps 1-4 for every group that you want to appear in the document map.

1. Run the report - the document map displays the group values. Click any document map node to jump to the report page with that item.


## See Also

 * [Document Map Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/document-map/overview%})
 
 * [How to Add a Report Item to Document Map]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/document-map/how-to-add-a-report-item-to-document-map%}) 

 * [How to Add a Report group to Document Map]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/document-map/how-to-add-a-report-group-to-document-map%}) 