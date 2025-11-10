---
title: XHTML Validation
page_title: XHTML Validation of the HtmlTextBox Report Item
description: "Learn how to provide valid XHTML content to the Telerik Reporting HtmlTextBox report item by using the IsValidXhtml method and handle the ValueError exception."
slug: telerikreporting/designing-reports/report-structure/htmltextbox/xhtml-validation
tags: telerik, reporting, report, items, htmltextbox, xhtml, validation
previous_url: /report-items-html-text-box-validation
published: True
position: 2
reportingArea: General
---

# XHTML Validation in HtmlTextBox

The HtmlTextBox requires you to provide valid XHTML and properly handle the content you set as its value.

To validate the defined content of the HtmlTextBox, use the `IsValidXhtml` expressions function or the [`Telerik.Reporting.Processing.XhtmlValidator.IsValidXhtml`](/api/Telerik.Reporting.Processing.XhtmlValidator#Telerik_Reporting_Processing_XhtmlValidator_IsValidXhtml_System_String_) static method.

Specifically, the HtmlTextBox supports the following approaches for validating its XHTML content:

* [Using the `IsValidXhtml` method in an expression](#using-the-isvalidxhtml-method-in-expression).
* [Using an event and the `IsValidXhtml` method](#using-events-and-the-isvalidxhtml-method).
* [Using and event and the `ValueError` exception](#using-events-and-the-valueerror-exception).

## Using the IsValidXhtml Method in Expression

The following example shows how to use the `IsValidXhtml` method inside the HtmlTextBox `Expression`:

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\HtmlTextBoxSnippets.cs region=Validate_Xhtml_Using_IsValidXhtml_InExpression_Snippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\HtmlTextBoxSnippets.vb region=Validate_Xhtml_Using_IsValidXhtml_InExpression_Snippet}}

## Using Events and the IsValidXhtml Method

The following example demonstrates how to apply the `IsValidXhtml` method inside the HtmlTextBox `ItemDataBinding` event handler:

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\HtmlTextBoxSnippets.cs region=Validate_Xhtml_Using_Event_And_IsValidXhtml_Snippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\HtmlTextBoxSnippets.vb region=Validate_Xhtml_Using_Event_And_IsValidXhtml_Snippet}}

## Using Events and the ValueError Exception

The following try-catch-block approach shows how to handle the exception:

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\HtmlTextBoxSnippets.cs region=Validate_Xhtml_Using_Event_And_ValueError_Snippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\HtmlTextBoxSnippets.vb region=Validate_Xhtml_Using_Event_And_ValueError_Snippet}}


## See Also

* [HtmlTextBox Class API Reference](/api/telerik.reporting.htmltextbox)
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Knowledge Base Section](/knowledge-base)
