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

Using a **DataSource** in the [SubReport]({%slug web-report-designer-user-guide-components-subreport%}) item allows you to bind the child report directly to a filtered subset of the parent's data, making the hierarchy more intuitive and reducing parameter code.

The main benefits of this approach are:

* No need to define and pass parameters manually. All the data is available in the parent report.
* Works naturally with hierarchical object models or JSON data.
* Cleaner and more maintainable for multi-level hierarchies.

The example in this tutorial shows how to present and organize a report when the used data has a nested (hierarchical) structure. Let's have the sample [JSON data](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/Data%20Files/Categories-Products-Nested-Data.json) representing a collection of Categories. Each category contains a **nested** list of its Products. 

A complete step-by-step video is available here:

<iframe width="560" height="315" src="https://www.youtube.com/embed/V3QxZimw19I?si=VdlqSxquqYvgEakX" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

To design a report that represents a hierarchy:

1. Create a new report (for example, `CategoriesReport.trdp`). You will use it as the main (parent) report to display categories.

1. Create a [JSONDataSource]({%slug web-report-designer-user-guide-components-data-sources%}#json-data-source) item using the nested JSON collection for Categories and Products.

1. Use the [Table Wizard]({%slug web-report-designer-user-guide-components-tables%}#using-the-table-wizard) to create a table bound to the JSON source.

    <img style="border: 1px solid gray;" src="images/sub-report-default-table.png" alt="Categories Products Default Table" caption="Categories Products Default Table" /> 

1. Select the generated TextBox for the Products field (the TextBox bound to Fields.Products).

1. Navigate to the Components tab and click **SubReport**. Thus, the TextBox item is replaced by a SubReport item.

1. Using the search box, navigate to the **Bindings** section and add a new binding for the **DataSource** field and set the **Expression** to `"=Fields.Products"`. Thus, the SubReport item will be mapped to the Products list of the respective category record.

    <img style="border: 1px solid gray;" src="images/sub-report-datasource-binding.png" alt="DataSource Binding" caption="DataSource Binding" /> 

1. Navigate to the **INNER REPORT** section and select the **UriReportSource** Type. Now, you need to create a separate report that will be used as a container for the products for each category.

1. Create another report (`ProductsReport.trdp`).

1. Remove the default header/footer and add two TextBox items (or other Report items according to the data you need to display).
 
1. Using the search box, navigate to the **Value** field and bind to `=Fields.ProductName` and `=Fields.Price` respectively. Save the child report.

1. Go back to the `CategoriesReport.trdp` report and set the newly created `ProductsReport.trdp` as **Uri** for the **UriReportSource**.

    <img style="border: 1px solid gray;" src="images/sub-report-products-uri-report.png" alt="Specify Uri report" caption="Specify Uri report" />  

1. Click the **Preview** button. In the report, you will see the products for each category group.
    
    <img style="border: 1px solid gray;" src="images/sub-report-preview-categories-products.png" alt="Preview Categories Products" caption="Preview Categories Products" />   

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Data Sources]({%slug web-report-designer-user-guide-components-data-sources%})
