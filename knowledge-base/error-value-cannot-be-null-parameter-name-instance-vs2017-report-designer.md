---
title: Value cannot be null. Parameter name instance. when trying to open the Report Designer in Visual Studio 2017
description: VS Report Designer cannot be opened in VS 2017
type: troubleshooting
page_title: Exception while opening report is VS 2017 Report Designer
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
When attempting to bring up the Report Designer in  Visual Studio 2017, an error with message _'Value cannot be null. Parameter name: instance'_ is thrown. The stack trace of the error is:
```
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
```


## Solution
[The error](http://docs.telerik.com/reporting/troubleshooting-upgrading#report-cannot-be-built-and-opened-in-visual-studio-report-designer) indicates that the project uses a version of _Telerik Reporting_ that is not registered in Visual Studio 2017\. This might be due to Telerik Reporting being installed before installation of Visual Studio 2017.

You should re-install Telerik Reporting with support for Visual Studio 2017.
You can download MSI file to install Telerik Reporting as described in the [How to download Telerik Reporting installer](https://docs.telerik.com/reporting/installation-installing-from-msi#how-to-download-telerik-reporting-installer).
After downloading the installer, our recommendation is to run the MSI file per Visual Studio edition:

```
msiexec /i [installer_file_name].msi PRODUCTDIRVS2017ENTERPRISE="C:\Program Files (x86)\Microsoft Visual Studio\2017\[edition]"
```

In the code above **[installer_file_name].msi** is the exact name of the installer, and should look like _Telerik_Reporting_R1_2018_SP2_DEV.msi_.
The second parameter **[edition]** is the Visual Studio edition - _Enterprise_, _Professional_, or _Community_.

Once Telerik Reporting is installed with support for VS2017, you can load the project in Visual Studio.  
  
The VS Report Designer is not fully functional in VS2017 for version of Telerik Reporting prior to R1 2017\.  
Therefore, our recommendation is to [upgrade](https://docs.telerik.com/reporting/installation-upgrading-newer-version) the project to the newest version (check our [Release History](https://www.telerik.com/support/whats-new/reporting/release-history)) by running the [Upgrade Wizard](https://docs.telerik.com/reporting/ui-upgrade-wizard).  

