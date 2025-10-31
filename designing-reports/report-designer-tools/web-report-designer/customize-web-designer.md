---
title: Customization
page_title: Web Report Designer Customization
description: "Learn more about the customization capabilities of the Telerik Web Report Designer and how to configure them."
slug: telerikreporting/report-designer-tools/web-report-designer/web-report-designer-customization
tags: report,webreportdesigner,customization
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
position: 8
---

# Web Report Designer Customization

Starting with [R3 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010), the Telerik Web Report Designer can be customized either for all users or for particular users based on certain criteria.

## Customization Options

Customization options the developer may pass to the client of the Web Report Designer in the latest Telerik Reporting version {{site.buildversion}}:

* __DeniedPermissions__: a list of permissions that will be denied to the user client-side

There are two approaches for providing the customization options to the ReportDesigner.

## Customizing Web Report Designer for All Users

The customization options like denied permissions may be configured for all users of the Web Report Designer through the corresponding property in the [ReportDesignerServiceConfiguration](/api/telerik.webreportdesigner.services.reportdesignerserviceconfiguration). For the permissions, this is the property [DeniedPermissions](/api/telerik.webreportdesigner.services.reportdesignerserviceconfiguration#Telerik_WebReportDesigner_Services_ReportDesignerServiceConfiguration_DeniedPermissions):

````CSharp
services.TryAddSingleton((Func<IServiceProvider, IReportDesignerServiceConfiguration>)(sp => new ReportDesignerServiceConfiguration
{
	DeniedPermissions = ReportDesignerPermissionsBuilder.Build(
		Permission.Create_Components_ReportItems_PictureBox,
		Permission.Create_Components_ReportItems_HTMLTextBox
		)
}));
````

The above code will deny the Web Report Designer client to add _PictureBox_ and _HTMLTextBox_ items. The user will still be able to edit existing ones.

## Fine Tune the Customization in the Web Report Designer

The Web Designer may customized per user or based on other conditions by overriding the Reporting REST Service virtual methods exposed for the corresponding property.

For example, by overriding the virtual method [GetDeniedPermissions](/api/telerik.webreportdesigner.services.controllers.reportdesignercontrollerbase#Telerik_WebReportDesigner_Services_Controllers_ReportDesignerControllerBase_GetDeniedPermissions) you may create logic that returns different permissions per user.

### Example:

A sample implementation of the `GetDeniedPermissions`. The returned permissions are the ones that will be __denied__ to the user(s):

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

The code above denies the users (all in this case) to add _PictureBox_ and _HTMLTextBox_ items. It also hides the menu command for creating ReportBook _Document_ > _NewCombined_, forbids the user to delete and edit an existing _SharedDataSource_, and hides the _AssetsManager_.

## See Also

* [Customizing Report Parameters Area in Web Report Designer using CSS and JavaScript]({%slug customize-report-parameters-area-web-report-designer%})
