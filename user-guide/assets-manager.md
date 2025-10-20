---
title: Sharing Resources
page_title: Web Report Designer - Assets Manager
description: To share resources when crafting reports in Telerik Reporting and the Web Report Designer, you use the Assets Manager.
slug: web-report-designer-user-guide-assets-manager
tags: web, report, design, tool, create, started 
published: True
position: 8
---
<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}
</style>

# Sharing Resources with Assets Manager

To share resources (like company logo, data files) when crafting reports in the [Web Report Designer](https://demos.telerik.com/reporting/designer), Telerik Reporting offers the **Assets Manager** tool. It is designed to help report authors manage shared resources used across multiple reports. It provides centralized resource management which allows uploading, organizing, renaming, and deleting various types of assets directly on the server. The **Assets Manager** ensures a unified consistent look and feel across reports and enables teams to work together - data experts can manage sources, while designers focus on presentation.
 
![Assets Manager ><](images/wrd-assets-manager.png) 

## What Resources You Can Share

You can share and reuse:

* **Images** (e.g., logos, backgrounds): Suitable for using a company logo accross multiple reports when the logo is stored at one centralized place.

* **Data files** (e.g., CSV, JSON, shapefiles): Share common data that can be reused accross multiple users.

* **Stylesheets** (for consistent report styling): Styles created in a report can be exported and then used in other reports. 

* **Shared Data Sources** (predefined connections to data): Enable report designers to easily create and reuse a data source component across multiple reports.

* **Report Templates** (.trtx file): Offer initial report layout and styling, and allow creating reports with consistent look and feel.

Once uploaded, assets can be reused in multiple reports, ensuring consistency and reducing duplication. For example, updating a company logo in the Assets Manager updates it across all reports using that asset.

## Getting Started with Resource Sharing

To invoke the Assets Manager in the Telerik Web Report Designer, follow these steps:

1. Launch the Web Report Designer in your browser.

1. Click the **Main Menu** at the top left corner.

1. Select "Assets Manager" from the menu options:

    ![Assets Manager Main Menu><](images/wrd-assets-manager-main-menu.png)  

You do not always need to go through the menu. When you are editing a report item like a PictureBox, just click the asset picker next to the `Value` field. This will instantly open the Assets Manager so you can select an image right away:

<iframe width="560" height="315" src="https://www.youtube.com/embed/krtf6XxVKfE?si=vHgJ6gwSYen7Y1ML" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Default Folders

Several default folders that help organize shared resources for use across multiple reports are created automatically and cannot be renamed or deleted by end-users, though developers can configure them differently on the backend.

The main root folder contains three predefined subfolders: 

* **Data** (Stores data files like .csv, .json, and shapefiles used in Map items)

* **Images** (Contains image files used in PictureBox items, backgrounds, logos, etc.)

* **Styles** (Holds stylesheets (e.g., .trdx, .css) used for consistent styling across reports.

Users can create subfolders within these categories to better organize their assets. Developers can configure different predefined folders on the backend if needed.

### Reports

The `Reports` folder is a dedicated folder for storing report definitions which includes all available reports on the server. It is possible to organize them into subfolders, grouping the reports by category, department, or purpose. Shared reports that can be reused as SubReports in other designs.

### Shared Data Sources

The [Shared Data Sources]({%slug shared-data-source-web-report-designer-user-guide%}) folder within the Assets Manager contains reusable data source definitions (.sdsx files) that can be shared across multiple reports. Each .sdsx file encapsulates the configuration for a data source, including: Connection strings, Queries or endpoints, Parameters, Metadata (e.g., name, description).

## What Enhanced UI Features Can Be Used

To help you manage your shared resources with ease and flexibility the Assets Manager is packed with a rich set of UI intuitive features:

* **Choose Your View: Grid or List**

    Prefer a visual layout or a compact list? You can switch between Grid View and List View depending on your workflow. Grid View even supports column resizing for better visibility.

    |Grid View|List View|
    |----|----|
    |![Assets Manager Grid View><](images/wrd-assets-manager-grid-view.png) |![Assets Manager List View><](images/wrd-assets-manager-list-view.png) |

* **Manage Files Effortlessly**: Upload, download, rename, move, or delete files and folders - all in one place. You can even drag and drop files directly into the manager for quick uploads.

* **View Asset Details Instantly**: Want to see more info about a file? Just select an asset and toggle the `View Details` button. A panel on the right will show metadata like file name, type, and size:

    ![Assets Manager View Details><](images/wrd-assets-manager-view-details.gif) 

* **Quick Access to Recent Assets**: No need to search for files you just used - your recently accessed assets are tracked and easily accessible.

    ![Assets Manager Recently Used><](images/wrd-assets-manager-recently-used.png)  

* **Organize Reports for Report Books**: If you are creating a Report Book, use the Assets Manager to select and organize individual reports into a cohesive, multi-report document.

## See Also

* [Web Report Designer]({%slug user-guide/overview%})
