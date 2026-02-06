---
title: FAQs
page_title: "Frequently Asked Questions about Telerik Reporting Licensing."
description: "Learn the answers to the most Frequently Asked Questions about the Telerik Reporting License Key required after the 2025 Q1 (19.0.25.211) release."
slug: license-frequently-asked-questions
tags: license, telerik, reporting, faq, questions
published: True
position: 9
reportingArea: General
---

# Frequently Asked Questions

This article lists the answers to the most frequently asked questions (FAQs) about working with the Telerik Reporting license key.

## Does the license key expire?

Yes, the license key expires at the end of your support subscription:

- For trial users, this is at the end of your 30-day trial.
- For commercial license holders, this is when your subscription term expires.

You will need to obtain and install a new license key after starting a trial, renewing a license, or upgrading a license.

> An expired perpetual license key is valid for all Telerik Reporting versions published before its expiration date.

## Will the product function with an expired license key?

This depends on the Telerik Reporting [license type (perpetual, subscription, or trial)](https://www.telerik.com/purchase/faq/licensing-purchasing#licensing):

- _Perpetual licenses_ function normally with an expired license key, as long as the application is using a Telerik Reporting version that was released before the expiration date of the license.
- _Subscription licenses_ function normally in already deployed applications, but you cannot rebuild and republish the app.
- _Trial licenses_ function normally only within the 30-day trial period.

If none of the above conditions are met, the following behaviors occur:

- A watermark appears on each report document page.
- A [warning message]({%slug license-errors-and-warnings%}) appears in the application's build log.

## I updated the version of the Telerik Reporting packages in my project and the invalid license errors have appeared. What is the cause of this behavior?

The most likely cause is that the newly installed Telerik Reporting was released after the expiration date of your current license. To fix this issue:

1. [Download a new license key]({%slug license-key%}#downloading-the-license-key).
1. [Activate the new license key]({%slug license-key%}#activating-telerik-reporting) in your project.

## Can I use the same license key in multiple builds?

You can use your personal license key in multiple pipelines, builds, and environments.

However, each individual developer must use a unique personal license key.

## Do I need an Internet connection to activate the license?

No, the license activation and validation are performed entirely offline.

## Do I have to add the license key to source control?

No, you do not have to add the `telerik-license.txt` license key file or its contents to source control.

Build servers must use the `TELERIK_LICENSE` environment variable described in [Adding the License Key to CI Services]({%slug license-key-ci-services%}).

> Do not store the license key in plaintext, for example, in a GitHub Actions Workflow definition.

## What happens if both the environment variable and the license key file are present?

If both the `TELERIK_LICENSE` environment variable and the `telerik-license.txt` file are present, then the environment variable will be used.

To enforce the use of the license key file, unset the environment variable.

## My team has more than one license holder. Which key do we have to use?

- To activate Telerik Reporting on your development machine, use the key associated with your personal account.
- To activate Telerik Reporting in a CI/CD environment, use any of the license keys in your team.

## Are earlier versions of Telerik Reporting affected?

No, versions released prior to January 2025 do not require a license key.

## What happens if I make a change to non-Telerik parts of the code after the subscription expires?

This depends on your license:

- If you have a perpetual license, you can build the application with Telerik Reporting.
- If you have an expired subscription license, the build will generate warnings.

## See Also

- [License Activation Errors and Warnings]({%slug license-errors-and-warnings%})
- [Setting Up Your License Key]({%slug license-key%}))
- [Adding the License Key to CI Services]({%slug license-key-ci-services%}))
