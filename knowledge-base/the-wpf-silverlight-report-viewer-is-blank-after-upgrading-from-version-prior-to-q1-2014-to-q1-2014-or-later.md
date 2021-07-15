---
title: The WPF/Silverlight report viewer is blank  after upgrading from version prior to Q1 2014 to Q1 2014 or later
description: The WPF/Silverlight report viewer is blank  after upgrading from version prior to Q1 2014 to Q1 2014 or later.
type: how-to
page_title: The WPF/Silverlight report viewer is blank  after upgrading from version prior to Q1 2014 to Q1 2014 or later
slug: the-wpf-silverlight-report-viewer-is-blank-after-upgrading-from-version-prior-to-q1-2014-to-q1-2014-or-later
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
			<td>Q1 2014+</td>
		</tr>
	</tbody>
</table>

## Description

Starting from **Telerik Reporting Q1 2014** both the Silverlight and WPF report viewers will support only the **implicit styling**, i.e. style without the **x:Key** attribute. For more information regarding the implicit styling please check the related help article - [Setting a Theme (Using Implicit Styles)](../wpf-report-viewer-implicit-styles). Please note that this is valid only for the report viewer - if you have controls that need the style manager and the new report viewer that supports only implicit styling, you can still do that.
 
After upgrading to **Q1 2014** both WPF/Silverlight report viewers may become blank. That is because the themes are no longer *embedded* in the assembly and are instead distributed as *separate* files. This means that the report viewer has no theme applied and it becomes blank. In order to apply a theme you will have to migrate from **Style Manager** to **Implicit Styling**.

## Solution
 
1. Add references to the following Telerik UI for WPF assemblies, which are usually located at the folllowing path:

 For WPF - *C:\Program Files (x86)\Progress\Telerik Reporting < Version >\Bin\WpfViewerDependencies*
 
 For Silverlight - *C:\Program Files (x86)\Progress\Telerik Reporting < Version >\Bin*
 
 In case you are still not prepared to migrate to implicit styling you can use the binaries that include the xaml. However, you will still have to add all the xaml files mentioned in the next step, otherwise the Report Viewer will not show up as it will have no style:

 - **Telerik.Windows.Controls.dll**
 - **Telerik.Windows.Controls.Input.dll**
 - **Telerik.Windows.Controls.Navigation.dll**
 - **Telerik.ReportViewer.Wpf.dll** (for Silverlight it is **Telerik.ReportViewer.Silverlight.dll**)

2. Add the respective xaml files for the desired theme. The themes are usually located at the following paths:

For WPF -  *C:\Program Files (x86)\Progress\Telerik Reporting < Version >\Wpf\Themes*

For Silverlight - *C:\Program Files (x86)\Progress\Telerik Reporting < Version >\Silverlight\Themes*

 - **System.Windows.xaml**
 - **Telerik.Windows.Controls.xaml**
 - **Telerik.Windows.Controls.Input.xaml**
 - **Telerik.Windows.Controls..Navigation.xaml**
 - **Telerik.ReportViewer.Wpf.xaml** (for Silverlight it is **Telerik.ReportViewer.Silverlight.xaml**)

3. Remove the **telerikControls:StyleManager.Theme=”Vista”** attribute from the report viewer - it is no longer required since the style manager is no longer used. Instead the themes are applied implicitly to all report viewers in the application, without setting any attribute.

4. Build, run and test the project.

   
> Note
> <br/>
> If you are moving to a newer version of the controls, both the *xaml files* and the *assemblies* have to be **updated**.
 
 


