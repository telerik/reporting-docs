---
title: Report Shared Resources
page_title: Sharing resources within the Web Report Designer
description: "Learn how to add and reference shared resources like images and data in the Telerik Reporting Web Report Designer."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/shared-resources
tags: resources,Assets Manager,sharing
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
position: 6
previous_url: /designing-reports/report-designer-tools/web-report-designer/tools/
---

# Shared Resources in the Web Report Designer

Reports often need external resources to display and reference to achieve the desired outcome. These include any images that are used as branding or backgrounds, data files like CSV or JSON or shape data, and even style sheets to achieve common styling of your reports. Web Report Designer enables you to upload such resources to the server and reuse them wherever needed.

## Assets manager

The Assets Manager is opened from the main menu of the designer and is the tool that is used to organize all the resources on the server. The resources can be uploaded as files from the file system and then can be renamed, organized into folders, and deleted as needed. Any file can be downloaded on the file system as well when needed outside of the product.

The container folders can be organized as well by creating, renaming, and deleting them.

The Assets Manager displays the resources of the currently selected folder as big icons but can also be switched to display them in a grid view with columns that give additional details for each resource. Details can also be displayed using a dedicated details panel switched on from the `View Details` toggle in the top-right of the tool.

The primary benefit of using the Assets manager is to keep all needed resources in one place, on the server. The other benefit is that, once uploaded, the resources may be reused from multiple reports. This makes it easy to maintain the design language of the reports the same when the company logo gets renewed, or the company colors or fonts get a refreshment.

### Resource files organization

All stored resources reside in the __Assets__ root folder of the Assets Manager. By default, there are three subfolders of the Assets folder initially created by the Web Report Designer to organize your assets:

* __Data__ - to contain all the data files used as data sources in the reports like [CSV]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/csvdatasource-wizard%}), [JSON]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/jsondatasource-wizard%}), and [shape file used in a Map item]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-add-shapemapseries-to-the-map-item%});
* __Images__ - to contain all the images referenced in [PictureBox]({%slug telerikreporting/designing-reports/report-structure/picturebox%})-es, backgrounds, etc.;
* __Styles__ - to contain all the style sheets that can be used to achieve [common stylization]({%slug telerikreporting/designing-reports/styling-reports/using-styles-to-customize-reports%}) of your reports.

These predefined folders cannot be renamed and deleted from the end-users. However, the developer implementing the Web Report Designer can configure different predefined folders on the backend as needed. The end-users can only create and manage the subfolders of those predefined folders.

### Reports organization

The available reports on the server are listed in the Assets Manager as well. They reside in a dedicated `Reports` root folder and may be organized into subfolders when created or uploaded.

### Shared Data Sources organization

The available [`SharedDataSource`]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/shareddatasource-component%}) components are also listed in the Asset Manager. From here, they can be `Downloaded`, `Renamed` or `Deleted`.

## Resources usage

When a resource is needed to be referenced in a report as a value of a property, the Assets Manager may be opened by the respective property editor. Such properties are, for example, the `Value` property of the PictureBox item and the `Style` -> `BackgroundImage` property of any report item. If not already available, the needed resource can be uploaded and then selected for usage.

Naturally, the properties that need to reference a report, e.g., the target report of a [NavigateToreport interactive action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%}), also trigger the Assets Manager to do the job.
