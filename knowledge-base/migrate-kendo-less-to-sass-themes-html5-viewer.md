---
title: Migrating Kendo UI from Less to Sass-Based Themes in the HTML5 Report Viewers
description: Learn how to migrate from Less-based to Sass-based Kendo UI themes after the HTML5 report viewers were refactored for Sass compatibility in Telerik Reporting version 19.1.25.521.
type: how-to
page_title: Migrate from Less to Sass Kendo UI Themes in HTML5 Report Viewers
slug: migrate-kendo-less-to-sass-themes-html5-viewer
tags: html5 report viewer, kendo, sass, less, themes, migration, upgrade
res_type: kb
---

## Environment

<table>
    <tbody>
        <tr>
            <td>Product</td>
            <td>Progress® Telerik® Reporting</td>
        </tr>
        <tr>
            <td>Version</td>
            <td>19.1.25.521 and later</td>
        </tr>
    </tbody>
</table>

## Description

Starting with version **19.1.25.521**, the HTML5-based report viewers have undergone major refactoring to become compatible with the newest [Sass-based Kendo UI themes](https://www.telerik.com/kendo-jquery-ui/documentation/styles-and-layout/sass-themes/overview). If your application still references Less-based Kendo UI themes after an upgrade, consider migrating to their Sass-based equivalents to ensure the viewers continue to render correctly.

## Solution

### Step 1: Check Whether You Are Using a Less-Based Theme

Less-based Kendo UI themes are identified by multiple CSS file references that follow this naming pattern:

- `kendo.common.min.css`
- `kendo.[theme-name].min.css`
- `kendo.mobile.min.css`

If you use a single CSS file such as `kendo.default-ocean-blue.min.css`, you are already on a Sass-based theme and no migration is required.

For more details, refer to the [How Do I Know If I Am Using a Less Theme?](https://www.telerik.com/kendo-jquery-ui/documentation/styles-and-layout/less-themes/less-themes-migration#how-do-i-know-if-i-am-using-a-less-theme) section of the Kendo UI documentation.

### Step 2: Migrate to a Sass-Based Theme

Follow the steps in the Kendo UI [Less to Sass Theme Migration](https://www.telerik.com/kendo-jquery-ui/documentation/styles-and-layout/less-themes/less-themes-migration) article to replace your Less theme references with their Sass counterparts.

### Step 3: Use the Correct Theme Version for Your Telerik Reporting Release

Each Telerik Reporting version depends on a specific version of the Kendo UI theme. To find the correct version for your release:

1. Open the [Upgrade Overview](slug:telerikreporting/upgrade/overview) and navigate to the upgrade path article for your Telerik Reporting version.
1. In the upgrade article, find the **HTML5 Report Viewer Dependencies** section. The required Kendo UI Themes version is listed there.

For example, the [2026 Q1 (20.0.26.424)](slug:telerikreporting/upgrade/2026/2026-q1-20-0-26-424) upgrade article specifies **Telerik Kendo UI Themes (12.3.0)**. Use that version number in your CDN theme reference:

```html
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/themes/12.3.0/default/default-ocean-blue.css" />
```

## See Also

- [Less to Sass Theme Migration (Kendo UI for jQuery)](https://www.telerik.com/kendo-jquery-ui/documentation/styles-and-layout/less-themes/less-themes-migration)
- [Upgrade Overview](slug:telerikreporting/upgrade/overview)
