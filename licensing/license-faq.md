---
title: FAQs
page_title: "Frequently Asked Questions about Telerik Reporting Licensing."
slug: license-frequently-asked-questions
tags: license, telerik, reporting, faq, questions
published: True
position: 9
---

# Frequently Asked Questions

This article lists the answers to the most frequently asked questions (FAQs) about working with the Telerik Reporting license key.

## Does the license key expire?

Yes, the license key expires at the end of your support subscription:

* For trial users, this is at the end of your 30-day trial.
* For commercial license holders, this is when your subscription term expires.

You will need to obtain and install a new license key after starting a trial, renewing a license, or upgrading a license.

> An expired perpetual license key is valid for all Telerik Reporting versions published before its expiration date.

## [2025 Q2] Will the product function with an expired license key?

This depends on your license type.

* __Perpetual licenses__ will continue to function normally with an expired license key. However, the following will happen if you update or install a package version that is released after the expiration date of the license:

	- A watermark appears on each report document page.
	- A warning message is logged in the build log:

		````
Telerik and Kendo UI Licensing warning TKL002: No Telerik and Kendo UI License file found.
		Telerik and Kendo UI Licensing warning TKL002: The following locations were searched:
		Telerik and Kendo UI Licensing warning TKL002:  * TELERIK_LICENSE (EnvironmentVariable)
		Telerik and Kendo UI Licensing warning TKL002:  * KENDO_UI_LICENSE (EnvironmentVariable)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\CSharp\.NET 6\WinFormsIntegrationDemo\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\CSharp\.NET 6\WinFormsIntegrationDemo\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\CSharp\.NET 6\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\CSharp\.NET 6\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\CSharp\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\CSharp\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Users\user1\AppData\Roaming\Telerik\telerik-license.txt (UserDirectory)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Users\user1\AppData\Roaming\Telerik\kendo-ui-license.txt (UserDirectory)
		Telerik and Kendo UI Licensing warning TKL002: Activate a License Key file at https://prgress.co/3PBSVoC
		Telerik and Kendo UI Licensing warning TKL101: Telerik Reporting is not listed in your current license file.
		Telerik and Kendo UI Licensing warning TKL004: Unable to locate licenses for all products.
````

  
	See the [Invalid License]({%slug license-errors-and-warnings%}#invalid-license) section for more information.
	
* __Subscription licenses__ will prevent you from building the application with an expired license key. Deployed applications will continue to function normally.
* __Trial licenses__ will prevent you from building or running the application. The following will happen if you try to build or run the application:

	- A watermark appears on each report document page.
	- A warning message similar to the following is logged in the build log:

		````
Telerik and Kendo UI Licensing warning TKL002: No Telerik and Kendo UI License file found.
		Telerik and Kendo UI Licensing warning TKL002: The following locations were searched:
		Telerik and Kendo UI Licensing warning TKL002:  * TELERIK_LICENSE (EnvironmentVariable)
		Telerik and Kendo UI Licensing warning TKL002:  * KENDO_UI_LICENSE (EnvironmentVariable)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\CSharp\.NET 6\WinFormsIntegrationDemo\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\CSharp\.NET 6\WinFormsIntegrationDemo\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\CSharp\.NET 6\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\CSharp\.NET 6\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\CSharp\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\CSharp\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\Examples\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q4\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\telerik-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\kendo-ui-license.txt (RecursiveFilePath)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Users\user1\AppData\Roaming\Telerik\telerik-license.txt (UserDirectory)
		Telerik and Kendo UI Licensing warning TKL002:  * C:\Users\user1\AppData\Roaming\Telerik\kendo-ui-license.txt (UserDirectory)
		Telerik and Kendo UI Licensing warning TKL002: Activate a License Key file at https://prgress.co/3PBSVoC
		Telerik and Kendo UI Licensing warning TKL101: Telerik Reporting is not listed in your current license file.
		Telerik and Kendo UI Licensing warning TKL004: Unable to locate licenses for all products.
````

	See the [Invalid License]({%slug license-errors-and-warnings%}#invalid-license) section for more information.

Note that future updates of Telerik Reporting may restrict or disable some features when no valid license is present.

## I updated the version of the Telerik Reporting packages in my project and the invalid license errors have appeared. What is the cause of this behavior?

If this happens, the possible reason is that the end date of the license activated in your application is before the release date of the newly installed product. To fix this issue:

1. [Download a new license key]({%slug license-key%}#downloading-the-license-key).
1. [Activate the new license key]({%slug license-key%}#activating-telerik-reporting) in your project.

## Can I use the same license key in multiple builds?

You can use your personal license key in multiple pipelines, builds, and environments.

However, each individual developer must use a unique personal license key.

## Do I need an Internet connection to activate the license?

No, the license activation and validation are performed entirely offline.

The license is not validated with our services at any point in the project lifecycle.

## Do I have to add the license key to source control?

No, you do not have to add the `telerik-license.txt` license key file or its contents to source control.

Build servers must use the `TELERIK_LICENSE` environment variable described in [Adding the License Key to CI Services]({%slug license-key-ci-services%}).

> Do not store the license key in plaintext, for example, in a GitHub Actions Workflow definition.

## What happens if both the environment variable and the license key file are present?

If both the `TELERIK_LICENSE` environment variable and the `telerik-license.txt` file are present, then the environment variable will be used.

To enforce the use of the license key file, unset the environment variable.

## My team has more than one license holder. Which key do we have to use?

* To activate Telerik Reporting on your development machine, use the key associated with your personal account.
* To activate Telerik Reporting in a CI/CD environment, use any of the license keys in your team.

## Are earlier versions of Telerik Reporting affected?

No, versions released before __January 2025__ do not require a license key.

## [2025 Q2] What happens if I make a change to non-Telerik parts of the code after the subscription expires?

This depends on your license:

* If you have a perpetual license, you can build the application with Telerik Reporting.
* If you have an expired subscription license, the build will fail.

# See Also

* [License Activation Errors and Warnings]({%slug license-errors-and-warnings%})
* [Setting Up Your License Key]({%slug license-key%}))
* [Adding the License Key to CI Services]({%slug license-key-ci-services%}))
