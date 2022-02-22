---
title: Style Inheritance and Overriding
page_title: Style Inheritance and Overriding 
description: Style Inheritance and Overriding
slug: telerikreporting/designing-reports/styling-reports/style-inheritance-and-overriding
tags: style,inheritance,and,overriding
published: True
position: 3
---

# Style Inheritance and Overriding



Telerik Reporting Styling is similar to CSS (Cascading Style Sheets), of which many web developers are familiar.

Styles can be defined globally using the [StyleRules]({%slug telerikreporting/designing-reports/styling-reports/creating-style-rules%}). They can be inherited from parent report items. They can also be explicitly defined in a report item's Style properties.

## General Inheritance Rules

Child report items placed within another report item always derive their styling based on the following precedence:

__Lowest Priority - Parent:__  If the parent control has a __Style__  applied, then the child will inherit the parent's styling. This will be over-ruled by the higher priorities.

__Second Priority - Global:__  If any of the global styles apply to the child (eg. the child is a TextBox and there is a TypeSelector rule for TextBox report items) then the control will use this styling. Parent styling will be ignored in this case.

__Highest Priority - Inline:__  If  the child control's __Style__  properties have been changed from their defaults, then these properties will be honored with the  highest priority. In this case, the Global styling and the style of the parent will be ignored.

## Global Styles and Precedence

Styles defined with __Style Rules__  will be applied globally in a report based on the definition of       		the Style Rule. A __Style Rule__  can be defined by using one of the [Style Selectors]({%slug telerikreporting/designing-reports/styling-reports/understanding-style-selectors%}).       	

The __Style Sectors__  have the following precedence:       	 

* DescendantSelector

* TypeSelector

* AttributeSelector

* StyleSelector where the order is from bottom to top. This means that a      		__StyleSelector__  has precedence over the other Selectors.

By default the order of the __Style Rules__  in the collection determines        		how styles are applied and the order is from bottom (last) to top (first). Exception from this rule is the       		__TypeSelector__  where the more specific the rule is, the higher precedence it has. For example        	a Style Rule for a __TextBox__  will have precedence over a style rule for  	__ReportItemBase__  despite their order in the style sheet.       	

If several rules match the same Selectors, the last Style Rule has precedence.

## Inheriting from Global Styles

Report items placed within a report item that is styled using one of the Global Styles will inherit the Font, Vertical Alignment, and Horizontal alignment of the parent. 

## Overriding Global Styles

You can override a GlobalStyle by modifying the Style properties of an individual report item. Select the report item 
      		and either click the ellipsis of the __Style__  property or right click and select the 
        	__Style...__  option. These open the Edit Style dialog box, which allows you to edit the various 
        	properties that can be set through the style sheet. Any changes you make through the Edit Style dialog box override 
        	settings made through the report's __StyleSheet__  property.

  

  ![](images/Style3.png) 

## Resetting Global Styles

If you have overridden a style using a report item's Style properties, it is possible to reset the report item to its Global Style.

1. Right-click the report item to open its context menu.

1. Click __Reset Style__  .

  

  ![](images/ReportStyleRuleG.png)

____  

 

 
