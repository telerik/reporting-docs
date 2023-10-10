---
title: Customization
page_title: Web Report Designer Customization
description: "Learn more about the customization capabilities of the Telerik Web Report Designer and how to configure them."
slug: telerikreporting/report-designer-tools/web-report-designer/web-report-designer-customization
tags: report,webreportdesigner,customization
published: True
position: 8
---

# Web Report Designer Customization

Starting with R3 2023, the Telerik Web Report Designer provides customization options.

## Customization Options

The customization options the developer may pass to the client of the Web Report Designer in the latest Reporting version {{site.buildversion}} are:

* __Permissions__: a list of permissions that will be denied client-side

There are two approaches for providing the customization options to the ReportDesigner.

## Customizing Web Report Designer for All Users

The customization options like denied permissions may be configured for all users of the Web Report Designer through the corresponding property in the `ReportDesignerServiceConfiguration`.

````CSharp
services.TryAddSingleton((Func<IServiceProvider, IReportDesignerServiceConfiguration>)(sp => new ReportDesignerServiceConfiguration
{
	//...
	DeniedPermissions = ReportDesignerPermissionsBuilder.Build(
		Permission.Create_Components_ReportItems_PictureBox,
		Permission.Create_Components_ReportItems_HTMLTextBox
		)
}));
````

The above code will deny the Web Report Designer client to add PictureBox and HTMLTextBox items. The user will still be able to edit existing ones.

## Fine Tune the Customization in the Web Report Designer

By overriding the virtual methods exposed for the corresponding property.

For example, by overriding the virtual method `GetDeniedPermissions` you may create logic that returns different permissions per user.

### Example:

Sample implementation of the `GetDeniedPermissions`. The returned permissions are the ones that will be __denied__ to the user(s):

````CSharp
public override IActionResult GetDeniedPermissions()
{
	return this.Json(ReportDesignerPermissionsBuilder.Build(
		Permission.Create_Components_ReportItems_PictureBox,
		Permission.Create_Components_ReportItems_HTMLTextBox,
		Permission.Commands_Document_NewCombined,
		Permission.Commands_DataSources_SharedDataSource_Delete,
		Permission.Commands_DataSources_SharedDataSource_Edit,
		Permission.Commands_AssetsManager
		)
	);
}
````

