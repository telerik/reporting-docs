---
title: Setting Up Telerik Reporting License Key
page_title: "Learn how to set up the Telerik Reporting License Key."
slug: license-key
tags: license, key, telerik, reporting
published: True
position: 1
---

# Setting Up Your Telerik Reporting License Key

Starting with the Q1 2025 release, Telerik Reporting requires activation through a license key (trial or commercial). This article describes how to download or update your personal license key and use it to activate the Telerik Reporting product.

An invalid license results in [errors and warnings]({%slug license-errors-and-warnings%}) during build and run-time indicators such as watermarks and banners.

The implementation of the 2025 licensing requirements will occur in two phases:

- Phase 1 - Starting with the 2025 Q1 release, a missing or invalid license causes [warnings during build]({%slug license-errors-and-warnings%}). The commercial distributions of the product do not exhibit any functional restrictions.
- Phase 2 - Starting with the 2025 Q2 release, a missing or invalid license will result in [build errors and run-time indicators]({%slug license-errors-and-warnings%}), such as watermarks and banners.

Note that future updates of the product may restrict or disable some features when no valid license is present. You can send us feedback through the _Contact Us_ form or by [opening a support ticket](https://www.telerik.com/account/support-center/contact-us?utm_source=licensing&utm_medium=console&utm_campaign=no_references).

## Licensing Dependencies

Your projects have to reference the package `Telerik.Licensing`. We recommend using the [NuGet Package Manager in Visual Studio](https://learn.microsoft.com/en-us/nuget/consume-packages/install-use-packages-visual-studio). It automatically adds all the required code to your project files.

>tip We recommend using Telerik Reporting NuGet packages in your projects rather than direct assembly references. The main reason is that the packages add automatically all dependencies, whereas when using references you need to add them manually. The `Telerik.Licensing` package will be added automatically as a dependency for the `Telerik.Reporting` package.

Here are the changes it will make, depending on the project type:

### The older .NET Framework project types

* Add package reference to the `packages.config` file:

	````XML
<package id="Telerik.Licensing" version="1.*" targetFramework="net4*" />
````
 

* Update the `cproj` file with the DLL reference:

	````XML
<Reference Include="Telerik.Licensing, Version=1.*, Culture=neutral, PublicKeyToken=*, processorArchitecture=MSIL">
		<HintPath>..\..\packages\Telerik.Licensing\lib\net4*\Telerik.Licensing.dll</HintPath>
	</Reference>
````


### .NET project types

Update the `cproj` file like below:

````XML
<PackageReference Include="Telerik.Licensing" Version="1.*" />
````

We strongly recommend adding the above package for licensing. If adding the package is not an option in your scenario, you may [add a License Key without NuGet References](#adding-a-license-key-to-projects-without-nuget-references).

## Downloading the License Key

The [Progress Control Panel](https://www.telerik.com/download-trial-file/v2/control-panel) will automatically download and store your license key in your home directory. This makes it available for all projects you develop on your local machine.

You may automatically download and store your license key in your home directory also from the Visual Studio Extensions of Telerik Reporting:

	![Download License Key through Visual Studio Extension for Telerik Reporting.](images/vs-extensions-download-key.png)

To download a license key for Telerik Reporting, you must have either a developer license or a trial license. If you are new, you can sign up for a [free trial](https://www.telerik.com/account/trials) first, and then follow the steps below.

1. Go to the [License Keys](https://www.telerik.com/account/your-licenses/license-keys) page in your Telerik account.
1. Click the **Download License Key** button.

	![Download License Key](images/download-license-key.png)

## Activating Telerik Reporting

To activate Telerik Reporting:

* Copy the [downloaded](#downloading-the-license-key) `telerik-license.txt` license key file to your home directory. This makes the license key available to all projects that you develop on your computer.

	+ For Windows: `%AppData%\Telerik\telerik.license.txt`
	+ For Mac/Linux: `~/.telerik/telerik.license.txt`

* Alternatively, copy the `telerik-license.txt` license key file to the root folder of your project. This makes the license key available only to this project. Do not commit the file to source control as this is your personal license key.

When you build the project, the `Telerik.Licensing` NuGet package automatically locates the license file and uses it to activate Telerik Reporting.

> If your project doesn’t use NuGet packages, see [Adding a License Key to Projects without NuGet References](#adding-a-license-key-to-projects-without-nuget-references).

### Adding a License Key to Projects without NuGet References

Telerik strongly recommends the use of NuGet packages whenever possible. Only include the license key as a code snippet when NuGet packages are not an option.

If you cannot use NuGet packages in your project, add the license as a code snippet:

1. Go to the [License Keys](https://www.telerik.com/account/your-licenses/license-keys) page in your Telerik account.
1. On the Telerik Reporting row, click the __View key__ link in the __SCRIPT KEY__ column. 

	![Download Product Key](images/download-product-key.png)

1. Copy the C# code snippet into a new file, for example, `TelerikLicense.cs`.
1. Add the `TelerikLicense.cs` file to your project.

> Do not publish the license key code snippet in publicly accessible repositories. This is your personal license key.

## Updating Your License Key

Whenever you purchase a new license or renew an existing one, always [download](#downloading-the-license-key) and install a new license key. The new license key includes information about all previous license purchases. This process is referred to as a license key update. Once you have the new license key, use it to [activate Telerik Report](#activating-telerik-reporting).

# See Also

* [License Activation Errors and Warnings]({%slug license-errors-and-warnings%})
* [Adding the License Key to CI Services]({%slug license-key-ci-services%}))
* [Frequently Asked Questions about Your Telerik Reporting License Key]({%slug license-frequently-asked-questions%})
