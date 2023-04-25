---
title: Value cannot be null. Parameter name instance. when trying to open the Report Designer in Visual Studio 2017 or newer
description: "Learn how to fix the error 'Value cannot be null. Parameter name instance.' in Visual Studio 2017 or newer when trying to open the VS Report Designer."
type: troubleshooting
page_title: Cannot open report in Visual Studio Report Designer
slug: error-value-cannot-be-null-parameter-name-instance-vs2017-report-designer
position: 
tags: 
ticketid: 1156994
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Description

When attempting to bring up the Report Designer in  Visual Studio 2017 or later, an error with message `Value cannot be null. Parameter name: instance` is thrown. The stack trace of the error is:

````
at System.ComponentModel.TypeDescriptor.AddAttributes(Object instance, Attribute[] attributes)
at Microsoft.VisualStudio.Design.VSDesignSurface.CreateDesigner(IComponent component, Boolean rootDesigner)
at System.ComponentModel.Design.DesignerHost.AddToContainerPostProcess(IComponent component, String name, IContainer containerToAddTo)
at System.ComponentModel.Design.DesignerHost.PerformAdd(IComponent component, String name)
at System.ComponentModel.Design.DesignerHost.System.ComponentModel.Design.IDesignerHost.CreateComponent(Type componentType, String name)
at System.ComponentModel.Design.Serialization.DesignerSerializationManager.CreateInstance(Type type, ICollection arguments, String name, Boolean addToContainer)
at System.ComponentModel.Design.Serialization.DesignerSerializationManager.System.ComponentModel.Design.Serialization.IDesignerSerializationManager.CreateInstance(Type type, ICollection arguments, String name, Boolean addToContainer)
at System.ComponentModel.Design.Serialization.TypeCodeDomSerializer.Deserialize(IDesignerSerializationManager manager, CodeTypeDeclaration declaration)
at System.ComponentModel.Design.Serialization.CodeDomDesignerLoader.PerformLoad(IDesignerSerializationManager manager)
at Microsoft.VisualStudio.Design.Serialization.CodeDom.VSCodeDomDesignerLoader.PerformLoad(IDesignerSerializationManager serializationManager)
at Microsoft.VisualStudio.Design.Serialization.CodeDom.VSCodeDomDesignerLoader.DeferredLoadHandler.Microsoft.VisualStudio.TextManager.Interop.IVsTextBufferDataEvents.OnLoadCompleted(Int32 fReload)
````

## Solution

[The error]({%slug report-cannot-be-built-and-opened-in-vs-report-designer%}) indicates that the project uses a version of __Telerik Reporting__ that is not registered in the corresonding Visual Studio. This might be due to Telerik Reporting being installed before installation of the Visual Studio.

You should re-install Telerik Reporting with support for the particular Visual Studio version and edition.

You can download MSI file to install Telerik Reporting as described in the [How to download Telerik Reporting installer](%slug telerikreporting/installation%}#using-the-msi-file). After downloading the installer, our recommendation is to run the MSI file per Visual Studio edition:

* VS 2017 and VS 2019

	`msiexec /i [installer_file_name].msi PRODUCTDIR="C:\Program Files (x86)\Microsoft Visual Studio\[version]\[edition]"`

	_Example for VS 2019 Professional edition_:
	`msiexec /i Telerik_Reporting_R1_2023_SP1_DEV.msi PRODUCTDIR="C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional"`

* VS 2022

	`msiexec /i [installer_file_name].msi PRODUCTDIR="C:\Program Files\Microsoft Visual Studio\[version]\[edition]"`

	_Example for VS 2022 Professional edition_:
	`msiexec /i Telerik_Reporting_R1_2023_SP1_DEV.msi PRODUCTDIR="C:\Program Files\Microsoft Visual Studio\2022\Professional"`

In the code above the parameters are as follows:

1. `[installer_file_name].msi` - the exact name of the installer, and should look like `Telerik_Reporting_R1_2023_SP1_DEV.msi`.
1. `[version]` - the Visual Studio version - `2017`, `2019`, or `2022`.
1. `[edition]` - the Visual Studio edition - `Enterprise`, `Professional`, or `Community`.

Once Telerik Reporting is installed with support for the specific Visual Studio, you can load the project.

## Notes

The VS Report Designer is not fully functional in VS2017 for version of Telerik Reporting prior to [R1 2017 (11.0.17.118)](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-r1-2017-(version-11-0-17-118)).

The VS Report Designer is not fully functional in VS2019 for version of Telerik Reporting prior to [R2 2019 (13.1.19.514)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2019-13-1-19-514).

Therefore, our recommendation is to [upgrade]({%slug telerikreporting/upgrade/overview%}) the project to the newest version (check our [Release History](https://www.telerik.com/support/whats-new/reporting/release-history)) by running the [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}).
