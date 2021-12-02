---
title: Conditional Formatting
page_title: Conditional Formatting | for Telerik Reporting Documentation
description: Conditional Formatting
slug: telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting
tags: conditional,formatting
published: True
position: 4
---

# Conditional Formatting



## 

You can design a report so that different styles are applied to items based 			on the data in the report. For example, you can display negative numbers 			in red or change the background colors on a table cell. 			

To make styles conditional, use an expression instead of a static value 			for the style properties of the report item. The two examples below demonstrate how to make a __Text box__  			render negative values in red for a field called Profit. You can achieve this with the __Conditional Formatting Editor__  in Report Designer        or by using __Bindings__ . 			

### Using Conditional Formatting Editor

1. In Report Designer, right-click on a __Text Box__  report item.               

1. In the context menu, select __Conditional Formating__ .               

1. The __[Conditional Formatting Rules...]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/conditional-formatting-rules-dialog%})__  dialog appears on the screen.

1. Enter the conditional 
							expression:

	````
=Fields.Profit
````



1. Enter the operator:

	````
<
````



1. Enter the value expression:

	````
=0
````



1. In the __Edit Style__  dialog select Red color for
						the Background.

### Using Bindings

1. To use Bindings, we need to implement a helper User Function:

	
      ````C#
                            public static Color ColorFromName(string colorName)
                            {
                                if (!string.IsNullOrEmpty(colorName))
                                {
                                    return Color.FromName(colorName);
                                }
                                return Color.Transparent;
                            }
````
````VB.NET
                            Public Shared Function ColorFromName(ByVal colorName As String) As Color
                                If Not String.IsNullOrEmpty(colorName) Then
                                    Return Color.FromName(colorName)
                                End If
                                Return Color.Transparent
                            End Function
````



1. In the __Bindings Editor__  							select the __Style.BackGroundColor__  property.

1. Enter the next expression:

	````
=Iif(Fields.Profit < 0, ColorFromName("Red"), ColorFromName("White"))
						
````



# See Also


 * [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%})
