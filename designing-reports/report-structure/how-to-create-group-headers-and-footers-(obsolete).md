---
title: How to Create Group Headers and Footers (obsolete)
page_title: How to Create Group Headers and Footers (obsolete) | for Telerik Reporting Documentation
description: How to Create Group Headers and Footers (obsolete)
slug: telerikreporting/designing-reports/report-structure/how-to-create-group-headers-and-footers-(obsolete)
tags: how,to,create,group,headers,and,footers,(obsolete)
published: False
position: 3
---

# How to Create Group Headers and Footers (obsolete)



Each Report Group has a Group Header and a Group Footer section associated with it. How to create a Report Group is explained in [How-To: Add groups to Report]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%}) article.

## Group Header/Footer Specific Properties

*  __PrintOnEveryPage__  : Set to __True__  to repeat the group header at the top of each page if the details of the group extend across multiple pages.

## Report Group Properties

To set the following group properties you have to select a group from the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%})

*  __Filters: __  This property determines which groups will display. This level of filtering occurs before filtering for the report as a whole occurs. The filters for the group are applied to the grouping data, not the report data itself. Filter data for the group using the __Filters__  property ellipses to invoke the[Edit Filter Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-filter-dialog%}). See[Filtering Report Data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/filter-rules%})

*  __GroupKeepTogether__  : Set to __FirstDetail__  to ensure that the group header and the first detail record are printed on the same page of output, or __All__  to ensure that the entire group is printed on the same page of output. If there is not enough space on the current page, then rendering will skip to the top of the next page.

*  __Grouping__  : The grouping property controls how groups of data are broken out in the report. Click the ellipsis for this property to invoke the[Edit Grouping Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-grouping-dialog%})

*  __Sorting__  : This property controls the sorting order for the grouping data, not the report data. This level of sorting occurs before the sorting for the report as a whole. For example, Click the ellipsis button for this property to open the __Edit Sorting__  dialog. Click __Add__  to add a new sort expression. For each SortExpression, set the __FieldName__  property to the name of the field by which this group should sort records, and select either __Ascending__  or a __Descending__  sort order.  

  ![](images/groupProperties.png) 
      

# See Also
 * [GroupHeaderSection](/reporting/api/Telerik.Reporting.GroupHeaderSection)  * [GroupFooterSection](/reporting/api/Telerik.Reporting.GroupFooterSection)  * [Group](/reporting/api/Telerik.Reporting.Group) 
