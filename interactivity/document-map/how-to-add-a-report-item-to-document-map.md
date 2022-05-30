---
title: How to Add a Report Item to Document Map
page_title: How to Add a Report Item to Document Map 
description: How to Add a Report Item to Document Map
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/document-map/how-to-add-a-report-item-to-document-map
tags: how,to,add,a,report,item,to,document,map
published: True
position: 1
---

# How to Add a Report Item to Document Map

You can add a document map, which acts like a table of contents. A user can click items in the document map to jump to areas within a report.

## Adding a report item to document map

1. In __Design view__, make sure the Properties pane is visible. Select the report item that you want to add to the document map. In the Properties
	pane, type the text that you want to appear in the document map in the [DocumentMapText](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_DocumentMapText) property, or enter 
	an expression that evaluates to a text. For example, type __Product Catalog__. If the [DocumentMapText](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_DocumentMapText) does not evaluate to
    unique value, then a unique value should be set to the [BookmarkId](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_BookmarkId) property.

1. Repeat step 1 for every report item that you want to appear in the document map.

1. Click __Preview__. The report runs and the document map displays the text you created. Click any link to jump to the report page and the exact location of that item. 		

>note Report items positioned in the Page Header/Page Footer section of the report cannot be used to create nodes in the document map. Setting the [DocumentMapText](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_DocumentMapText) property of such item will have no effect.           


## Hiding the document map when you view a report

You can run the report without initially displaying the document map by setting the __ReportViewer.DocumentMapVisible__ property to false (true by default), and then click the Show/Hide button on the report viewer toolbar to toggle its display whenever needed. 		

If you want to restrict the user from showing/hiding the document map, you can hide the corresponding button by altering the viewer's __ShowDocumentMapButton__ (true by default) property.

>note The order of items in the document map is according to the order of the report items in the report items' collection, and not by the order in which you have added [DocumentMapText](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_DocumentMapText) to items.


# See Also

 * [Document Map Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/document-map/overview%})
 
 * [How to Add a Report group to Document Map]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/document-map/how-to-add-a-report-group-to-document-map%}) 

 * [How to Add a Table group to Document Map]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/document-map/how-to-add-a-table-group-to-document-map%}) 