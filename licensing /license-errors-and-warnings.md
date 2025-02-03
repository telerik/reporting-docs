---
title: Errors and Warnings
page_title: "Learn about Errors and Warnings in Telerik Reporting Licensing."
slug: license-errors-and-warnings
tags: license, telerik, reporting, questions, errors, warnings
published: True
position: 7
---

# License Activation Errors and Warnings

Starting with the 2025 Q1 release, using Telerik Reporting without a license or with an invalid license causes specific license warnings and errors. This article defines what an invalid license is, explains what is causing it, and describes the related license warnings and errors.

The implementation of the 2025 product licensing requirements will occur in two phases:

* Phase 1 - Starting with the 2025 Q1 release, a missing or invalid license logs a warning in the build log.
* Phase 2 - Starting with the 2025 Q2 release, a missing, expired, or invalid license will result in:
  
  - A watermark appearing on each report document page.
  - A warning message appearing in the build log:
  
    `.............`

## Invalid License

An invalid license can be caused by any of the following:

* Using an expired subscription license. Subscription licenses expire at the end of the subscription term.
* Using a perpetual license for Telerik Reporting versions released outside the validity period of your license.
* Using an expired trial license.
* A missing license for the Telerik Reporting.
* Not installing a license key in your application.
* Not updating the license key after renewing your Telerik Reporting license.

## License Warnings and Errors

Using the Telerik Reporting in a project with an expired or missing license, the `Telerik.Licensing` build task will indicate the following errors:

`...........`

In addition, the following conditions will be logged:

|**Condition**|**Message Code**|**Solution**|
|----|----|
|`No license key is detected`|TKL002|[Install a license key]({%slug license-key%}) to activate Telerik Reporting and remove the error message.|
|`Invalid license key`|TKL003|[Download a new license key]({%slug license-key%}#downloading-the-license-key) and install it to activate Telerik Reporting and remove the error message.|
|`Your subscription license has expired.`|TKL103; TKL104|Renew your subscription and [download a new license key]({%slug license-key%}#downloading-the-license-key).|
|`Your perpetual license is invalid.`|TKL102||You are using a product version released outside the validity period of your perpetual license. To remove the error message, do either of the following: <ul><li>Renew your subscription and [download a new license key]({%slug license-key%}#downloading-the-license-key)</li><li>Downgrade to a Telerik Reporting version covered by your perpetual license, as specified in the message.</li></ul>|
|`Your trial license has expired.`|TKL105|Purchase a commercial license to continue using the product.|
|`Your license is not valid for the detected product(s).`|TKL101|Review the purchase options for the listed products.<br />Alternatively, remove the references to the listed packages from `package.json`.|

Starting with the 2025 Q2 release of Telerik Reporting, all conditions above will be treated as errors.

# See Also

* [Setting Up Your License Key]({%slug license-key%}))
* [Frequently Asked Questions about Your Telerik Reporting License Key]({%slug license-frequently-asked-questions%})
* [Adding the License Key to CI Services]({%slug license-key-ci-services%}))
* [License Agreement](https://www.telerik.com/purchase/license-agreement/reporting-dlw-s)
