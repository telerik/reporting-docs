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

Telerik Reporting is available under a developer (commercial) or a trial license.       

Reardless of the license version you hold, to use Telerik Reporting, you have to agree to the __[End User License Agreement for Progress Telerik Reporting and Telerik Report Designer](https://www.telerik.com/purchase/license-agreement/reporting-dlw-s)__.       

## Developer Licenses

Developer licenses come with modified DLLs which work without license keys. If you own a Developer license for one or more Telerik products, only make sure that you are using the           developer build when you download the desired controls. The file names of the developer builds contain the `Dev` abbreviation.         

For more information on the commercial terms, refer to the pricing list of the [available developer licenses which include Telerik Reporting](https://www.telerik.com/purchase/individual/reporting.aspx) .         

## Trial Licenses

Trial licenses provide free and fully functional access to all Telerik Reporting products. While the trial version is unlimited in time, each page displays a copyright message.         

To download the Telerik Reporting trial version, refer to the __[Telerik Reporting Download](https://www.telerik.com/download)__ page.         

To download a developer build with a trial license, log into your [Telerik account](https://www.telerik.com/account/) .         

## Upgrading Trial to Purchase

To upgrade the trial version of your license to a developer license:         

1. Back up your old Telerik Reporting files and folders especially if your project uses the settings that are included in them.             

1. Uninstall the __Trial__  version either by using the __Start Menu__  shortcut or the __Add/Remove Programs__  dialog.             

1. Obtain the new __Dev__  installer and install Telerik Reporting. For more information, refer to the article on [Installation]({%slug telerikreporting/installation%}).             

## Licensing Mechanism

As of the Q2 2015 release, Telerik Reporting uses the standard .NET licensing mechanism–if you use Telerik Reporting items in design-time, Visual Studio adds a `license.licx` file to the solution.         

The `license.licx` file is not explicily needed for deployment and the .NET framework (`lc.exe`) will embed the file in the assembly when your application is built for deployment.           `license.licx` is maintained by Visual Studio and contains information about all licensed components in the application including non-Telerik products.         

The presence of the `license.licx` file is not expected to cause any performance or compilation issues and, therefore, you can ignore it. If your project build fails with errors which refer to the license file, delete `license.licx` and rebuild the project.         

If you work under source control, once `license.licx` is created, your source control system will detect it as a change. It is a best practice to initially check in the file and once it is checked out again while you work, you can then decide whether to check it in or discard the changes.         

## Redistribution

Your purchase of Telerik Reporting includes a run-time royalty-free license to redistribute the reports in your own solutions. You can freely use and redistribute any reports that you build in your own solutions, and your end users are not required to purchase their own licenses for the reports. Some potential uses of the reports require further discussion with the sales team.         

* Examples of permitted uses             

   + Applications for internal company use.                 

   + Commercial applications deployed for end users by Telerik customers.                 

   + Shrink-wrapped software in which the Telerik reports are integrated.                 

* Examples of uses that require discussion             

   + Products that expose the design-time functionality of the Telerik reports.                 

   + Products that do not add significant functionality to the Telerik reports.                 

   + Open source products.                 

For more information, refer to the __[End User License Agreement for Progress Telerik Reporting and Telerik Report Designer](https://www.telerik.com/purchase/license-agreement/reporting-dlw-s)__. or send an email to [sales@Telerik.com](mailto:sales@Telerik.com) to discuss your planned use of the controls.         
