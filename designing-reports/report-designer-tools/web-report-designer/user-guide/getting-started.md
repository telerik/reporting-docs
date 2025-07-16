---
title: Web Report Designer - Getting Started
page_title: Web Report Designer - Getting Started
description: Creating a report from scratch with the Web report Designer offered by Telerik Reporting.
slug: web-report-designer-user-guide-getting-started
tags: web, report, design, tool, create, report, web, started 
published: True
position: 2
---
<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}
</style>

# Getting Started 

This tutorial will guide you through your first steps of creating a report from scratch using the Web Report Designer.

1. Create a new empty Report:

    ![Create New Report ><](images/wrd-create-new-report.gif)   

2. In the **Components** tab, under the **Data Sources** group, select the **Web Service Data Source** option:

    ![Create Web Service Data Source ><](images/wrd-create-web-service-data-source.png)  

3. Using the [WebServiceDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/webservicedatasource-wizard%}), we will add a new [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%}) that will be used for the data population in our first report.

    * Enter directly the *Service URL*, e.g. *https://demos.telerik.com/reporting/api/reports/formats*, and display data located on a service in JSON format while using no code.
    
    ![Web Service Data Source Wizard Step 1 ><](images/wrd-create-web-service-data-source-wizard-step1.png)   

    * You can **Finish** the wizard or go through the **Next** steps if other fine-tuning is necessary:

        * Configure request parameters (if such are required)

        ![Web Service Data Source Wizard Step 2 ><](images/wrd-create-web-service-data-source-wizard-step2.png) 

        * Choose desing-time data - select the *Use real data while designing the report* option

        ![Web Service Data Source Wizard Step 6 ><](images/wrd-create-web-service-data-source-wizard-step6.png)  

        * Preview data source results - It is expected to see the data preview in JSON format:

        ![Web Service Data Source Wizard Step 7 ><](images/wrd-create-web-service-data-source-wizard-step7.png)  

    Once the wizard is completed, the Web Service Data Source object should be available in the **Explorer** tab under the **Inline DataSources** group:

    ![Web Service Data Source Wizard Step Instance ><](images/wrd-create-web-service-data-instance.png) 

4. Go back to the **Components** tab, select the report's **Detail section** and trigger the [Table Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/table-and-crosstab-wizards%}) option:  

    ![Table Wizard ><](images/wrd-table-wizard.png) 

5. Configure the Table:

    ![Table Wizard Usage ><](images/wrd-table-wizard-usage.gif)  

6. Style the Table using the [Properties Area]({%slug web-report-designer-user-guide-structure%}):

    ![Table Style ><](images/wrd-table-style.png)   

7. Click the **Preview** button at the top right corner to see your first report with a table, populated with data coming from a web service. The tollbar allows you to easily export the report to the desired [format]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%}):

    ![Preview Report ><](images/wrd-preview-report.png)  

<iframe width="560" height="315" src="https://www.youtube.com/embed/L-utkcB8-5c?si=h-Eu4paNlOkJkGF6" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/DXKlgq-MYIU?si=ezqIjyrUTPLziUXl" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%})
* [WebServiceDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/webservicedatasource-wizard%})


