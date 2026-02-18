---
title: Provide Graph ColorPalette Dynamically
description: How to modify Graph ColorPalette dynamically with Bindings and User Function
type: how-to
page_title: Set Graph ColorPalette with User Function
slug: colorpalette-set-with-bindings
position:
tags:
ticketid: 1445167
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

The **ColorPalette** property does not support [Expressions]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/overview %}) and its value can be set directly only to a constant value.

## Solution

You may set the ColorPalette with [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}):

`Property Path	|	Expression
ColorPalette	|	= MyUserFunctionName(MyColor1, MyColor2, ...)`

The above [User Function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) should return an object of type [Telerik.Reporting.Drawing.IColorPalette](/api/telerik.reporting.drawing.icolorpalette). A sample implementation in C# may look like:

```C#
public static IColorPalette UserColorPalette(params string[] hexColors)
{
    string[] colors = hexColors;

    if (null == colors || colors.Length <= 0)
    {
        return null;
    }

    if (colors.Length == 1)
    {
        colors = colors[0]
            .Split('#')
            .Where(c => !string.IsNullOrWhiteSpace(c))
            .Select(c => $"#{c.Trim()}")
            .ToArray();
    }

    ColorPalette colorPalette = new ColorPalette(colors);

    return colorPalette;
}
```

The above method may accept a list of string values, each holding a single hex color or a single string that contains one or more colors. In the latter case, it will split the colors by '#' and create and return an **IColorPalette** from them. Here is how you may use the method in the Binding Expression with each color provided separately:

`= UserColorPalette("#FAFAFA", "#FF8080", "#80FF80")`

and with all colors concatenated in a single string:

`= UserColorPalette("#FAFAFA#FF8080#80FF80")`

In both cases, you may add more colors.

> note If you use the Standalone Report Designer, it will be necessary to extend it with the function as explained in the [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}) article.
