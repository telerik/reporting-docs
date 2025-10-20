---
title: Styling Overview
page_title: Web Report Designer - Styling Overview
description: Learn how to customize the visuals of your report using the fine-grained, built-in styling model, similar to the Cascading Style Sheets (CSS) model.
slug: web-report-designer-customizing-report-items
tags: web, report, design, customize, style, condition, formatting, properties, area 
published: True
position: 0
---
<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}
</style>

# Customizing Report Items

A well-styled report looks professional and polished. Styling report items serves both, functional and aesthetic, purposes. Visual consistency (e.g., using a theme or style rules) improves user experience and brand alignment. It allows you to improve readability and clarity in your reports. Applying different colors or fonts distinguishes separate sections or highlight key information.
To customize or style report items in the Telerik Web Report Designer, you can use its built-in CSS-like styling model and the Properties panel.

## Properties Area

The **Properties Area** on the right side of the Web Report Designer **dynamically** displays the properties of the **currently selected** report item - such as a TextBox, Table, Chart, or Panel.

![Customizing Report Items Properties Area ><](images/wrd-customizing-report-items-properties-area.png)  

Key Features of the Properties Area are:

* **Categorized** and **Alphabetical** Views for easier navigation:

|Categorized|Alphabetical|
|----|----|
|![Properties Area Categorized View ><](images/wrd-properties-area-categorized-area.png) |![Properties Area Alphabetical View><](images/wrd-properties-area-alphabetical-view.png)|

* **Indent Line Guides**: These help visualize the hierarchy of nested properties, improving clarity: 

![Indent Line Guides in Properties Area ><](images/wrd-properties-area-indent-line-guides.png)  

* **Global Search**: A search bar at the top allows you to quickly find specific properties or editors.

![Properties Area Global Search ><](images/wrd-properties-area-global-search.gif)   


### Reset Button in the Properties Area

Each editable property in the Properties Area has a small square button next to it - this is the **Reset** button. It reverts the property to its `default` value which is useful when you have applied multiple changes and want to undo a specific one without affecting others. The Reset button helps maintain consistency, especially when working with styles or templates.

![Properties Area Reset Button ><](images/wrd-properties-area-reset-button.gif)    


## See Also

* [Web Report Designer]({%slug user-guide/overview%})
* [Conditional Formatting]({%slug wrd-conditional-formatting%})
* [Stylesheet Formatting]({%slug wrd-stylesheet-formatting%})
