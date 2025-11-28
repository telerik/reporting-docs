---
title: Accessibility
page_title: Accessibility features in Telerik Reporting
description: "Find out what accessibility features are suported in the HTML5-based viewers and HTML5-rendered report contents. Understand how to set up accessibility and what its known limitations are."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/accessibility
tags: HTML5, accessibility
published: True
position: 10
previous_url: /html5-report-viewers-accessibility-support
reportingArea: General
---

<style>
table th:first-of-type {
	width: 30%;
}
</style>

# Accessibility Overview

Telerik Reporting aims to provide a reporting solution accessible to a wider user audience. This includes users with motor control restrictions and ones working with assistive technologies. In our product we follow the recommended practices in [Section 508 of the Rehabilitation Act](https://www.section508.gov/) and [Web Content Accessibility Guidelines (WCAG) 2.0](https://www.w3.org/TR/WCAG20/), building our web content according to standards set by [WAI-ARIA](https://www.w3.org/WAI/ARIA/apg/).

## Setting up accessibility features in HTML5-based viewers

The accessibility features are enabled or disabled using an optional boolean parameter named __enableAccessibility__ (the exact letter casing varies among the HTML5-based viewers). The default value of this property is __false__ (no additional accessibility markup is emitted). This option also affects the accessibility of the exported PDF documents, i.e. if __enableAccessibility__ is set to __true__, the exported PDF will be created according to [PDF/UA (ISO standard 14289-1)](https://en.wikipedia.org/wiki/PDF/UA) specification.

The accessibility codebase is part of the *telerikReportViewer.{product version}.js* file. This file can be found in the __\bin\js__ subfolder of the Telerik Reporting installation folder. The product also provides a minified version of the script, which can be used in production environments.

The accessibility script operates using the DOM elements from the [viewer template]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-overview%}), so if you have modified the template, you will probably need to apply changes to the accessibility part of the script as well.

The accessibility script captures the keyboard events to provide shortcut key access to the viewer areas. It is possible some of these shortcuts to interfere with the default browser behavior. In this case the keys mapping can be changed through the [accessibilityKeyMap(keyMap)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap(keymap)%}) method or by editing the *telerikReportViewer.{product version}.js* file manually.

The accessibility script supports localization. You can modify its message and label strings, following the procedure, described in the article [Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization%}).

> Please note that all the dynamically provided markup, added when the accessibility is enabled, might result in a small performance penalty, especially on machines with outdated hardware. For best experience we recommend to enable the accessibility features conditionally according to your user's needs.

## Supported accessibility features in HTML5-based viewers

Our HTML5-based report viewers support the following important accessibility features:

|   |   |
| ------ | ------ |
| __Comprehensive keyboard support__ |Includes navigation between and into report viewer areas (menu, parameters, document map, contents) using shortcut keys, TAB or arrow keys where possible. The menu commands and expandable menu items are toggled on ENTER. The same key mapping is applied to document map and parameters areas.The default shortcut keys for navigation between the viewer areas are:<ul><li>__Ctrl+Alt+M__ - menu area</li><li>__Ctrl+Alt+P__ - parameters area (if visible). To navigate to the parameters area splitbar, press __Shift + Tab__ or __Tab__ based on the parameters area position</li><li>__Ctrl+Alt+D__ - document map area (if visible). To navigate the document map area splitbar, press __Shift + Tab__ or __Tab__ based on the document map area position</li><li>__Ctrl+Alt+C__ - report viewer contents area (the report currently rendered in the viewer)If needed, the default key mapping can be changed, using the report viewer's API method [accessibilityKeyMap(keyMap)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap(keymap)%}).</li></ul>|
| __Dynamically generated descriptions for report viewer areas__ |The report viewer areas provide additional textual details that reflect the currently presented information. This applies to the state of the menu buttons (enabled, disabled, expandable, etc.), the parameters state and their selected values, the currently selected node from document map and the rendered report. This information refreshes dynamically with every change that occurs in the viewer - for example when a new page is loaded or when an exception is thrown while processing the report.|
| __Textual description to a non-textual items__ |In a rendered report all graphic items like images, maps and charts provide additional information about their contents. Tables and crosstabs provide such information about the currently focused cell, marking the current row, column and value. These details are visible and recognizable by the most popular screen readers to help users with visual disabilities better understand the presented report. A comprehensive list with the supported report items features can be found in the next section.|

