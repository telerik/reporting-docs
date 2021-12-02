---
title: Understanding Report Sections (obsolete)
page_title: Understanding Report Sections (obsolete) | for Telerik Reporting Documentation
description: Understanding Report Sections (obsolete)
slug: telerikreporting/designing-reports/report-structure/understanding-report-sections-(obsolete)
tags: understanding,report,sections,(obsolete)
published: False
position: 1
---

# Understanding Report Sections (obsolete)



## 

The following table presents a summary of the section types and their usage: 		


| Section Type | Description |
| ------ | ------ |
| __Page Header__ |This section is printed at the top of every page. For example, use the page header to repeat <br/>	the report title on every page. Since the paging of a report strongly depends on the format it is rendered to, this section and<br/>	its items are processed by the corresponding rendering extension after the report data has been processed. At this moment the <br/>	report data source is not available anymore and due to this you can use the built-in PageNumber and PageCount objects <br/>	(which contain the current page number and the total report pages count) only in this section. It is possible to suppress the <br/>	printing of the Page Header section on the first and last page of a report, but the space taken up would always be reserved no <br/>	matter whether it is visible.|
| __Report Header__ |This section is printed just once, at the beginning of the report. Use the report header for information that might <br/>   	normally appear on a cover page, such as a logo, a title, or a date. In the Report Header section all data fields must be <br/>   	aggregated, even if the data source returns only one row. Typically you should use the FIRST() function for character and <br/>   	date data and the SUM() function for numeric data. When you place a databound report item that uses an aggregate function in <br/>   	the report header, it is calculated for the entire report data.|
| __Group Header__ |This section is printed at the beginning of each new group of records. Use the group header to print the group name. <br/>   	For example, in a report that is grouped by product, use the group header to print the product name. In the Group Header <br/>   	section all data fields must be aggregated, even if the data source returns only one row. Typically you should use the <br/>   	FIRST() function for character and date data and SUM() function for numeric data. When you place a databound report item that<br/>   	uses an aggregate function in the Group Header, it is calculated for the entire group data.|
| __Detail__ |This section is printed once for every row in the data source. This is where you place the report items that make up <br/>   	the main body of the report.|
| __Group Footer__ |This section is printed at the end of each group of records. Use a group footer to print summary information for a <br/>   	group. Similar to the Group Header section, you should always use aggregate functions for the databound items that are <br/>   	calculated for the group data.|
| __Report Footer__ |This section is printed just once, at the end of the report. Use the report footer to print report totals or <br/>   	other summary information for the entire report. Similar to the Report Header section, you should always use aggregate <br/>   	functions for the databound items that are calculated for the entire report data.|
| __Page Footer__ |This section is printed at the end of every page. Use a page footer to print page numbers<br/>	or per-page information. Similar to the Page Header Section you cannot use databound items, but can access the PageNumber and <br/>	PageCount objects. It is possible to suppress the printing of the Page Footer section on the first and last page of a report, but <br/>	the space taken up would always be reserved no matter whether it is visible|




# See Also


 * [How to Add/Remove Report Header & Footer Sections]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-report-header-&-footer-sections%})

 * [How to Add/Remove Page Header & Footer Sections]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-page-header-&-footer-sections%})

 * [How to Create Group Headers and Footers (obsolete)]({%slug telerikreporting/designing-reports/report-structure/how-to-create-group-headers-and-footers-(obsolete)%})
