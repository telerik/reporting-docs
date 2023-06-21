---
title: Dynamic ReportBook Name on Export
description: "Learn how to set the name of the ReportBook document exported from a viewer dynamically ."
type: how-to
page_title: Setting ReportBook Name dynamically when exporting from a viewer
slug: dynamic-reportbook-name-on-export
tags: 
ticketid: 1612904
res_type: kb
---

## Environment

<table>
    <tbody>
        <tr>
            <td>Product</td>
            <td>Progress® Telerik® Reporting</td>
        </tr>
    </tbody>
</table>

## Description

I want to set the default file name of the ReportBook I export from the viewer with an Expression, for example, a parameter value.

## Solution

 Report Book is simply a collection of Reports that implements also IReportDocument. The implicit implementation of ReportParameters states that the parameter values for the Report Book are obtained by merging the parameters of individual reports that have their Mergeable property set to true plus adding all non-mergeable parameters.

I tested setting the DocumentName of the ReportBook to the Expression '=Parameters.ReportYear.Value' and then exporting the book from a viewer. The DocumentName was respected as you may see in the linked muted video. You need to type manually the parameter name as it won't be displayed in the designer's wizard. You should be able to use also more complex Expressions based on the report parameters and user functions.

That said, you may pass the file name you would like to be used from the web application as a Report Parameter and set it as DocumentName in the ReportBook as shown in the above video. Note that the Standalone Report Designer won't use DocumentName when exporting. It will rather use the Report name by design.

## See Also

* [Interface IReportDocument](/api/telerik.reporting.ireportdocument)
* [Class ReportBook](/api/telerik.reporting.reportbook)