## Supported accessibility features in HTML5-rendered report contents

All the report items have a property called [AccessibleDescription](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_AccessibleDescription). The property value is an expression and it determines what will be the accessibility label when the report is rendered. Its value is set as an [alternate text](https://www.w3schools.com/tags/att_img_alt.asp) for images in __PictureBox__ items and as an accessible label for the other elements. According to [ARIA specifications](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA), the attribute that should be used in scenarios, where no text labeling element is available, is [aria-label](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-label).

The value of __aria-label__ attribute is created using the following pattern: `{type} {additional information} {description} `:

* __{type}__ is a placeholder that contains the type name of the currently rendered element - "Details section", "Text box", "Table", etc. The report item names are localizable and can be substituted with any appropriate strings, even with empty values, if there is no need to include the report item name in the label.
* __{additional information}__ is intended to give some meaningful information about the context where the current item is in, or about its additional properties. The cases where it is most useful, are:

	+ if the current item has some interactive action set, this token will contain the type of the action.
	+ if the current item is __Table__ or __Crosstab__ and __paged__ HTML rendering is used, the token will contain information about the row and column count.
	+ if the current item is nested in a __Table__ or __Crosstab__ and __paged__ HTML rendering is used, the token will contain information about the current cell's row and column zero-based index. Additionally, if the cell is used as a header, this information will be included in the label as well.
	+ if the current item is a __CheckBox__, the token will contain information about the current checkbox status (checked/unchecked).

* __{description}__ provides relevant information about the current item contents. Its value is evaluated using the item's *AccessibleDescription* property and if it is empty, falls back to the item's *Value* or *Text* property, whichever is available.

For example, if a report contains a __TextBox__ with `Value = "Sorts by Category"`, that performs a sorting action and is nested in a table's first (header) row and third column, the generated *aria-label* value in **paged** HTML rendering will be: *Text box. Performs a sorting action. Column header. Column 2 Row 0. Sorts by Category.*

> The additional information stored in the __aria-label__ attribute of Table/Crosstab items and items semantically related to them is "shortened" when the HTML5 **interactive** rendering is used. This is done to avoid redundancy because the [ARIA Table pattern](https://www.w3.org/WAI/ARIA/apg/patterns/table/) has been implemented for the **interactive** HTML rendering.

As of Telerik Reporting version __R1 2023 SP1__, all report items have an additional property called [AccessibleRole](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_AccessibleRole). The property value is an expression and it determines the HTML __role__ attribute of each report item. *Currently, when no explicit value is provided, an appropriate placeholder will be calculated only for Table/Crosstab items*. In addition, the [ARIA Table pattern](https://www.w3.org/WAI/ARIA/apg/patterns/table/) has been implemented for Table/Crosstab items using [ARIA Roles](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles).

> It is important to remember that, currently, the [ARIA Table pattern](https://www.w3.org/WAI/ARIA/apg/patterns/table/) is implemented only when the **HTML5 Interactive** *(not paged)* rendering is used. Thus, when a report is displayed with **paged** HTML, no [ARIA Roles](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles) will be added, and instead additional information will be shown in the **aria-labels** of Table/Crosstab items and their relatives, as described in the bullet points above.

## Known issues

Most of the currently known issues are due to the fact that the widely used screen readers behave differently with different browsers. Additionally, the most common browsers support accessible content to a various extent. The following table shows the known issues by browser and screen reader (where applicable):

| Browser | Screen reader | Description |
| ------ | ------ | ------ |
|Firefox 55.0.3+|-| __Export__ menu item cannot be toggled through keyboard.|
|Chrome|JAWS|After exporting a document, JAWS stops reading the content.|
|Chrome|JAWS|Page number editor text is not read.|
|Chrome|JAWS|Document map items are not read.|
|Chrome|JAWS|Toggle visibility actions are not executed.|
|Edge|Narrator|Document map items are not read.|

Note that software vendors consistently upgrade and improve their products, so any of the above issues can be fixed by a third-party program update.
