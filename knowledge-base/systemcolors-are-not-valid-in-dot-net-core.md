---
title: ControlText and other colors from SystemColors class are not valid values for Int32 - .NET Core
description: The color names from SystemColors class cannot be linked to valid Int32 values in .NET Core
type: troubleshooting
page_title: SystemColors color names are not valid in .NET core
slug: systemcolors-are-not-valid-in-dot-net-core
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
	    	<td>.NET Core</td>
	    </tr>
    </tbody>
</table>


## Description
When report using color names from SystemColors class is executed in .NET Core the following error message will appear (the color name will vary).

## Error Message
'ControlText' is not a valid value for Int32.

## Solution
'ControlText' and other color names are defined in the [SystemColors class](https://docs.microsoft.com/en-us/dotnet/api/system.drawing.systemcolors?view=netframework-4.8) and can be chosen from the _System_ tab when setting color in the report designer. The _SystemColors_ enumeration is not available in .NET Core and the color cannot be converted to its valid Integer value. Therefore, the reporting engine throws an error when hosted in a pure .NET Core project.

## Suggested Workarounds
Choose the corresponding color from another tab, e.g. _Custom_ or _Web_ in the designer.
