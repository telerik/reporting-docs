---
title: Creating Nested Hierarchy
page_title: Creating Nested Hierarchy
description: Learn how to use SubReports in the Web Report Designer to create nested hierarchy.
slug: wrd-user-guide-create-nested-hierarchy-with-subreport
tags: web, report, design, components, subreport, hierarchy, master, detail, nested
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
position: 2
---

# Creating Nested Hierarchy with SubReports

The Web Report Designer provides an alternative approach to parameter binding for hierarchical data using the **DataSource** property of the **SubReport** item. This method is cleaner when your detail report is fully data-bound (not just a table inside it) and works well for hierarchical nested data scenarios.

Using DataSource on the SubReport item allows you to bind the child report directly to a filtered subset of the parent's data, making the hierarchy more intuitive and reducing parameter code.
The main benefits with this approach are:

* No need to define and pass parameters manually.
* Works naturally with hierarchical object models or JSON data.
* Cleaner and more maintainable for multi-level hierarchies.

The following example is purposed to show nested data relationships with proper grouping and organization.

Let's have JSON data representing a collection of Categories. Each category contains a nested list of its Products. This is a piece of the JSON content to better understand the Categories-Products hierarchical structure:

```JSON
    {
      "CategoryID": 1,
      "CategoryName": "Electronics",
      "Products": [
        {
          "ProductID": 100,
          "ProductName": "Electronics Item 100",
          "Price": 146.34,
        },
        {
          "ProductID": 101,
          "ProductName": "Electronics Item 101",
          "Price": 1470.37,
        },
        {
          "ProductID": 102,
          "ProductName": "Electronics Item 102",
          "Price": 934.91,
        },
        {
          "ProductID": 103,
          "ProductName": "Electronics Item 103",
          "Price": 334.59,
        }
      ]
    },
    {
      "CategoryID": 2,
      "CategoryName": "Home Appliances",
      "Products": [
        {
          "ProductID": 104,
          "ProductName": "Home Appliances Item 104",
          "Price": 1019.39,
        },
        {
          "ProductID": 105,
          "ProductName": "Home Appliances Item 105",
          "Price": 1374.47,
           },
        {
          "ProductID": 106,
          "ProductName": "Home Appliances Item 106",
          "Price": 1128.34,
        },
        {
          "ProductID": 107,
          "ProductName": "Home Appliances Item 107",
          "Price": 1009.11,
        },
        {
          "ProductID": 108,
          "ProductName": "Home Appliances Item 108",
          "Price": 1355.37,
          },
        {
          "ProductID": 109,
          "ProductName": "Home Appliances Item 109",
          "Price": 386.92,
        }
      ]
    }
```

1. Create a new report (e.g. CategoriesReport.trdp) which will be used as our main report for displaying Categories.

1. Create a [JSONDataSource]({%slug web-report-designer-user-guide-components-data-sources%}#json-data-source) item using the nested JSON collection for Categories and Products.

1. Use the [Table Wizard]({%slug web-report-designer-user-guide-components-tables%}#using-the-table-wizard) to create a table bound to the JSON source.

    <img style="border: 1px solid gray;" src="images/sub-report-default-table.png" alt="Categories Products Default Table" caption="Categories Products Default Table" /> 

1. Select the generated TextBox for the Products field (e.g. the TextBox bound to Fields.Products)

1. Navigate to the Components tab and click SubReport. Thus, the TextBox item is replaced by a SubReport item.

1. Using the searchbox, navigate to the `Bindings` section and add a new binding for the **DataSource** field and setting the **Expression** to "=Fields.Products". Thus, the SubReport item will be mapped to the Products list of the respective category record.

    <img style="border: 1px solid gray;" src="images/sub-report-datasource-binding.png" alt="DataSource Binding" caption="DataSource Binding" /> 

1. Navigate to the `Inner Report` section and select the **UriReportSource** Type. Now, we will need a separate report that will be used as a container for the products for each category.

1. Create another report (e.g. ProductsReport.trdp) and add two TextBox items.
 
1. Using the searchbox, navigate to the **Value** field and bind to **=Fields.ProductName** and **=Fields.Price** respectively. Save the child report.

1. Go back to the CategoriesReport.trdp and set the newly created ProductsReport.trdp as **Uri** for the UriReportSource.

    <img style="border: 1px solid gray;" src="images/sub-report-products-uri-report.png" alt="Specify Uri report" caption="Specify Uri report" />  

1. Click the Preview button and see the products for each category group:
    
    <img style="border: 1px solid gray;" src="images/sub-report-preview-categories-products.png" alt="Preview Categories Products" caption="Preview Categories Products" />   

A complete step-by-step video is available here:

<iframe width="560" height="315" src="https://www.youtube.com/embed/V3QxZimw19I?si=VdlqSxquqYvgEakX" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Data Sources]({%slug web-report-designer-user-guide-components-data-sources%})
