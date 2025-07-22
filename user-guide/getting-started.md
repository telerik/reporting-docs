---
title: Getting Started
page_title: Web Report Designer - Getting Started
description: Creating a report from scratch with the Web report Designer offered by Telerik Reporting.
slug: web-report-designer-user-guide-getting-started
tags: web, report, design, tool, create, report, web, started 
published: True
position: 3
---
<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}
</style>

# Getting Started 

This tutorial will guide you through your first steps of creating a report from scratch using the Web Report Designer.

## Before You Start

Make sure you have access to:

* Your company's instance of the Telerik Web Report Designer.
* A data source that will feed the report with data. For the purpose of this tutorial, you can utilize a data source provided by Telerik. However, you can use virtually any data source, for example, a web service, SQL, CSV, GraphQL, [and more]({%slug web-report-designer-user-guide-components-data-sources%}).

## Creating the Report and Connecting It to Data

1. Create a new empty Report:

    ![Create New Report ><](images/wrd-create-new-report.gif)

2. On the **Components** tab, go to [Data Sources]({%slug web-report-designer-user-guide-components-data-sources%}) and select **Web Service Data Source**:

    ![Create Web Service Data Source ><](images/wrd-create-web-service-data-source.png)  

3. On the **Configure Data Retrieval** screen, enter the URL of the web service providing the data for your report, for example, `https://demos.telerik.com/reporting/api/reports/formats` and click **Finish**.

Now you have a bank report that is connected to data.
    
    ![Web Service Data Source Wizard Step 1 ><](images/wrd-create-web-service-data-source-wizard-step1.png)

## Adding Items to Your Report

Next, design the report by adding a Table report item:

1. Click the report's Detail Section to enable the adding of report items.

1. Select the **Components** tab, and then click the [**Table Wizard**]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/table-and-crosstab-wizards%}) button:  

    ![Table Wizard ><](images/wrd-table-wizard.png)

1. Configure the Table as illustrated below:

    ![Table Wizard Usage ><](images/wrd-table-wizard-usage.gif)  

1. Style the Table using the Properties Area:

    ![Table Style ><](images/wrd-table-style.png)

1. Click the **Preview** button at the top right corner to see your first report with a table populated with data coming from a web service.

    ![Preview Report ><](images/wrd-preview-report.png)  

## Video Tutorials

If you prefer video, check out the Getting Started tutorial below. It demonstrates how to create a report and add a Chart. Feel free to skip the setup in Visual Studio and start with the creation of the report.

<iframe width="560" height="315" src="https://www.youtube.com/embed/L-utkcB8-5c?si=bmJU9ggpSOykHdLK&amp;start=188" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## See Also

* [Getting Started Tutorial Part 1](https://www.youtube.com/embed/L-utkcB8-5c?si=bmJU9ggpSOykHdLK&amp;start=188)
* [Getting Started Tutorial Part 2]()
* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%})
* [WebServiceDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/webservicedatasource-wizard%})
