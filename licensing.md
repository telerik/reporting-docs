---
title: Licensing
page_title: Licensing 
description: Licensing
slug: telerikreporting/licensing
tags: licensing
published: True
position: 10
---

# Licensing

Telerik Reporting comes in trial and developer (or commercial) licenses.

## Trial Licenses 

Telerik Reporting is available under a 30-day trial license with a full-featured version of the tool—no restrictions! What’s more, you are eligible for complete technical support during your trial period in case you have any questions. 

The free trial licenses of all Telerik products are fully functional and will work for an unlimited time, but will randomly display a copyright message on the page. To use the trial version of Telerik Reporting, you need to agree to the [Telerik Reporting End User License Agreement (EULA)](https://www.telerik.com/purchase/license-agreement/reporting-dlw-s).

* To sign up for a free 30-day trial, go [here](https://www.telerik.com/login/reporting).
* To download the trial version, refer to the [Telerik Reporting Download page](https://www.telerik.com/download). 
* To download a developer build with a trial license, log into your [Telerik account](https://www.telerik.com/account/).

## Developer Licenses 

Telerik Reporting also offers a developer license. To use Telerik Reporting commercially, you need to purchase a license and to agree to the terms of use, which are fully described in the [Telerik Reporting End User License Agreement (EULA)](https://www.telerik.com/purchase/license-agreement/reporting-dlw-s).  

Developer licenses come with modified DLLs, which work without displaying copyright messages. If you have a Developer license for one or more Telerik components, you need to ensure that you are using the developer build when downloading the controls. These builds have the `Dev` abbreviation in their file names.

If your application is displaying a copyright message intermittently, this means that you are using a trial version of the product. Log in to your [Telerik account](https://www.telerik.com/account/default.aspx) and download the developer build through the **Products & Subscriptions** menu and its **Purchased Products** section. 

For more information on the commercial terms, refer to the pricing list of the [available developer licenses which include Telerik Reporting](https://www.telerik.com/purchase/individual/reporting.aspx). 

## Upgrading from Trial to Developer

To upgrade the trial version of your license to a developer license:         

1. Back up your Telerik Reporting files and folders especially if your project uses the settings that are included in them.             

1. Uninstall the __Trial__  version either by using the __Start Menu__  shortcut or the __Add/Remove Programs__  dialog.             

1. Obtain the new __Dev__  installer and [install Telerik Reporting]({%slug telerikreporting/installation%}).             

## .NET Licensing Mechanism

As of Q2 2015, Telerik Reporting uses the [standard .NET licensing mechanism](https://docs.microsoft.com/bg-bg/dotnet/framework/tools/lc-exe-license-compiler), which means that using the tool in design-time causes Visual Studio to add a `license.licx` to the solution.	This file is used only in design-mode and is not needed for deployment explicitly. The .NET framework (`lc.exe`) will	embed it in the assembly when your web application is built for deployment.

The `license.licx` file is maintained by Visual Studio and contains information about all licensed components in the application, including non-Telerik products. The availability of this license file is not expected to cause any performance or compilation issues and you can ignore it.

* If your project build fails with errors pointing to the license file, you can delete it and rebuild the project. Alternatively, you can clear its contents and mark it as `Read Only`. 

* If you are working under source control, once the file is created, it will be detected as a change by your source control system. It is recommended that you check in this file initially. When the files is checked out again during your work,	it is up to you to decide whether to check it in or discard the changes.

## Redistribution

Your purchase of Telerik Reporting includes a run-time royalty-free license to redistribute the reports in your own solutions. You can freely use and redistribute any reports that you build in your own projects, and your end users are not required to purchase their own licenses for the reports. 

Some potential uses of the reports require further discussion with the sales team as listed in the following table.         

|Use|Examples
|:---|:---
|Permitted use|<ul><li>Applications for internal company use.</li><li>Commercial applications deployed for end users by Telerik customers.</li><li>Shrink-wrapped software in which the Telerik reports are integrated.</li></ul>
|Required discussion|<ul><li>Products that expose the design-time functionality of Telerik reports.</li><li>Products that do not add significant functionality to Telerik reports.</li><li>Open source products.</li></ul>

For more information, refer to the [Telerik Reporting End User License Agreement (EULA)](https://www.telerik.com/purchase/license-agreement/reporting-dlw-s). 

For further discussing your planned use of Telerik reports, send an email to [sales@Telerik.com](mailto:sales@Telerik.com).         
