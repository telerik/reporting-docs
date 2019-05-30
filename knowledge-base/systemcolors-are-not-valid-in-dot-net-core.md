---
title: ControlText and other colors from SystemColors class are not valid values for Int32 - .NET Standard
description: The color names from SystemColors class cannot be linked to valid Int32 values in .NET Standard
type: troubleshooting
page_title: SystemColors color names are not valid in .NET Standard
slug: systemcolors-are-not-valid-in-dot-net-standard
position: 
tags: 
ticketid: 1409292
res_type: kb
---

## Environment
<table>
    <tbody>
	    <tr>
	    	<td>Product Version</td>
	    	<td>13.0.19.116 or higher</td>
	    </tr>
	    <tr>
	    	<td>Product</td>
	    	<td>Progress® Telerik® Reporting</td>
	    </tr>
      <tr>
	    	<td>Framework</td>
	    	<td>.NET Standard</td>
	    </tr>
    </tbody>
</table>


## Description
When report using color names from [SystemColors class](https://docs.microsoft.com/en-us/dotnet/api/system.drawing.systemcolors?view=netframework-4.8) is executed in .NET Standard the following error message will appear (the color name will vary).

## Error Message
```
'ControlText' is not a valid value for Int32.
```

## Solution
'ControlText' and other color names are defined in the [SystemColors class](https://docs.microsoft.com/en-us/dotnet/api/system.drawing.systemcolors?view=netframework-4.8) and can be chosen from the _System_ tab when setting color in the report designer. The _SystemColors_ enumeration is not available in .NET Standard as it is too UI specific, and the color cannot be converted to its valid _Integer_ value. Therefore, the Reporting engine throws an error when hosted in a .NET Standard project.

## Suggested Workarounds
Choose the corresponding color from another tab, e.g. _Custom_ or _Web_ in the designer.
