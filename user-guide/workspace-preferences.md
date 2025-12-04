---
title: Configuring the User Preferences
page_title: Web Report Designer - Workspace Preferences
description: The Workspace Preferences section is designed to let users customize the look and behavior of their design environment for better productivity and comfort.
slug: web-report-designer-user-guide-workspace-preferences
tags: web, report, design, workspace, settings, preferences 
published: True
position: 9
---

# Adjusting User Preferences in Web Report Designer

The **Workspace Preferences** provide options for personalizing the Web Report Designer interface without affecting the actual report content. These settings are user-specific and typically stored in the browser.

<img style="border: 1px solid gray;" src="images/wrd-workspace-preferences.png" alt="Workspace Preferences" caption="Workspace Preferences" />

To open the **Preferences** panel:

1. Open the Web Report Designer in your browser.

1. Click the **Main Menu** at the top left corner.

1. Select **Workspace Preferences** from the menu options:

    <img style="border: 1px solid gray;" src="images/wrd-workspace-preferences-main-menu.png" alt="Workspace Preferences" /> 

The Workspace Preferences are split into two categories:
* [Snapping](#snapping)&mdash;this category lists the options related to the automatic alignment of objects on the design surface of the Web Report Designer.
* [General](#general)&mdash;this category list options related to the behavior of the Web Report Designer.

## Snapping

Snapping is a feature that detects alignment opportunities while designing the report. You can configure the following snapping options:

* **Snap to grid lines** (*Currently Not Supported*)—When enabled and you move or resize report items (like TextBoxes, Tables, Charts) on the design surface, their edges automatically align to the nearest grid line on the underlying grid system. When disabled, you can freely position items without restrictions.


    * Moving an item makes it jump to the nearest grid intersection.
    * Resizing an item makes its edges align with the grid lines.


* **Snap to snap lines**—Helps you position elements relative to each other (for example, aligning TextBoxes, Charts, or Tables). Snap lines appear temporarily as you drag items and they are based on the edges or centers of nearby items.

<img style="border: 1px solid gray;" src="images/wrd-workspace-preferences-snap-to-snap-lines.gif" alt="Snap to snap lines" /> 


>tip Snap to grid uses a static grid on the canvas, while snap lines are dynamic and context-sensitive, appearing only when items are close enough.

## General


* **Preserve open reports on exit**—Controls whether the designer remembers which reports were open when you closed the application and automatically restores them at the next launch.

* **Collect non-personal usage data**—Controls whether to collect non-personal usage data. The data contains usage information about the software's screens and tools and is being used to improve its functionality.

## See Also

* [Web Report Designer]({%slug user-guide/overview%})
