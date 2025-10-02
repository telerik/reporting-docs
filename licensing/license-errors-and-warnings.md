---
title: Errors and Warnings
page_title: "Learn about Errors and Warnings in Telerik Reporting Licensing."
description: "Learn about Errors and Warnings in Telerik Reporting Licensing after the 2025 Q1 (19.0.25.211) release."
slug: license-errors-and-warnings
tags: license, telerik, reporting, questions, errors, warnings
published: True
position: 7
---

# License Activation Errors and Warnings

Starting with the [2025 Q1 (19.0.25.211)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2025-q1-19-0-25-211) release, using Telerik Reporting without a license or with an invalid license causes specific license warnings and errors. This article defines what an invalid license is, explains what is causing it, and describes the related license warnings and errors.

If a valid license cannot be found:

- A watermark appears on each document page in the report.
- A [warning message](#license-errors-and-warnings) appears in the build log:

```
Telerik and Kendo UI Licensing warning TKL002: No Telerik and Kendo UI License file found.
    Telerik and Kendo UI Licensing warning TKL002: The following locations were searched:
    Telerik and Kendo UI Licensing warning TKL002:  * TELERIK_LICENSE (EnvironmentVariable)
    Telerik and Kendo UI Licensing warning TKL002:  * KENDO_UI_LICENSE (EnvironmentVariable)
    Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q1\Examples\CSharp\.NET 6\WinFormsIntegrationDemo\telerik-license.txt (RecursiveFilePath)
    Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q1\Examples\CSharp\.NET 6\WinFormsIntegrationDemo\kendo-ui-license.txt (RecursiveFilePath)
    Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q1\Examples\CSharp\.NET 6\telerik-license.txt (RecursiveFilePath)
    Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q1\Examples\CSharp\.NET 6\kendo-ui-license.txt (RecursiveFilePath)
    Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q1\Examples\CSharp\telerik-license.txt (RecursiveFilePath)
    Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q1\Examples\CSharp\kendo-ui-license.txt (RecursiveFilePath)
    Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q1\Examples\telerik-license.txt (RecursiveFilePath)
    Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q1\Examples\kendo-ui-license.txt (RecursiveFilePath)
    Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q1\telerik-license.txt (RecursiveFilePath)
    Telerik and Kendo UI Licensing warning TKL002:  * C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q1\kendo-ui-license.txt (RecursiveFilePath)
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
```

## Invalid License

An invalid license can be caused by any of the following:

- Using an expired subscription license. Subscription licenses expire at the end of the subscription term.
- Using a perpetual license for Telerik Reporting versions released outside the validity period of your license.
- Using an expired trial license.
- A missing license for the Telerik Reporting.
- Not installing a license key in your application.
- Not updating the license key after renewing your Telerik Reporting license.

## License Warnings and Errors

Using the Telerik Reporting in a project with an expired or missing license, the `Telerik.Licensing` build task will indicate the following errors or conditions:

| Condition or Error                                                                                | Message Code   | Solution                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| ------------------------------------------------------------------------------------------------- | -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `No Telerik and Kendo UI License file found`                                                      | TKL002         | [Set up a license key]({%slug license-key%}) to activate Telerik Reporting and remove the error message.                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `Corrupted Telerik and Kendo UI License Key content in: [file path or environment variable name]` | TKL003         | <ul><li>If you use a telerik-license.txt file to activate the components, [download a new license key file]({%slug license-key%}#downloading-the-license-key) and place it in your home directory. Make sure to use a license key and not a script key.</li><li>If you use the TELERIK_LICENSE environment variable to store your license key, [download a new license key]({%slug license-key%}#downloading-the-license-key), update the content of the environment variable, and make sure it contains the entire key.</li></ul> |
| `Unable to locate licenses for all products`                                                      | TKL004         | Your license is not valid for all Telerik and Kendo products added to your project. If you have already purchased the required license, then [update your license key]({%slug license-key%}).                                                                                                                                                                                                                                                                                                                                      |
| `Your subscription has expired`                                                                   | TKL103; TKL104 | Renew your subscription and [download a new license key]({%slug license-key%}#downloading-the-license-key).                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `Your current license has expired`                                                                | TKL102         | You are using a product version released outside the validity period of your perpetual license. To remove the error message, do either of the following: <ul><li>Renew your subscription and [download a new license key]({%slug license-key%}#downloading-the-license-key)</li><li>Downgrade to a Telerik Reporting version covered by your perpetual license, as specified in the message.</li></ul>                                                                                                                             |
| `Your trial expired`                                                                              | TKL105         | Purchase a commercial license to continue using the product.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `Telerik Reporting is not listed in your current license file`                                    | TKL101         | Review the purchase options for the listed products.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `No Telerik or Kendo UI product references detected in project.`                                  | TKL001         | If you use Telerik products and see this message, update the `Telerik.Licensing` package to version `1.4.9` or later. If you do not use Telerik products, remove the `Telerik.Licensing` NuGet reference from your project                                                                                                                                                                                                                                                                                                         |

## See Also

- [Setting Up Your License Key]({%slug license-key%})
- [Frequently Asked Questions about Your Telerik Reporting License Key]({%slug license-frequently-asked-questions%})
- [Adding the License Key to CI Services]({%slug license-key-ci-services%})
- [License Agreement](https://www.telerik.com/purchase/license-agreement/reporting-dlw-s)
