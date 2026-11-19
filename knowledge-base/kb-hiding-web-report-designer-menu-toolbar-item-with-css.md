---
title: Hiding the Web Report Designer Menu Toolbar Item with CSS
page_title: Hiding the Web Report Designer Menu Item with CSS | Telerik Reporting
description: Learn how to hide the Web Report Designer Menu toolbar item and its dropdown with CSS in the host page without hiding the rest of the toolbar.
type: how-to
slug: kb-hiding-web-report-designer-menu-toolbar-item-with-css
tags: webreportdesigner, menu, css, customization
published: True
res_type: kb
---

<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}

</style>

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 20.3.26.1110 | Telerik Reporting |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article shows how to hide the root **Menu** item and its dropdown in Web Report Designer while keeping the other toolbar controls visible.

The following screenshot shows the default **Menu** item and its open dropdown.

![Web Report Designer with the Menu dropdown open ><](images/kb-hiding-web-report-designer-menu-toolbar-item-with-css-default.png)

## Solution

Add the following `<style>` block to the `<head>` element of your `webReportDesigner.html` host page:

```html .skip-repl
<style>
  li.main-menu__item.root-menu {
    display: none !important;
  }
</style>
```

Reload the host page. The root **Menu** item and its nested dropdown are hidden, while the other toolbar items remain visible.

![Web Report Designer with the root Menu item and dropdown hidden ><](images/kb-hiding-web-report-designer-menu-toolbar-item-with-css-hidden.png)

## Notes

This CSS changes the rendered interface only. It does not change server-side authorization. To hide selected commands instead of the entire menu, use `DeniedPermissions`.

The selector targets CSS classes in the Web Report Designer markup. Verify it after you upgrade Telerik Reporting because the markup can change.

## See Also

* [Customizing individual Web Report Designer commands]({%slug telerikreporting/report-designer-tools/web-report-designer/web-report-designer-customization%})
