---
title: Creating and Using Report Templates 
page_title: Creating and Using Report Templates in Web Report Designer
description: Learn more about Report Templates in the Telerik Reporting Web Report Designer, how to create and reuse them.
slug: web-report-designer-report-templates
tags: web, report, designer, wrd, report, template, trtx
published: True 
position: 9 
---

<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}
</style>

# Configuring Report Templates in Web Report Designer

|Minimum Version:|Q4 2025|
|----|----|

Web Report Designer offers functionality for working with report templates. It allows the developers to configure a specific folder for storing the report templates and to manage the access to this specific folder for certain users.

## Configure Report Templates Folder

All report templates are stored in a specific **Report Templates** folder. A default folder will be created at root level of your project. You can also navigate to a specific custom folder that contains all the report templates you wish to use.

The [ReportDesignerServiceConfiguration]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-5-and-.net-core-3.1-applications%}#add-configuration-settings-in-the-startupcs-file) class provides a configuration setting for specifying the **TemplateDefinitionStorage**. Thus, you can navigate to a specific folder that stores all report templates:

````CSharp
services.TryAddSingleton<IReportDesignerServiceConfiguration>(sp => new ReportDesignerServiceConfiguration
{
	TemplateDefinitionStorage = new FileTemplateDefinitionStorage("templates_folder_path", new[] { "sub_folder_to_exclude" }),
});
````

>note Report templates (.trtx files) can be stored only in the configured `Report Templates` folder. Other file formats are not allowed in the folder.

## Managing Permissions

To restrict specific actions or features for users on the client side, for example to restrict `Report Templates`, the [DeniedPermissions]({%slug telerikreporting/report-designer-tools/web-report-designer/web-report-designer-customization%}) setting of the **ReportDesignerServiceConfiguration** can be used. It allows developers to customize the designer experience by disabling certain tools, components, or capabilities based on application logic or user roles.

>note You can override the [GetDeniedPermissions]({%slug telerikreporting/report-designer-tools/web-report-designer/web-report-designer-customization%}) method in your custom implementation of the reporting service to apply different restrictions based on the logged-in user or other conditions.

#### Restricting the Templates Folder

````CSharp
services.TryAddSingleton<IReportDesignerServiceConfiguration>(sp => new ReportDesignerServiceConfiguration
{
    DeniedPermissions = ReportDesignerPermissionsBuilder.Build(
        Permission.Commands_AssetsManager_ReportTemplates
        )
}));
````

Once the end-user is not granted permissions for the Report Templates, the following actions are available:

* Create a New Report from a Template - The **From Template** option is still *visible* but *restricted*. The restricted user is not allowed to create new or upload templates, delete or edit any existing templates. However, consuming the already existing templates is allowed.

|Restricted User|Default User|
|----|----|
|![Restricted User From Template ><](images/web-report-designer-report-templates-restricted-user.png)|![Allowed User From Template ><](images/web-report-designer-report-templates-allowed-user.png)| 

* **Assets manager** - When a *restricted* user opens the Assets Manager, the `Report Templates` folder is invisible:

|Restricted User|Default User|
|----|----|
|![Restricted User Assets Manager ><](images/web-report-designer-report-templates-restricted-user-assets-manager.png)|![Allowed User Assets Manager ><](images/web-report-designer-report-templates-allowed-user-assets-manager.png)|     

* **Save Report As** - The *restricted* end-user can only save as a **Report**. The option for saving as a **Template** is hidden. 

|Restricted User|Default User|
|----|----|
|![Restricted User Assets Manager ><](images/web-report-designer-report-templates-restricted-user-save-as.png)|![Allowed User Assets Manager ><](images/web-report-designer-report-templates-allowed-user-save-as.png)|    

## See Also

* [How to Edit a Report Template]({%slug web-report-designer-how-to-edit-a-report-template%})
* [Working with Report Templates]({%slug web-report-designer-report-templates%})
