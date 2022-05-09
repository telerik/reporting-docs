---
title: Document Map Overview
page_title: Document Map Overview
description: Document Map Overview
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/document-map/overview
tags: overview
published: True
position: 0
---

# Document Map Overview


A document map provides a set of navigational links to report items in the rendered report. A user can click links in the document map to jump to the report page that displays that item.       

>note The Page Header section is skipped when jumping to a report page using a document map navigational link i.e., the report viewer/designer preview will always be positioned after the Page Header section.           


The document map is also used to provide a set of navigational links to reports in a [Report Book]({%slug telerikreporting/designing-reports/report-book/overview%}).       

  

  ![](images/SilverlightViewer1.png)

The Document map is defined by setting the  [DocumentMapText](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_DocumentMapText)  and [BookmarkId](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_BookmarkId)  properties of any report item/group. The __BookmarkID__ property should be unique for the whole  [IReportDocument](/reporting/api/Telerik.Reporting.IReportDocument). If __BookmarkID__  is not set, then the Value of __DocumentMapText__ is taken into account. Valid values are static text, expression, or text with embedded expressions. The resulting text will be displayed in the document map tree. 		

To form hierarchical structure of the document map, you may set the  [DocumentMapText](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_DocumentMapText)  property of the report groups, the CrossTab/Table groups, the Detail section and the Report (useful for SubReports). For example nested groups will create nested nodes in the tree. Each of the produced nodes will navigate to the most appropriate page and location in the rendered report. For example bookmark of a report group will navigate to the group header (or first detail inside the group if header is not visible).

To add a node in the document map pointing to a report item, you may use the [DocumentMapText](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_DocumentMapText)  property of that item. Note that all report items (except the Detail section and the Report itself) produce leaf nodes in the document map tree. For example if you have a Panel item with TextBox item inside, and set the DocumentMapText property of both, the resulting nodes will be added as leaf siblings in the document map.

>note Report items positioned in the Page Header/Page Footer section of the report cannot be used to create nodes in the document map. Setting the  [DocumentMapText](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_DocumentMapText)  property of such item will have no effect.       


The order of items in the document map is according to the order of the report items in the report items' collection, and not by the order in which you have added  [DocumentMapText](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_DocumentMapText)  to items.

>note The document map is intended for use in the  __Designer Preview__  and in all  __ReportViewers__. From the supported rendering extensions, only the PDF renders a document map as Bookmarks pane. All other rendering extensions ignore document maps.  

