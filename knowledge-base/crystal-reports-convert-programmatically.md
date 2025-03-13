---
title: Convert Crystal Report Programmatically
page_title: Converting Crystal Reports to Telerik Report Definitions With Code
description: "Learn how to convert Crystal Report files to Telerik Report definitions programmatically."
type: how-to
slug: crystal-reports-convert-programmatically
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Application Type</td>
			<td>Console Application</td>
		</tr>
		<tr>
			<td>Component</td>
			<td>Crystal Reports Converter</td>
		</tr>
	</tbody>
</table>

## Description

Both [Visual Studio Report Designer] ({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) and [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) applications allow converting a single Crystal Reports file to a Telerik Reporting report definition, but do not support converting multiple reports at once.

## Solution  

Converting multiple Crystal Report files to Telerik Reporting `.trdx` or `.trdp` files can be done programmatically. In the steps below we'll show how to build a simple console application that performs bulk conversion of all the Crystal Report files in a particular folder and outputs the conversion log to the console.

- **Prerequisites**

	The assemblies (both Telerik and Crystal Reports ones) that will be used for the conversion process are not distributed via NuGet. They are deployed to your machine with the corresponding MSI installers. Please ensure you have installed Telerik Reporting and SAP Crystal Reports runtime on your machine.

- **Create a .NET Framework Command-line Application**
    
	+ Use Visual Studio to create a .NET Framework console application. Specify .NET Framework 4.6.2 or greater as a target framework.
	+ Create a project folder that will contain the referenced assemblies - both Telerik and Crystal Reports ones. In this KB we'll name it `\ext`.	
	+ Add reference to `Telerik.Reporting.dll`. You can reference it from the Telerik Reporting installation directory, or use the NuGet feed.

- **Obtain Telerik.ReportConverter.CrystalReports.dll**

    The assembly that contains the converter code is distributed with the Telerik Reporting MSI installer. It is not deployed in the installation directory because it is not intended to be referenced in user projects. It is installed in the machine's GAC in order to be accessible from various Telerik Reporting designers.

	+ Ensure you have Telerik Reporting installed. Search in machine's GAC folder (usually `C:\Windows\Microsoft.NET\assembly\GAC_MSIL`)for the assembly `Telerik.ReportConverter.CrystalReports.dll`. The path to it should look like the one below:
	
	`C:\Windows\Microsoft.NET\assembly\GAC_MSIL\Telerik.ReportConverter.CrystalReports\v4.0_16.0.22.119__a9d7983dfcc261be\Telerik.ReportConverter.CrystalReports.dll`.

	+ Copy the assembly to the `\ext` project folder.
	+ Add it as an assembly reference to your project.

- **Add code for reports conversion**

	Add a new class `Converter.cs` to your application. It will scan a specified folder for Crystal Reports `.rpt` files and convert them to Telerik Reporting `.trdx` definitions. This class would contain the following code:

	````CSharp
namespace CrystalReportsConverter
	{
		using System;
		using System.IO;
		using Telerik.Reporting.Interfaces;

		class Converter
		{
			public void Convert(string directory)
			{
				var logger = new ConsoleLogger();
				logger.LogInfo($"Conversion started in folder {directory}.");
				var files = Directory.GetFiles(directory, "*.rpt");
				try
				{                
					for (int i = 0; i < files.Length; i++)
					{
						logger.LogInfo($"Converting file {i + 1}/{files.Length}: {Path.GetFileName(files[i])}...");
						Convert(files[i], logger);
					}
				}
				catch (Exception ex)
				{
					logger.LogError(ex.Message);
				}
				finally
				{
					logger.LogInfo($"Conversion of {files.Length} Crystal Report files completed.");
				}
			}

			void Convert(string crystalReportFilePath, ILog logger)
			{
				var crConverter = new Telerik.ReportConverter.CrystalReports.CrystalReportsConverter();
				var trReport = crConverter.Convert(crystalReportFilePath, logger);
				
				var telerikReportFilePath = Path.ChangeExtension(crystalReportFilePath, "trdx");
				new Telerik.Reporting.XmlSerialization.ReportXmlSerializer()
					.Serialize(telerikReportFilePath, trReport);
			}
		}
	}
````


- Add a new class named `ConsoleLogger.cs`. It implements an interface used to generate a log during the conversion process. The implementation below outputs the log to the console:

	````CSharp
using System;
	using Telerik.Reporting.Interfaces;

	namespace CrystalReportsConverter
	{
		class ConsoleLogger : Telerik.Reporting.Interfaces.ILog
		{
			public void LogError(string message)
			{
				Console.WriteLine($"Error: {message}");
			}

			public void LogWarning(string message)
			{
				Console.WriteLine($"Warning: {message}");
			}

			public void LogInfo(string message)
			{
				Console.WriteLine(message);
			}

			void ILog.Log(string message)
			{
				this.LogInfo(message);
			}
		}
	}
````


- Add the code that instantiates the `Converter` class and performs the conversion of all the `.rpt` files placed in a folder named `c:\crystal-reports`. Add the following code to the `Main` method in `Program.cs` file:

	````CSharp
static void Main(string[] args)
	{
		const string crystalReportsFolder = @"c:\crystal-reports";
		new CrystalReportsConverter.Converter()
			.Convert(crystalReportsFolder);
	}
````


- **Start the application**

	At this point the application should be runnable, given the assembly/NuGet references are correctly configured.
	
	Start the application and examine the console window that will open. Consult with the troubleshooting steps below in case there are exceptions thrown during program execution.

- **Troubleshooting**

	+ `Error: Could not load file or assembly 'CrystalDecisions.CrystalReports.Engine, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304' or one of its dependencies. The system cannot find the file specified.`
  
	This error indicates that the Crystal Reports runtime is either not installed, or its assemblies cannot be loaded. `Telerik.ReportConverter.CrystalReports` assembly references the following Crystal Reports assemblies:
		* CrystalDecisions.CrystalReports.Engine, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304
		* CrystalDecisions.ReportAppServer.ReportDefModel, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304
		* CrystalDecisions.Shared, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304
		* CrystalDecisions.ReportAppServer.DataDefModel, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304

	In case you have installed a different version of Crystal Reports runtime, you have to add binding redirect rules to the application configuration file. Check the [Converting SAP Crystal Reports]({%slug telerikreporting/designing-reports/converting-reports-from-other-reporting-solutions/crystal-reports-converter%}) article, section **Configuring the Report Designer to Use the Converter** for the binding redirect snippets.
  
	+ `System.IO.FileNotFoundException: 'Could not load file or assembly 'log4net, Version=1.2.10.0, Culture=neutral, PublicKeyToken=692fbea5521e1304' or one of its dependencies. The system cannot find the file specified.'`
  
    This error indicates that the assembly `log4net.dll`, which is referenced by Crystal Reports assemblies, cannot be loaded. This assembly should be installed and registered in GAC by the Crystal Reports runtime installer. In case it is missing, reinstall Crystal Reports and try again.

    Please note that the referenced version 1.2.10.0 of `log4net.dll` differs from the same version of the same assembly that can be obtained via NuGet packages. The *publicKeyToken* of the assembly, referenced by Crystal Reports, is **692fbea5521e1304**, while the same version of the publicly available assembly is **1b44e1d426115821**.

- **Download sample application**

	The sample application `CrystalReportsConverter` is uploaded to our [reporting-samples](https://github.com/telerik/reporting-samples) GitHub repo. You can download it from the link [CrystalReportsConverter](https://github.com/telerik/reporting-samples/tree/master/ApplicationExamples/CrystalReportsConverter).

	The application references Telerik Reporting version 19.0.25.211. Please adjust the references according to the version of Telerik Reporting you're using.

## See Also

* [Converting SAP Crystal Reports]({%slug telerikreporting/designing-reports/converting-reports-from-other-reporting-solutions/crystal-reports-converter%})
