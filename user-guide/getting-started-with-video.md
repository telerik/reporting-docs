---
title: Web Report Designer - Getting Started
page_title: Web Report Designer - Getting Started
description: Creating a report from scratch with the Web report Designer offered by Telerik Reporting.
slug: web-report-designer-user-guide-getting-started
tags: web, report, design, tool, create, report, web, started 
published: True
position: 10
---

# Getting Started 

This video tutorial will guide you through the first steps of creating a report from scratch by using the Telerik Web Report Designer.

## Before You Start

Make sure you have access to:

* Your company's instance of the Telerik Web Report Designer.
* A data source that will feed the report with data. For the purpose of this tutorial, you can utilize a data source provided by Telerik. However, you can use virtually any data source, for example, a web service, SQL, CSV, GraphQL, [and more](data-sources-link).

## Creating the Report and Connecting It to Data

The video below will guide you through the following steps:

1. Creating a new report and saving it to the desired location.
1. Connecting the report to a web service data source.

>tip To learn more about the additional options, see the [advanced data source options](#advanced-data-source-options) below.

<iframe width="560" height="315" src="https://www.youtube.com/embed/VQQxKL2sbvc?si=U6ca4GCX3uB_NV-a" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Add a Report Component

Now that you created a report and connected it to data, you can start adding report items, for example, a table:

1. On the Design Surface, click the report's **Detail section**&mdash;the main content area of the report. Clicking the section allows you to add report items to it.

1. Go to the **Components** tab and select [**Table Wizard**]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/table-and-crosstab-wizards%}) from the **TABLES** section.

    ![Table Wizard](images/wrd-table-wizard-crop.png)

1. Configure the table.

    ![Table Wizard Usage](images/wrd-table-wizard-usage.gif)

1. Style the Table using the [Properties Area]({%slug web-report-designer-user-guide-structure%}).

    ![Table Style](images/wrd-table-style.png)

1. Congratulations! Click the **Preview** button at the top right corner to see your first report with a table, populated with data coming from a web service. The tollbar allows you to easily export the report to the desired [format]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%}):

    ![Preview Report](images/wrd-preview-report.png)  

## Advanced Data Source Options

If you need to provide additional configuration options for your report's data source, you can do this in the data source wizard while you create the report. The advanced options let you:

* Configure request parameters.

* Choose what data to use while designing the report:

  * Use real data while designing the report.
  * Upload a JSON file.
  * Use JSON inline as hard-coded data while designing the report.

* Preview the data received from the data source.

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%})
* [WebServiceDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/webservicedatasource-wizard%})
