---
title: VB Projects cannot be built due to the usage of the Global Namespace
description: VB Projects cannot be built due to the usage of the Global Namespace.
type: how-to
page_title: VB Projects cannot be built due to the usage of the Global Namespace
slug: vb-projects-cannot-be-built-due-to-the-usage-of-the-global-namespace
res_type: kb
---

## Description  
VB Projects cannot be built due to the usage of the Global Namespace. This happens when classes are held in different than the root namespace in Visual Basic projects.  
  

Typical errors received on build are:  

```
Type 'Telerik.Reporting.TextBox' is not defined.   
Type 'Telerik.Reporting.ReportItemBase' is not defined.
Type 'Telerik.Reporting.Report' is not defined.
Type 'Telerik.Reporting.XXXX' is not defined.  
```  

When you open the report's *Designer.VB* file you will find that lines like:  

```vb
Me.TextBox1 = New Telerik.Reporting.TextBox()
```

are underlined as error lines.  

Changing the line as follows should resolve the error:  

```vb
Me.TextBox1 = New Global.Telerik.Reporting.TextBox()
```  

The issue is that changing a setting of the report will cause the Reporting engine to re-serialize the code in the report's *Designer.VB* file without the custom Global namespace.  
  
## Solution  

Open the project's Properties in Visual Studio and remove the Root Namespace, leave it blank. This will let you skip the Global namespace on specifying types.  

For more details, please check [How to: Change the Namespace for an Application (Visual Basic)](https://
dn.microsoft.com/en-us/library/xedasdww%28v=vs.100%29.aspx) MSDN article.
    

## Note

If the above changes do not resolve the listed errors, double-check if the required Telerik Reporting assemblies are referenced, and run the [Upgrade Wizard](../ui-upgrade-wizard) to update all settings.

