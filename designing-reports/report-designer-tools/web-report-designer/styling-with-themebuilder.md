---
title: Styling with ThemeBuilder
page_title: Styling the Web Report Designer with ThemeBuilder
description: "Learn how to style the Web Report Designer with a custom theme using ThemeBuilder, a tool created by Progress Telerik and designed for customizing Telerik and Kendo UI components."
slug: styling-the-web-report-designer-with-themebuilder
tags: styling, web, report, designer, themebuilder, custom, theme
tag: new
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
components: [WRDHTML5, WRDBlazorWrapper]
position: 6
---

# Styling the Web Report Designer with ThemeBuilder

The [ThemeBuilder](https://www.telerik.com/themebuilder) is a powerful web-based tool designed to help you style Telerik and Kendo UI components effectively.

It offers a user-friendly visual interface to customize colors, fonts, and various styling properties. Since the Web Report Designer and its Report Viewer rely on such components internally, you can use ThemeBuilder to create a cohesive theme that extends to them.

## Creating a Theme

To create a theme using ThemeBuilder, follow these steps:

1. Navigate to the [ThemeBuilder website](https://themebuilderapp.telerik.com/).
1. Sign in with your Telerik account.
1. Click **Create New Project** to open the project creation dialog.
1. Enter a project name, choose **Font Icons** as the icon type, select a version and a base theme (e.g., Default), and click **Create New Project** to finalize your selections.

> The Web Report Designer and its internal HTML5 Report Viewer use [font icons](https://www.telerik.com/design-system/docs/foundation/iconography/font-icons/), so it is essential to select the correct icon type. This ensures that your changes are correctly applied in the application later on.

## Customizing the Theme

### Modify Theme Variables

Adjust predefined variables to affect global changes across colors, fonts, and other styling aspects. This approach is ideal for maintaining consistency and quickly applying broad changes.

The [Kendo UI Design System](https://www.telerik.com/design-system/docs/themes/get-started/introduction/) documentation is the recommended place for learning about the inner settings of the themes, and how to edit them:

- `Colors` - [Relative Colors in the Telerik and Kendo UI Design System](https://www.telerik.com/design-system/docs/foundation/color/relative-colors/)
- `Spacing` - [Spacing in the Telerik and Kendo UI Design System](https://www.telerik.com/design-system/docs/foundation/spacing/)
- `Iconography` - [Visual Adjustments for Icons in the Telerik and Kendo UI Design System](https://www.telerik.com/design-system/docs/foundation/iconography/font-icons/)
- `Typography` - [Typography in the Telerik and Kendo UI Design System](https://www.telerik.com/design-system/docs/foundation/typography/)
- `Border Radius` - [Border Radius in the Telerik and Kendo UI Design System](https://www.telerik.com/design-system/docs/foundation/border-radius/)
- `Elevation` - [Elevation in the Telerik and Kendo UI Design System](https://www.telerik.com/design-system/docs/foundation/elevation/)
- `Motion` - [Motion in the Telerik and Kendo UI Design System](https://www.telerik.com/design-system/docs/foundation/motion/)

### Customize Component Properties

For more granular control, you can directly tweak the styling properties of specific components. This approach allows for precise design adjustments without altering the overall theme. For example, you can customize parameter editors, which use Kendo components like ComboBox, ListView, MultiSelect, and DatePicker, directly in ThemeBuilder.

Additionally, you may want to modify other components such as the modal dialogs (which are essentially Window components), or the flat base [variant](https://docs.telerik.com/themebuilder/working-with-kendo/component-variants) of the Button component, which is used to define the toolbar buttons.

For more details on the properties customizations, check [Exploring the Component Properties](https://docs.telerik.com/themebuilder/building-visual-styles/component-properties).

### Customizing Existing Themes

Another approach for using a custom theme is customizing one of the existing ones. The following documentation articles are recommended as a starting point when such an approach is used:

- `Meridian` - [Telerik and Kendo UI Meridian Theme Customization](https://www.telerik.com/design-system/docs/themes/kendo-themes/meridian/customization/)
- `Bootstrap` - [Telerik and Kendo UI Bootstrap Theme Customization](https://www.telerik.com/design-system/docs/themes/kendo-themes/bootstrap/customization/)
- `Material` - [Telerik and Kendo UI Material Theme Customization](https://www.telerik.com/design-system/docs/themes/kendo-themes/material/customization/)
- `Fluent` - [Telerik and Kendo UI Fluent Theme Customization](https://www.telerik.com/design-system/docs/themes/kendo-themes/fluent/customization/)
- `Default` - [Telerik and Kendo UI Default Theme Customization](https://www.telerik.com/design-system/docs/themes/kendo-themes/default/customization/)
- `Classic` - [Telerik and Kendo UI Classic Theme Customization](https://www.telerik.com/design-system/docs/themes/kendo-themes/classic/customization/)

## Using the Theme

After finalizing your customizations, you can export your theme. Click **Export All** in the upper-right corner of the ThemeBuilder app. This action will download a ZIP package containing the CSS and Sass files, which you can reference in your project.

For example, copy the CSS file from the `css` folder in the exported package and add it to your project. Load the `css` stylesheet on the page with the Web Report Designer, or on a shared page, or in the root of the application if the project type is a **Single Page Application**.

Besides loading the custom stylesheet, the `useExternalTheme` property of the Web Report Designer widget must be set to `true` during its initialization.

```HTML
<!--<link rel="stylesheet" href="https://kendo.cdn.telerik.com/themes/{{site.kendothemeversion}}/default/default-ocean-blue.css" id="theme-css" />-->
<link rel="stylesheet" href="/css/tb-theme.css" />

<div id="webReportDesigner">
    Loading...
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("#webReportDesigner").telerik_WebReportDesigner({
            useExternalTheme: true, // Enable custom theming
            toolboxArea: {
                layout: "list"
            },
            serviceUrl: "api/reportdesigner/",
            report: "Product Catalog.trdp",
            startMode: "design"
        }).data("telerik_WebReportDesigner");
    });
</script>
```

> In JavaScript-based projects, if preferred, you can instead utilize the files from the `scss` folder as an NPM package. Further information on this approach can be found at [Using the ThemeBuilder Output as an NPM Package](https://docs.telerik.com/themebuilder/using-exported-styles/exported-package#using-the-themebuilder-output-as-an-npm-package).

## See Also

- [First Steps with ThemeBuilder](https://www.telerik.com/themebuilder/documentation/get-started/first-steps-blank)
- [Generate Custom Kendo Themes with AI](https://www.telerik.com/themebuilder/documentation/working-with-kendo/creating-themes-with-ai)
