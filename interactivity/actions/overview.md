---
title: Overview 
page_title: Interactive Actions in Reports
description: "Learn how to add all kinds of interactive actions(predefined or custom) to your reports via the Edit Action dialog."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/overview
tags: overview
published: True
position: 0
previous_url: /designing-reports-interactivity-actions, /interactivity/actions/
reportingArea: General
---

# Actions Overview

You can add interactive actions that allow users to open Web pages or other reports, jump to another location within the same report or drilldown to detail data. To add an interactive action, you define an `Action` on a report item. Use the [Edit Action dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-action-dialog%}) to set the type of interactive action. When the user clicks that report item, the action that you define takes place. The report engine supports the following action types: 

* `Navigate to Report` : Jump to other reports from the main report (Drillthrough report). 

* `Navigate to Bookmark` : Jump to areas within a report. 

* `Navigate to Url` : Jump to external web URLs that specify the address of web pages. 

* `Toggle Visibility` : Show or hide report items within the same report. 

* `Sorting` : Apply sorting on report items like `Table` , `Crosstab` or `Graph`. 

* `Custom` : An action that contains collection of parameters that are evaluated during report processing. 

> The actions are feature of the report viewers and not of the rendering extension. You can find more info about the supported interactive features in each format by checking the Interactivity section of the respective articles in [Design Considerations for Report Rendering Overview]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/overview%}) help section. 

## See Also

 * [Interactive Action Events]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/interactive-action-events%})
