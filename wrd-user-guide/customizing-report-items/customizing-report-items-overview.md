---
title: Overview
page_title: Web Report Designer - Customizing Report Items Overview
description: Learn how to customize the visuals of your report using the fine-grained, built-in styling model, similar to the Cascading Style Sheets (CSS) model.
slug: web-report-designer-customizing-report-items
tags: web, report, design, customize, style, condition, formatting, properties, area 
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
position: 0
---
<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}
</style>

# Customizing Report Items: Overview

Customization of report items involves changing their properties to achieve both functional and aesthetic goals. These changes can be applied in two ways:

- Static customization: Properties are set once and remain unchanged throughout the report’s lifecycle.
- Dynamic customization: Properties adjust based on data or variables, such as the current date or logged-in user (see [Expressions]({%slug expression-editor-web-report-designer-user-guide%})).

The most important aspect of customization is styling. Styling report items ensures visual consistency (e.g., using themes or style rules), which improves readability, clarity, and brand alignment. Applying different colors, fonts, or layouts can distinguish sections and highlight key information, making reports more engaging and easier to interpret.

To customize or style report items in the Telerik Web Report Designer, you can use its

* [Conditional Formatting]({%slug wrd-conditional-formatting%}) options
* Built-in CSS-like [styling model]({%slug wrd-stylesheet-formatting%})
* Properties Area.

## Properties Area

The **Properties Area** represents the section on the right-side where you can view and edit the properties of the currently selected report item. This area lets you control how each report item looks and behaves. Whether you are working with a TextBox, Table, Chart, or Image, this panel gives you access to all the relevant settings in one place:

* **Appearance**: Change fonts, colors, borders, background, padding, and more. Apply [conditional formatting]({%slug wrd-conditional-formatting%}): dynamically change appearance based on data values.
* **Data**: Connect report items to fields or expressions from your data source.
* **Layout**: Modify size, position, alignment, and visibility.
* **Behavior**: Set actions like navigation, visibility rules, or interactivity.

 <img style="border: 1px solid gray;" src="images/wrd-customizing-report-items-properties-area.png" alt="Customizing Report Items Properties Area" />  

### Key Features

To facilitate the easier styling of your report, the Properties Panel offers several features that simplify access to the built-in styling tools:

* **Different Views**: Choose the layout that fits your style:

  * **Categorized view**: Groups properties by function (like Appearance, Layout, Data), making it easier to find what you need.
  * **Alphabetical view**: Lists everything in alphabetical order&mdash;perfect when you know exactly what you're looking for.

|Categorized|Alphabetical|
|----|----|
|![Properties Area Categorized View ><](images/wrd-properties-area-categorized-area.png) |![Properties Area Alphabetical View><](images/wrd-properties-area-alphabetical-view.png)|

* **Indent Guides**: When showing nested properties Indent Line Guides help you see how settings are structured, so you can navigate complex items with confidence: 

![Indent Line Guides in Properties Area ><](images/wrd-properties-area-indent-line-guides.png)  

* **Search Box**: Use the Global Search bar at the top to instantly locate any property or editor. No more scrolling through long lists!

![Properties Area Global Search ><](images/wrd-properties-area-global-search.gif)   

* **Reset Value**: If you have made a change you want to undo, note that each editable property has a `Reset button` next to it. Just click it to revert that setting to its default - without affecting anything else.

![Properties Area Reset Button ><](images/wrd-properties-area-reset-button.gif)    

## See Also

* [Conditional Formatting]({%slug wrd-conditional-formatting%})
* [Stylesheet Formatting]({%slug wrd-stylesheet-formatting%})
