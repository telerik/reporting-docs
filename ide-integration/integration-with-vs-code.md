---
title: Integration with VS Code
page_title: Integration with VS Code
description: Learn how to add a reference to the Telerik Document Processing Libraries (DPL) packages in an existing Telerik UI for Blazor application using the Document Processing Libraries Wizard.
slug: integration-with-vs-code
tags: integration, vscode, document, processing, configure, wizard
published: True
position: 1
---

# Configuring Document Processing Libraries

With **Q2 2024** we are adding a Document Processing Configuration Wizard for **Visual Studio Code**. The wizard is included in the Visual Studio Code extension for [Telerik UI for Blazor ](https://marketplace.visualstudio.com/items?itemName=TelerikInc.blazortemplatewizard) and [Telerik UI for ASP.NET Core](https://dotnet.microsoft.com/en-us/apps/aspnet) and it enables you to easily add the required packages when working with the Telerik Document Processing Library.

## Getting the Wizard

To use the Document Processing Libraries Wizard, install the [Telerik UI for Blazor Visual Studio Code extension](https://marketplace.visualstudio.com/items?itemName=TelerikInc.blazortemplatewizard).

## Starting the Wizard

### Using the File Explorer Context Menu

To use **Document Processing Libraries Configuration Wizard** from the **VS Code**'s file explorer's context menu:

 1\. Right-click on a file in the files tree.

 2\. Select the `Telerik UI for Blazor: Add Document Processing Libraries`.

  ![Configure Document Processing Wizard, Context Menu](images/DPLBlazor_ContextMenu.png) 

### Using the Code Editor Command Palette

To use **Document Processing Libraries Configuration Wizard** from the **VS Code** command palette:

 1\. Open a `.razor` file or a `Razor` language in the code editor and right-click in the editor to see the `Command Palette..` option.

  ![Configure Document Processing Wizard, Command Palette](images/DPLBlazor_CommandPallete.png)  

 2\. Select the `Telerik UI for Blazor: Add Document Processing Libraries`.

 ![Configure Document Processing Wizard, Command Palette](images/DPLBlazor_Pallete.png) 

After executing one of the options the wizard must appear like this: 

 ![Configure Document Processing Wizard](images/Configure_Document_Processing_Wizard.png)

The **Telerik Document Processing Configuration wizard** allows you to select which libraries your project would use. It allows you to use `Dev` or `Trial` license and selection of the `.csproj` file, in which you want the installation to be provided. This option is useful in cases when the user has many opened projects in the workspace. If a library you selected has any dependencies, they are automatically checked. In the table below there is a list of the assemblies that will be selected for each library:

|Library  |Packages |
|---------|---------|
|**RadPdfProcessing**|Documents.Core<br>Documents.Fixed<br>Zip<br>Documents.ImageUtils<br>Documents.Fixed.FormatProviders.Image.Skia<br>Documents.CMapUtils|
|**RadSpreadProcessing**|Documents.Core<br>Documents.Fixed<br>Documents.Spreadsheet<br>Documents.SpreadSheet.FormatProviders.OpenXml<br>Documents.SpreadSheet.FormatProviders.Pdf<br>Documents.Spreadsheet.FormatProviders.Xls<br>Documents.ImageUtils<br>Zip|
|**RadWordsProcessing**|Documents.Core<br>Documents.Fixed<br>Documents.Flow<br>Documents.Flow.FormatProviders.Pdf<br>Documents.ImageUtils<br>Documents.Flow.FormatProviders.Doc<br>Documents.DrawingML<br>Zip|


## See Also

* [Visual Studio Code Integration for Telerik UI for Blazor Overview](https://docs.telerik.com/blazor-ui/getting-started/vs-code-integration/introduction) 

