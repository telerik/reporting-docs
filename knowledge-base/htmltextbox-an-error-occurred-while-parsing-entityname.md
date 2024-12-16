---
title: '#ERROR# An error occurred while parsing EntityName'
description: 'An error is thrown while parsing the EntityName of HtmlTextBox using special characters in its value'
type: how-to
page_title: Parsing the HtmlTextBox value leads to an EntityName error
slug: htmltextbox-an-error-occurred-while-parsing-entityname
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Error Message

**#ERROR# An error occurred while parsing EntityName.**

## Cause\Possible Cause(s)

The error occurs when the text displayed by the HtmlTextbox contains [special characters](https://dev.w3.org/html5/html-author/charref) without escaping them. E.g. **'&'** should be written like **'&<span></span>amp;'**.

## Description

An *"#ERROR# An error occurred while parsing EntityName."* occurs at the place of an HtmlTextBox item in *design-time* and *run-time* previews.  

## Solution     
  
The input can be escaped:  

- In the data-retrieval method. This will warry between data bases. For example, with SQL Server 2016 (13.x) and later, [STRING_ESCAPE](https://docs.microsoft.com/en-us/sql/t-sql/functions/string-escape-transact-sql?view=sql-server-ver15) can be used.
- In the expression with the `HtmlEncode` [Text function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/text-functions%});
- In a [custom function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) used in the **HtmlTextBox.Value** property's expression through a binding.
