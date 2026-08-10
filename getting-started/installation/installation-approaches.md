---
title: Installation Approaches
page_title: Installing Telerik Reporting - Control Panel, MSI, and NuGet
description: "Learn how to install Telerik Reporting using the Control Panel, the MSI installer, or NuGet packages, and choose the approach that fits your workflow."
slug: telerikreporting/installation
tags: telerik, reporting, installation, approaches, msi, control, panel, nuget, private, feed, visual, studio
published: True
position: 2
previous_url: /installation-system-requirements, /installation-installing-from-msi, /installation, /getting-started/installation/, /installation-deploying-on-server
reportingArea: General
---

# Installation Approaches for Telerik Reporting

Telerik Reporting supports three installation approaches: the [Control Panel](#using-the-control-panel), the [MSI installer](#using-the-msi-file), and [NuGet packages](#using-nuget-packages). Choose the approach based on whether you need design-time support and how you plan to manage the installation in your workflow.

> note After installing the product, you need to [download and activate your Telerik Reporting License Key](slug:license-key).

Use this table to choose the approach that fits your workflow:

| Approach                                  | Best For                                                                                                     | Design-Time Support |
| :---------------------------------------- | :----------------------------------------------------------------------------------------------------------- | :------------------ |
| [Control Panel](#using-the-control-panel) | Evaluating the product or managing multiple Telerik products on your machine.                                | Yes                 |
| [MSI installer](#using-the-msi-file)      | Full local installation with Visual Studio integration, sample projects, and the Standalone Report Designer. | Yes                 |
| [NuGet packages](#using-nuget-packages)   | Adding Telerik Reporting to an existing project or automating installation in a CI/CD pipeline.              | No                  |

## Using the Control Panel

You can install Telerik Reporting by downloading and running the Progress Control Panel. The Control Panel manages downloads, installations, and updates across all your Telerik products from a single interface. For complete instructions, refer to the [Progress Control Panel online documentation](https://docs.telerik.com/controlpanel/introduction).

The [Progress Control Panel](https://www.telerik.com/download-trial-file/v2/control-panel) automatically downloads and stores your license key in your home directory, making it available for all projects you develop on your local machine. For details, see [Setting Up Telerik Reporting License Key](slug:license-key).

## Using the MSI File

You can install Telerik Reporting by using the `.msi` file for a full local installation. The installer adds Telerik Reporting to your computer under `Program Files/Progress`, creates the required virtual folders and projects, and provides all files needed for development with Telerik Reporting.

The MSI installation wizard installs the product by default in the `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}` folder.

The MSI installer is the recommended approach for a full local installation. It automatically registers the required Telerik Reporting assemblies in the machine GAC for the Visual Studio Report Designer, configures the Project and Item Templates across all Visual Studio instances, and creates and populates the AdventureWorks sample database for the sample projects.

### Specifics

During the MSI installation process, note the following:

- For Telerik Reporting versions earlier than R3 2017, the default installation paths were `C:\Program Files\Telerik\` and `C:\Program Files (x86)\Telerik\`.
- The latest package available for download has all updates and hotfixes applied. You do not need to update it further after installation.
- The MSI installation does not overwrite previous Telerik Reporting installations unless the new installation is the same version. The installer keeps your existing installation and places new files in a separate folder.
- The **Downloads** page lists previously downloaded products. For any missing products or product versions, contact the Sales team through the support ticketing system by submitting a [**General Feedback**](https://www.telerik.com/account/support-tickets/general-feedback) thread.

### MSI Installation

To install Telerik Reporting through the MSI automatic installer file:

1. Log into your [Telerik account](https://www.telerik.com/account). Select the **Downloads** tab to view the available products and select **Telerik Reporting**.
1. From the next page, download the MSI installation and the documentation files, and download the automatic installation MSI file. The source code is available for download only for commercial license holders.
1. When the download completes, run `Telerik_Reporting_[suiteversion].msi`. In the dialog that appears after you execute the MSI file, confirm that you have read and accepted the License Agreement.

   ![The Welcome Page of the Telerik Reporting Installation Wizard](images/installWizard1.png)

1. In the dialog that opens, select the features you require.
   - If Telerik Reporting does not locate a local SQL Server instance, or if the SQL Server Browser Service is stopped, the **Examples** dialog option installs the examples, but the application configuration files do not contain valid connection strings. You can still access working demos on the [Telerik Reporting demos page](https://demos.telerik.com/reporting).
   - To set up the examples with a valid connection string, select **Examples Setup**. All local SQL Server 2005 and later instances are supported.
   - The examples require the MS SQL Server [AdventureWorks database](https://learn.microsoft.com/en-us/previous-versions/sql/sql-server-2008/ms124659(v=sql.100)). If the database is not already available on your machine, the wizard deploys it locally.
   - To install AdventureWorks manually from the SQL script in the installer, navigate to `[InstallDir]/Examples/Data/AdventureWorks OLTP`. For the script to run correctly, uncomment the `SET @data_path = 'C:\Program Files\Microsoft SQL Server\90\Tools\Samples\AdventureWorks OLTP\';` statement and specify the correct path to the CSV data files in the same folder.

   ![The Configuration Page of the Telerik Reporting Installation Wizard](images/installWizard2.png)

1. (If **Examples Setup** was selected) In the **Setup Wizard** dialog, select your **Database Server** and the authentication for the connection. The Wizard detects all running instances and lists them in the input field.

   > note To enable the wizard to detect all running SQL Server instances, start the [SQL Server Browser Service](https://learn.microsoft.com/en-us/previous-versions/sql/sql-server-2008-r2/ms181087(v=sql.105)).

   ![The Setup Page for the Samples Database of the Telerik Reporting Installation Wizard](images/installWizard3.png)

   ![Installation progress bar during Telerik Reporting setup](images/installWizard4.png)

   ![The completion step of the Telerik Reporting Installation Wizard](images/installWizard5.png)

## Using NuGet Packages

You can add Telerik Reporting to a project by installing NuGet packages from [NuGet.org](https://www.nuget.org/) or the Telerik NuGet server at `https://nuget.telerik.com/v3/index.json`. The packages contain the libraries for .NET Core projects, the Reporting Engine, and the [Reporting REST WebAPI-based service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/overview).

> note The Telerik Reporting NuGet packages do not include design-time support. If you need the Visual Studio Report Designer or the Standalone Report Designer, use the [MSI installer](#using-the-msi-file) instead.

Use one of the following installation paths for NuGet packages:

- [Install Telerik Reporting from NuGet.org](slug:telerikreporting/using-reports-in-applications/install-with-nuget-packages#how-to-install-telerik-reporting-from-nuget-org)
- [Install Telerik Reporting from the Telerik NuGet server](slug:telerikreporting/using-reports-in-applications/install-with-nuget-packages#how-to-install-from-the-telerik-nuget-server)
- [Install Telerik Reporting from a local NuGet feed](slug:setup-local-nuget-feed)

## See Also

- [Install Telerik Reporting with NuGet Packages](slug:telerikreporting/using-reports-in-applications/install-with-nuget-packages)
- [Restoring NuGet Packages in Your CI Workflow](slug: restoring-nugets-in-ci)
- [Troubleshooting Telerik NuGet](slug:troubleshooting-nuget)
