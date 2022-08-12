---
title: XHTML Validation
page_title: XHTML Validation 
description: XHTML Validation
slug: telerikreporting/designing-reports/report-structure/htmltextbox/xhtml-validation
tags: xhtml,validation
published: True
position: 1
previous_url: /report-items-html-text-box-validation
---

# XHTML Validation

The __HtmlTextBox__ requires valid __XHTML__ and you should make sure you provide such otherwise the HtmlTextBox would throw exception. To handle this exception or just check whether the __HtmlTextBox__ would be able to handle the content you set as value, you should use the IsValidXhtml expressions function or [Telerik.Reporting.Processing.XhtmlValidator.IsValidXhtml](/reporting/api/Telerik.Reporting.Processing.XhtmlValidator#Telerik_Reporting_Processing_XhtmlValidator_IsValidXhtml_System_String_) static method. Three possible approaches are listed below:

## Validate Xhtml Using IsValidXhtml in Expression

Use the __IsValidXhtml__ inside the HtmlTextBox __Expression__ :

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\HtmlTextBoxSnippets.cs region=Validate_Xhtml_Using_IsValidXhtml_InExpression_Snippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\HtmlTextBoxSnippets.vb region=Validate_Xhtml_Using_IsValidXhtml_InExpression_Snippet}}

## Validate Xhtml Using Event And IsValidXhtml

Use the __IsValidXhtml__ inside the HtmlTextBox __ItemDataBinding__ handler:

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\HtmlTextBoxSnippets.cs region=Validate_Xhtml_Using_Event_And_IsValidXhtml_Snippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\HtmlTextBoxSnippets.vb region=Validate_Xhtml_Using_Event_And_IsValidXhtml_Snippet}}

## Validate Xhtml Using Event And ValueError

Use a __try-catch block__ to handle the exception:

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\HtmlTextBoxSnippets.cs region=Validate_Xhtml_Using_Event_And_ValueError_Snippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\HtmlTextBoxSnippets.vb region=Validate_Xhtml_Using_Event_And_ValueError_Snippet}}

