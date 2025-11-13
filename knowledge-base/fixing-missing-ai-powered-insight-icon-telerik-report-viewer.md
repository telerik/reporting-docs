---
title: Fixing Missing AI-Powered Insight Icon in Telerik Report Viewer
description: Resolving the issue of missing AI-Powered Insight icon in Telerik Report Viewer toolbar when using font icons.
type: how-to
page_title: How to Fix Missing AI-Powered Insight Icon in Telerik Report Viewer
meta_title: How to Fix Missing AI-Powered Insight Icon in Telerik Report Viewer
slug: fixing-missing-ai-powered-insight-icon-telerik-report-viewer
tags: reporting, report viewer, ai-powered insight, font-icons, missing icon
res_type: kb
ticketid: 1702866
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td> Reporting Report Viewer </td>
</tr>
<tr>
<td> Version </td>
<td> 19.2.25.1001 </td>
</tr>
</tbody>
</table>

## Description

In the Telerik Report Viewer toolbar, the AI-Powered Insight icon may not display correctly when using the classic theme and font icons. This happens because the icon source is different from the other toolbar icons. The AI icon is sourced from `Content/kendo/font-icons/index.css`, while the other icons are loaded from `api/reports/resources/font/fonticons-19.2.25.1001.css`. This mismatch causes the browser to fail to render the AI icon.

This knowledge base article also answers the following questions:
- Why is the AI-Powered Insight icon not visible in Telerik Report Viewer?
- How to resolve missing AI-Powered Insight toolbar icons in Telerik Report Viewer?
- What CSS adjustments are needed for the AI-Powered Insight icon?

## Solution

To resolve the missing AI-Powered Insight icon issue, follow these steps:

1. Ensure `Content/kendo/font-icons/index.css` is correctly loaded in your main layout or the page where the Report Viewer is rendered. Add the following line:
    ```html
    <link href="~/Content/kendo/font-icons/index.css" rel="stylesheet" />
    ```

2. Perform a hard refresh by pressing `Ctrl + Shift + R`, or clear the browser cache to ensure all resources load properly.

3. If the issue persists, override the AI icon class in your custom CSS file. Use the following code to map the AI icon to a similar icon from the loaded font:
    ```css
    .k-i-ai-prompt::before {
        content: "\e900"; /* Unicode for a similar icon */
        font-family: 'FontIcons'; /* Match your loaded font family */
    }
    ```

4. Alternatively, embed the SVG of the AI icon directly in your CSS with the following syntax:
    ```css
    .k-svg-i-sparkles::before {
        content: "";
        display: inline-block;
        width: 24px;
        height: 24px;
        background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512'><path d='m320 32 54.3 137.7L512 224l-137.7 54.3L320 416l-54.3-137.7L128 224l137.7-54.3zM94 350 0 384l94 34 34 94 34-94 94-34-94-34-34-94zM70.6 70.6 0 96l70.5 25.5L96 192l25.5-70.5L192 96l-70.5-25.5L96 0 70.5 70.5Z'></path></svg>");
        background-size: contain;
        background-repeat: no-repeat;
    }
    ```
    Note: Adding `xmlns='http://www.w3.org/2000/svg'` in the SVG syntax ensures proper rendering.

5. If embedding the SVG does not work, download the Kendo font icons (`kendo-font-icons.ttf`) from [Font Icons in the Telerik and Kendo UI Design System](https://www.telerik.com/design-system/docs/foundation/iconography/font-icons/) and add them to your project. Create a custom `@font-face` definition in your CSS file:
    ```css
    @font-face {
        font-family: 'KendoIcons';
        src: url("../Resources/kendo-font-icons.ttf");
        font-weight: normal;
        font-style: normal;
    }

    .k-i-sparkles:before {
        font-family: 'KendoIcons';
        content: "\e088";
    }
    ```

## See Also

- [AI-Powered Insights in Report Preview - Telerik Reporting](https://docs.telerik.com/reporting/interactivity/ai-powered-insights-overview)
- [How to Customize the AI-Powered Insights - Telerik Reporting](https://docs.telerik.com/reporting/interactivity/customizing-ai-powered-insights)
- [Font Icons in the Telerik and Kendo UI Design System](https://www.telerik.com/design-system/docs/foundation/iconography/font-icons/)
- [List of Icons in the Telerik and Kendo UI Web Components Icons System](https://www.telerik.com/design-system/docs/foundation/iconography/icon-list/)
