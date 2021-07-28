---
title: Border's style is not applied
description: Border's style is not applied.
type: how-to
page_title: Border's style is not applied
slug: borders-style-is-not-applied
res_type: kb
---


## Description

**Borders' styles set in item's Styles properties are not respected.**  
  
## Solution   
  
The most common reason is that the **BorderStyle** and **BorderWidth** properties of the report item are set to conflicting values, for example:  

```
BorderStyle: Solid

BorderWidth: 0px
```
  
This can produce unexpected result in some rendering formats.   
  
To hide the border, set **BorderStyle=None**. Otherwise, the width of the border needs to be of value that is greater than 0.  
 
To set the width of the border, use **BorderStyle=Solid** (or all other options except "*None*") and specify the required value for *BorderWidth* property.

