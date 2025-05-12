---
title: Styling with ThemeBuilder
page_title: Styling Viewers with ThemeBuilder
description: "Learn how to style your web report viewers using ThemeBuilder, a tool  created by Progress Telerik and designed for customizing Telerik and Kendo UI components."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/styling-with-themebuilder
tags: styling,viewer,themebuilder
published: True
position: 11
---

# Styling Web Report Viewers with ThemeBuilder

ThemeBuilder is a powerful web-based tool designed to help you style Telerik and Kendo UI components effectively. It offers a user-friendly visual interface to customize colors, fonts, and various styling properties. Since the web report viewers rely on such components internally, you can use ThemeBuilder to create a cohesive theme that extends to the web report viewers in Telerik Reporting.

## Creating a Theme

To create a theme using ThemeBuilder, follow these steps:

1. Navigate to the [ThemeBuilder website](https://themebuilderapp.telerik.com/).
1. Sign in with your Telerik account.
1. Click **Create New Project** to open the project creation dialog.
1. Enter a project name, choose **Font Icons** as the icon type, select a version and a base theme (e.g., Default), and click **Create New Project** to finalize your selections.

> The report viewer uses font icons instead of SVGs, so it is essential to select the correct icon type. This ensures that your changes are correctly applied in the application later on.

## Customizing the Theme

You can further customize your theme through one of the following approaches:

### Modify Theme Variables

Adjust predefined variables to effect global changes across colors, fonts, and other styling aspects. This approach is ideal for maintaining consistency and quickly applying broad changes. Some key variables to consider include:

- `kendo-color-primary`: Sets the main accent color for the report viewer. This affects components such as the toolbar buttons’ selected state and the focused state of the splitter.
- `kendo-color-base`: Defines the secondary accent color of the report viewer.
- `kendo-color-subtle`: Determines the subtle text color used in the icons of toolbox buttons.
- `kendo-default-typography`: Configures the default typography for the report viewer, and additionally influences the icons in toolbox buttons (since they are essentially font icons).

### Customize Component Properties

For more granular control, you can directly tweak the styling properties of specific components in the web report viewers. This approach allows for precise design adjustments without altering the overall theme. For example, you can customize parameter editors, which use Kendo components like ComboBox, ListView, MultiSelect, and DatePicker directly in ThemeBuilder. For more details on the properties customizations, check [Exploring the Component Properties](https://docs.telerik.com/themebuilder/building-visual-styles/component-properties).

## Using the Theme

After finalizing your customizations, you can export your theme. Click **Export All** in the upper-right corner of the ThemeBuilder app. This action will download a ZIP package containing the CSS and Sass files, which you can reference in your project with the report viewer. 

For example, copy the CSS file from the `css` folder in the exported package and add it to your project. In the report viewer file, replace the existing references to Telerik and Kendo UI themes with the ThemeBuilder-exported theme:

````HTML
<!--
<link href="https://kendo.cdn.telerik.com/2022.3.913/styles/kendo.common.min.css" rel="stylesheet" />
<link href="https://kendo.cdn.telerik.com/2022.3.913/styles/kendo.blueopal.min.css" rel="stylesheet" />
-->
<link rel="stylesheet" href="/css/default-theme.css" />
````

> In JavaScript-based projects, if preferred, you can instead utilize the files from the `scss` folder as an NPM package. Further information on this approach can be found at [Using the ThemeBuilder Output as an NPM Package](https://docs.telerik.com/themebuilder/using-exported-styles/exported-package#using-the-themebuilder-output-as-an-npm-package).

## Next Steps

- [ThemeBuilder Documentation](https://docs.telerik.com/themebuilder/)
