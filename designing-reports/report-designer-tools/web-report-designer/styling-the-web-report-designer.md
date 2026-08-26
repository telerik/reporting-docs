---
title: Styling
page_title: Styling the Web Report Designer
description: "Learn how the Telerik Web Report Designer loads its built-in theme and how to replace it with a stock Kendo UI theme or a custom ThemeBuilder theme through the useExternalTheme option."
slug: styling-the-web-report-designer
tags: report,webreportdesigner,styling,theme,thememing,themebuilder
tag: new
published: True
reportingArea: WRDHTML5
components: [wrdhtml5]
position: 5
---

# Styling the Web Report Designer

By default, the Web Report Designer loads a built-in Kendo UI theme so it renders correctly out of the box, with no additional configuration required. Starting with [2026 Q3 (20.2.26.812)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q3-(20-2-26-812)), you can instead supply your own theme through the [`useExternalTheme`](slug:telerikreporting/report-designer-tools/web-report-designer/web-report-designer-initialization) initialization option.

## How Theming Works

When the Web Report Designer initializes, it loads the following stylesheets, in order:

1. Its built-in Kendo UI theme, which provides the colors, fonts, and other Kendo UI component styles ("skin").
1. Its own structural CSS, which controls the layout of the toolbox, panes, canvas, and other designer-specific elements.
1. An icon font used throughout the designer's UI.

Only the first stylesheet, the Kendo UI theme, can be swapped out. The structural CSS and the icon font are always loaded, regardless of the `useExternalTheme` setting, so re-skinning the designer through an external theme does not affect its overall layout.

## Default Theme

By default (`useExternalTheme` not set, or set to `false`), the Web Report Designer automatically loads its built-in Kendo UI theme. No additional setup is required to get a fully styled designer.

## Using an External Theme

To use your own Kendo UI theme instead of the built-in one:

1. Set the `useExternalTheme` option to `true` when initializing the Web Report Designer. This prevents the designer from loading its built-in theme.
1. Add a `<link>` reference to your own Kendo UI theme stylesheet on the host page, **before** the Web Report Designer initializes. The referenced theme can be:
	- A stock Kendo UI theme (for example, Default, Material, Bootstrap, Classic, Meridian, or Fluent).
	- A custom theme generated with [ThemeBuilder](https://themebuilderapp.telerik.com/) (see [Styling the Web Report Designer with ThemeBuilder](slug:styling-the-web-report-designer-with-themebuilder)).

```html
<!-- Reference your own Kendo UI theme before the designer initializes -->
<link rel="stylesheet" href="path/to/your-theme.css" />
```

```javascript
$("#reportDesigner").telerik_WebReportDesigner({
	serviceUrl: "api/reports",
	report: "SampleReport.trdp",
	useExternalTheme: true
	// ... other options
});
```

> If `useExternalTheme` is set to `true` but no external theme stylesheet is referenced on the page, the Web Report Designer will render unstyled, as it will not load its built-in theme and no replacement theme will be available.

## See Also

* [Styling the Web Report Designer with ThemeBuilder](slug:styling-the-web-report-designer-with-themebuilder)
* [Web Report Designer Initialization](slug:telerikreporting/report-designer-tools/web-report-designer/web-report-designer-initialization)
* [Web Report Designer Customization](slug:telerikreporting/report-designer-tools/web-report-designer/web-report-designer-customization)
