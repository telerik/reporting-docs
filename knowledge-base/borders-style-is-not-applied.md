---
title: Border's styles are not applied.
description: The Border's styles are not respected.
type: troubleshooting
page_title: Changing the Border's styles has no effect.
slug: borders-style-is-not-applied
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

In this article we will discuss possible solutions for when the Borders' styles set in the item's *Styles properties* are not respected.  
  
## Possible Cause   
  
The most common reason is that the **BorderStyle** and **BorderWidth** properties of the report item are set to conflicting values, for example:  

```
BorderStyle: Solid

BorderWidth: 0px
```

This can produce unexpected result in some rendering formats. 

## Solution
  
- To hide the border, set **BorderStyle=None**. Otherwise, the width of the border needs to be of value that is greater than 0.  
 
- To set the width of the border, use **BorderStyle=Solid** (or all other options except "*None*") and specify the required value for *BorderWidth* property.

## See Also

[Using Styles to Customize Reports](../style-using-styles-to-customize-reports)

[Style Inheritance and Overriding](../style-style-inheritence-priorty-overriding)
