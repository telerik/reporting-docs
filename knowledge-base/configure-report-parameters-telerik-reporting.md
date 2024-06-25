---
title: Configuring Report Parameters in Telerik Reporting
description: Learn how to define and use report parameters in Telerik Reporting to ensure they are recognized in report previews and avoid errors.
type: how-to
page_title: How to Ensure Report Parameters Are Recognized in Telerik Reporting Previews
slug: configure-report-parameters-telerik-reporting
tags: report, parameters, telerik, reporting, configuration, preview, error
res_type: kb
ticketid: 1655580
---

## Environment

| Version | Product | Author |  
| --- | --- | ---- |  
| 17.0.23.118| Standalone Report Designer |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

While using the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}), I encountered an error during the preview: "The expression contains object 'InspectionId' that is not defined in the current context." 

![Object Not Defined ](images/report-parameter-not-defined-error.png)   

I have configured a parameter, and my select statement includes this parameter. Although executing the query with a design time value returns one record from the data view, the preview fails with the mentioned error. This KB article also answers the following questions:
- How do I link SQL data source parameters to report parameters in Telerik Reporting?
- What steps should I follow to ensure my report parameters are recognized during the preview?
- Why is my report parameter not found in the current context during the preview?

## Solution

To resolve the issue where a report parameter is not recognized in the report preview, ensure that the report parameter is correctly defined in the report's parameters collection and linked to the SqlDataSource component.

1. Verify that the report parameter is added to the report parameters collection. Refer to the [Report Parameters Overview]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) for guidance on defining report parameters.

    >caption Report Parameter

    ![SqlDataSourceParameter](images/report-parameter.png)      

2. Ensure that each SqlDataSource parameter is linked to an expression, such as a report parameter value, in the report definition. SqlDataSource parameters cannot directly receive values from the ReportSource.Parameters collection. Review the [Using Parameters with the SqlDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-parameters-with-the-sqldatasource-component%}) for more details.

    >caption SqlDataSourceParameter

    ![SqlDataSourceParameter](images/sqldatasource-parameter.png)        

3. In your report definition, connect the SqlDataSource parameter to the report parameter through the SqlDataSource's SelectCommand. This involves setting up a SqlDataSourceParameter that references the report parameter.

4. For detailed steps on adding and configuring report parameters, consult the [Approaches for Adding Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%}) guide.

By following these steps, you ensure that your report parameters are correctly recognized during the preview, preventing errors related to undefined objects in the current context.

## See Also

- [Report Parameters Overview]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%})
- [Using Parameters with the SqlDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-parameters-with-the-sqldatasource-component%})
- [Approaches for Adding Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%})
- [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%})

---
