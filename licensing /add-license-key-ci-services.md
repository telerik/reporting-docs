---
title: Add License Key to CI Services
page_title: "Learn how to add your License Key to CI/CD Services."
slug: license-key-ci-services
tags: license, key, telerik, reporting, ci
published: True
position: 2
---

# Adding the License Key to CI/CD Services

This article describes how to set up and activate your Telerik Reporting [license key](https://www.telerik.com/account/your-licenses/license-keys) across a few popular CI services by using environment variables.

When working with CI/CD platforms, always add the `Telerik.Licensing` NuGet package as a project dependency. This package activates Telerik Reporting at build time by using the provided license key.

> If you cannot use NuGet packages in your project, see the workaround in the [Adding Your License Key to CI Platforms as a Code Snippet](.............) KB article.

The license activation process in a CI/CD environment involves the following steps:

1. [Download]({%slug license-key%}#downloading-the-license-key) a license key from [your Telerik account](https://www.telerik.com/account/your-licenses/license-keys).
1. Add the `Telerik.Licensing` NuGet package as a project dependency: `<PackageReference Include="Telerik.Licensing" Version="1.*" />`
1. [Create an environment variable](#creating-an-environment-variable) named `TELERIK_LICENSE` and add your Telerik Reporting license key as a value.

## Creating an Environment Variable

The recommended approach for providing your license key to the `Telerik.Licensing` NuGet package is to use environment variables. Each CI/CD platform has a different process for setting environment variables and this article lists only some of the most popular examples.

### Azure Pipelines (YAML)

1. Create a new [User-defined Variable](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch) named `TELERIK_LICENSE`.
1. Paste the contents of the license key file as a value.

### Azure Pipelines (Classic)

1. Create a new [user-defined variable](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=classic%2Cbatch) named `TELERIK_LICENSE`.
1. Paste the contents of the license key file as a value.

### GitHub Actions

1. Create a new [Repository Secret](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository) or an [Organization Secret](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-an-organization).
1. Set the name of the secret to `TELERIK_LICENSE` and paste the contents of the license file as a value.
1. After running `npm install` or `yarn`, add a build step to activate the license:

	````yaml
env:
		TELERIK_LICENSE: ${{ secrets.TELERIK_LICENSE }}
````


# See Also

* [License Activation Errors and Warnings]({%slug license-errors-and-warnings%})
* [Setting Up Your License Key]({%slug license-key%}))
* [Frequently Asked Questions about Your Telerik Reporting License Key]({%slug license-frequently-asked-questions%})
