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

Starting with R3 2023, the Telerik Web Report Designer provides customization options. The available customization options are listed in the `Permission` enumeration.

There are two approaches for providing the customization options to the ReportDesigner.

## Customizing Web Report Designer for All Users

The permissions may be configured for all users of the Web Report Designer in the `ReportDesignerServiceConfiguration`.

## Fine Tune the Permissions in the Web Report Designer

By overriding the virtual method `GetDeniedPermissions` you may create logic that returns different permissions per user or based on other conditions.

### Example:

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

