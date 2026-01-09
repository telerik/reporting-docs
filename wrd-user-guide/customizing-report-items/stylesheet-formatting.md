---
title: Using Style Sheets
page_title: Web Report Designer - Using Style Sheets
description: Learn how to customize the visuals of your report using the fine-grained, built-in styling model, similar to the Cascading Style Sheets (CSS) model.
slug: wrd-stylesheet-formatting
tags: web, report, design, customize, style, condition, formatting, properties, area 
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
position: 3
---
<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}
</style>

# Using Style Sheets in Reports

Using style sheets in the Web Report Designer lets you apply centralized, reusable styles to multiple report items, similar to CSS in web development. 

The Web Report Designer allows you to use two types of style sheets: 
* Quick style sheets that you create for each report and that live within each report
* External style sheets that live in a separate file and that you can reuse across reports

## Creating a Style Sheet in a Report

In the Web Report Designer after selecting the **Report** object:

1. Navigate to the **Style sheet** property using the search box at the top.

1. Click the `+` button to open the **StyleRule Collection Editor**.

1. Click Add to create a new StyleRule.

1. Define the Style (e.g., background color, font, borders).

1. Add Selectors to target specific items (e.g., all TextBox, PictureBox items).

The following tutorial shows how to define a style rule in the report's style sheet and apply the style to multiple items by using selectors (for example, by item name or type):

<iframe width="560" height="315" src="https://www.youtube.com/embed/hKDmiZVCiKo?si=PGDvqXsQUZacXOLA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Using External Style Sheets

External style sheets (XML files) allow you to reuse style rules across multiple reports. This type of style sheet is external to each report and this allows you to reference them from an arbitrary number of reports. Each style sheets file contains one or more style rules that define how report items must look.

You can apply styles based on:

* **TypeSelector**: Applies to all items of a specific type (e.g., all TextBox items).
* **AttributeSelector**: Applies to items with specific attributes.
* **StyleSelector**: Applies to items with a specific StyleName.
* **DescendantSelector**: Applies to items nested within others.

To add an External StyleSheet in the Web Report Designer:

1. Select the **Report** object.

1. Go to the **External style sheets** property.

1. Click the `+` button to add an external StyleSheet.

You can define an external style sheet with:

* **Absolute** Path/URL: for example *C:\Application1\StyleSheets\StyleSheet1.xml* or *https://www.mysite.com/Application1/StyleSheets/StyleSheet1.xml*
* **Relative** Path/URL: for example *.\StyleSheets\StyleSheet1.xml* or *~/StyleSheets/StyleSheet1.xml*

![Apply External StyleSheet ><](images/wrd-apply-external-stylesheet.png) 

## Sample StyleRule

Here's an example that styles all TextBox items with a light gray background, dark blue text, and bold Arial font:

```XML

<StyleSheet>
<StyleRule>
  <Selectors>
    <TypeSelector Type="Telerik.Reporting.TextBox" />
  </Selectors>
  <Style>
    <BackgroundColor>LightGray</BackgroundColor>
    <Color>DarkBlue</Color>
    <Font>
      <Name>Arial</Name>
      <Size>10pt</Size>
      <Bold>true</Bold>
    </Font>
  </Style>
</StyleRule>
</StyleSheet>

```
And here's how it looks in the report preview:

![Preview External StyleSheet ><](images/wrd-preview-external-stylesheet.png)  

## See Also

* [Web Report Designer]({%slug user-guide/overview%})
* [Styling the Report]({%slug telerikreporting/designing-reports/styling-reports/using-styles-to-customize-reports%})
