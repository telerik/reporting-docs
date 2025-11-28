---
title: Restoring NuGet Packages in CI
page_title: Authenticating and Restoring NuGet Packages in CI
description: "Learn how to use NuGet Keys to authenticate with the private Telerik NuGet server and restore Telerik Reporting packages in your Continuous Integration or desktop environment."
slug: using-nuget-keys
tags: telerik, reporting, restore, nuget, packages, ci, continuous, integration, installation
published: True
position: 6
reportingArea: General
---

# Restoring NuGet Packages in Your CI Workflow

This article describes how to use token-based authentication for the Telerik NuGet feed. You will learn how to create and use NuGet API keys to restore Telerik NuGet packages in your Continuous Integration (CI) workflow.

When you need to restore Telerik NuGet packages as part of your CI, using API Keys provides a secure way to authenticate. This method does not require you to provide your Telerik username and password anywhere in the CI workflow. Unlike your Telerik credentials, an API Key has a limited scope and can be used only with the Telerik NuGet server. If any of your API Keys is compromised, you can quickly delete it and create a new one.

## Generating API Keys

1. Go to the [API Keys](https://www.telerik.com/account/downloads/api-keys) page in your Telerik account.
1. Click **Generate New Key +**.

   ![Manage API Keys](images/account-generate-api-key.png)

1. In the **Key Note** field, add a note that describes the API key.
1. Click **Generate Key**.
1. Select **Copy and Close**. Once you close the window, you can no longer copy the generated key. For security reasons, the **API Keys** page displays only a portion of the key.
1. Store the generated NuGet API key as you will need it in the next steps. Whenever you need to authenticate your system with the Telerik NuGet server, use `api-key` as the username and your generated API key as the password.

>API keys expire after two years. Telerik will send you an email when a key is about to expire, but we recommend that you set your own calendar reminder with information about where you used that key: file paths, project links, AzDO and GitHub Action variable names, and so on.

## Storing API Keys

> Never check in an API Key with your source code or leave it publicly visible in plain text, for example, as a raw key value in a `NuGet.Config` file. An API Key is valuable as bad actors can use it to access the NuGet packages that are licensed under your account. A potential key abuse could lead to a review of the affected account.

To protect the API Key, store it as a secret environment variable. The exact steps depend on your workflow:

- In GitHub Actions, save the key as a GitHub Actions Secret. Go to **Settings** > **Security** > **Secrets** > **Actions** > **Add new secret**.

- In Azure DevOps Classic, save the key as a secret pipeline variable. Go to the **Variables** tab and then select **Pipeline variables**.

- In Azure DevOps YAML pipelines, save the key as a secret variable as well. Click the YAML editor's **Variables** button and complete the **New variable** form.

If you use Azure DevOps Service connection instead of secret environment variables, enter `api-key` in the username filed and the API Key as the password in the **New NuGet service connection** form editor.

For more details on storing and protecting your API Key, check the [Announcing NuGet Keys](https://www.telerik.com/blogs/announcing-nuget-keys) blog post by Lance McCarthy.

## Using an API Key

There are two popular ways to use the Telerik NuGet server in a build:

* [Using a NuGet.Config file with your projects](#using-a-nugetconfig-file-with-your-projects)

- [Using only CLI commands](#using-only-cli-commands)

For more information on how to use API keys in a build, check the [Announcing NuGet Keys](https://www.telerik.com/blogs/announcing-nuget-keys) blog post by Lance McCarthy.

### Using a NuGet.Config File with Your Projects

1. In your `NuGet.Config` file, set the `Username` value to `api-key` and the `ClearTextPassword` value to an environment variable name:

   ```XML
   <configuration>
   	<packageSources>
   		<clear/>
   		<add key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" />
   		<add key="MyTelerikFeed" value="https://nuget.telerik.com/v3/index.json" protocolVersion="3"/>
   	</packageSources>
   	<packageSourceCredentials>
   		<MyTelerikFeed>
   			<add key="Username" value="api-key" />
   			<add key="ClearTextPassword" value="%MY_API_KEY%" />
   		</MyTelerikFeed>
   	</packageSourceCredentials>
   </configuration>
   ```

1. Set the `MY_API_KEY` environment variable by using the value of your pipeline/workflow secret.

The exact steps to set the `MY_API_KEY` environment variable depend on your workflow. For more details, refer to the [Announcing NuGet Keys](https://www.telerik.com/blogs/announcing-nuget-keys) blog post by Lance McCarthy.

### Using Only CLI Commands

You can use the CLI `add source` (or `update source`) command to set the credentials of a package source. This CLI approach is applicable if your CI system doesn't support default environment variable secrets or if you do not use a custom `nuget.config`.

- To set the credentials in Azure DevOps:

	````bash
   dotnet nuget add source 'MyTelerikFeed' --source 'https://nuget.telerik.com/v3/index.json' --username 'api-key' --password '$(TELERIK_API_KEY)' --configfile './nuget.config' --store-password-in-clear-text
   ````

- To set the credentials in GitHub Actions:

* To set the credentials in GitHub Actions:

	````bash
   dotnet nuget add source 'MyTelerikFeed' --source 'https://nuget.telerik.com/v3/index.json' --username 'api-key' --password '${{ secrets.TELERIK_API_KEY }}' --configfile './nuget.config' --store-password-in-clear-text
   ````


## Additional Resources

If you just start using the Telerik NuGet server in your CI or inter-department workflows, check the two blog posts below. You will learn about the various use cases and find practical implementation details.

- [Azure DevOps and Telerik NuGet Packages](https://www.telerik.com/blogs/azure-devops-and-telerik-nuget-packages)

- [Announcing NuGet Keys](https://www.telerik.com/blogs/announcing-nuget-keys)

## See Also

- [Telerik Reporting Installation Approaches]({%slug telerikreporting/installation%})
- [Included Assemblies]({%slug included-assemblies%})
