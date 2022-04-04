---
title: Designing a Report Guide
page_title: Designing a Report First Steps Guide
description: "Get up and running with the designing process of Telerik Reporting and learn how to create a report, connect it to data, set its header and footer, add some styling, and export the report to PDF."
slug: telerikreporting/getting-started/first-steps
tags: telerik, reporting, first, steps, guide, design, a, report
published: True
position: 1
---

# Designing a Report First Steps Guide

This guide targets users who need to quickly get up and running with Telerik Reporting and design and export a report. 

* First, you will install Telerik Reporting from an MSI file and load the demos.

* Next, you'll create a sample report with the Standalone Report Designer, connect it to data, and visualize the result. 

* Then, you will set the report title, header, and footer, and add some basic styling.

* Finally, you will export the report to a PDF file.

At the end, you'll be able to achieve the following result. 

.....?? 

For an advanced first-steps scenario on integrating a Telerik Report in an application, refer to the getting started guide on [integrating a report in a web application]({% slug first-steps-integrating-reports %}).

## Prerequisites 

The following prerequisites are required for accomplishing the scenario in this tutorial. For more information on the third-party tooling versions supported by Telerik Reporting, refer to the [list with system requirements](https://www.telerik.com/products/reporting/system-requirements?_ga=2.82321366.1750314063.1648453324-1000548733.1636637425).

* Install Microsoft SQL Server Management Studio.

## Step 1: Install Telerik Reporting

Let's start with the installation of the Telerik Reporting controls, services, and demos:

1. Log in to your [Telerik account](https://www.telerik.com/account). Click __Downloads__ and select __Progress Telerik Reporting__.             

1. Click __Latest public version__, download the MSI installation file, and run it. 

1. In the __Customization dialog__ of the Wizard, click __Examples Setup__ to set the examples and the used connection string. 

  The examples use the MS SQL Server AdventureWorks database which you will need later for the report.             

1. In the __Samples Database Setup__ dialog of the Wizard, select your __Database Server__ and the authentication for the connection. 

  The Wizard detects all running instances and lists them in the input field.               

  ![Install](images/Install.PNG)

1. On each subsequent dialog that the Wizard will render, click __Install__ and select __Next__ until the installation is completed.             

## Step 2: Create the Sample Report

Next, you'll need to create the report:

1. Navigate to the installation folder, for example, `C:\Program Files (x86)\Progress\Telerik Reporting __{VERSION}__ \Report Designer`, and run the `Telerik.ReportDesigner.exe` file which will start the Standalone Designer.             

1. Click __New__ > __Blank Report__ and choose a destination for saving the report. 

  Each newly created report renders the __pageHeaderSection__, __detailSection__, and __pageFooterSection__ sections. The report also provides the __Report Header__ and __Report Footer__ sections which are hidden by default.               

  ![initialview](images/initialview.PNG)

## Step 3: Populate the Report with Data

In this step, you'll add the [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) and present the fetched data into a table item. 

This guide uses the __AdventureWorks__ database that is provided by Telerik Reporting. The data sources that will be added to the report will generate their data representations. 

So, first, let's connect to the data and, then, you'll create the table to present it:

1. Select __Data__ > __SQL Data Source__ > __Existing data connections__ > __local:/Telerik.reporting.Examples.CSharp.Properties__.               

  ![3](images/3.PNG)

1. Click __Next__ > __Use as a shared connection__ > __Next__.             

1. On the screen that loads, fill in the __Select Statement__ field with the following query. The query will extract only the first 14 employees and they will be listed in ascending order according to their `id`, that is, the employee with an `id=1` will be the first one, the employee with an `id=2` will come second, and so on.             
    
      ````sql
SELECT
[HumanResources].[vEmployee].[EmployeeID] ,
[HumanResources].[vEmployee].[FirstName],
[HumanResources].[vEmployee].[LastName],
[HumanResources].[vEmployee].[JobTitle],
[HumanResources].[vEmployee].[Phone]
FROM [HumanResources].[vEmployee]
WHERE [HumanResources].[vEmployee].[EmployeeID] <= 14
ORDER BY 1 ASC
````


1. From the property grid, change the name of the data source to `tableDataSource` so you can later refer it and render its data in the report.             

1. Click __datailSection__. From the bar, select __Insert__, then __Table__ > __Table Wizard__ > __tableDataSource__.             

1. On the screen that loads, mark all columns and drag them to the __Table Columns__. Click __Next__.             

1. From the window that opens, select a predefined style for your table. Click __Next__ and __Finish__.             

## Step 4: Style the Table and Set Its Title 

Now, you'll have to add some styling to the table and define its title.

1. Apply the following __Styling__ to the table:             

   + Set __BackgroundColor__ and  __BorderColor__ to `[34, 181, 115]`.                 

   + Set __Font > Name__ to `SegoeUI`.                 

   + Mark the table header and set the __Color__ property to `White`.                 

1. To set the title of the table, add a TextBox and set its __Value__ to `Employees`.             

1. Let's insert two Shapes next to the text: set the __ShapeType__ to `Horizontal Line` and the __Color__ to `Silver`.              

## Step 5: Set the Report Header and Footer

In this step, you'll define and style the header and footer of your report. First, let's start with the header:  

1. Click __pageHeaderSection__. From the property grid, select __Style__ > __BackgroundColor__. Set the color to `0, 105, 104`.             

1. To add the title, select __Insert__ from the bar. Click __TextBox__ to automatically place the [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%}) in the header.             

1. Set the __Value__ to `Telerik`. Add one more TextBoxes with text `Demo Report`. 

1. Mark the textboxes. From the property grid, make the following settings:             

   + Set __Style__ > __Font__ to `Segoe UI`.                 

   + Set __Style__ > __Font Color__ to `White`.                 

1. Add a [Shape]({%slug telerikreporting/designing-reports/report-structure/shape%}) between the textboxes. Set the __ShapeType__ to `Vertical Line` and the __LineColor__ property to `White`.

After the report header is all set, let's move on to the footer of the report: 

1. Click __pageFooterSection__. Add a Textbox which will display the current date and time.             

1. Set the __Value__ property __Expression__ to the `=Now()` Date and Time function.             

1. To add a barcode item, select __Insert__ > __Barcode__ from the bar.             

1. Place the [https://docs.telerik.com/reporting/report-items-barcode-general]() link in the __Value__  field of the __Barcode__.             

1. Set the __BackgroundColor__ of the footer to `242, 242, 242`.            

## Step 6: Export the Data to PDF

Here you go with a nice and neat report that provides some basic data to present. If you need to share it, now is the time to export it. For the purposes of this guide, you'll export it to PDF: 

1. Go to ....

1. Click __Export in PDF__ ...

That was it! Now you are ready to deep-dive into Telerik Reporting and take full advantage of its more advanced functionalities!

## Next Steps

* [Advanced Scenarios: Integrating Reports in Applications First Steps Guide]({% slug ... %})
* [Designing Reports Overview]({% slug telerikreporting/designing-reports/overview %})
