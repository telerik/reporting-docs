---
title: Localization
page_title: Localization of the Standalone Report Designer
description: "Learn how to translate and localize the Standalone Report Designer so that the users may create Telerik Reports more conveniently."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/localization
tags: localization
published: True
position: 3
previous_url: /standalone-report-designer-localization
reportingArea: General
---

# Localization Overview

This article elaborates on localizing the Standalone Report Designer application. For more information on localizing reports see [Localizing Reports]({%slug telerikreporting/designing-reports/localizing-reports%}).

Application internationalization involves improving the experience, and decreasing the learning curve, for all non-English speakers. To enable Report Designer localization, we provide resource files. The string resources include keys for all UI areas. This includes all backstage items, ribbon items, wizards, editors, enum descriptions, and properties.

The Report Designer UI language depends on the OS language, Report Designer option and on the available resource files. The language setting is part of the Report Designer Options General section. The available languages in the languages dropdown depend on the available resource files. This option forces the designer to load the desired language Report Designer resources. The Report Designer uses .NET Framework editors that are fully localized only when the OS UI language is set to the desired language.

The resource files should be in a folder with the name of the target culture. This folder should be in a Resources directory sibling to the Report Designer executable. For example for Spanish (Mexico) UI the resources should be available in: *Report Designer folder\Resources\es-MX*

The default localization resources are provided within the Telerik Reporting installation directory (%PROGRAMFILES(x86)%\Progress\Telerik Reporting {{site.suiteversion}}\Bin\Resources)

We provide reference translations for some popular languages in this GitHub repository: [telerik/reporting-docs/report-designer-translations](https://github.com/telerik/reporting-docs/tree/master/report-designer-translations) For the reference translations we have partially used Azure Cognitive Services. To edit the provided resx reference files, use Visual Studio or a resx editing tool of your choice. In order to merge the changes with our next release resources create a pull request with the changes. Any pull requests will be carefully reviewed and included in the next release.

If the resources are modified or the Report Designer language is changed restart of the Report Designer is required.

## See Also

* [Windows Language Packs](https://support.microsoft.com/en-us/windows/language-packs-for-windows-a5094319-a92d-18de-5b53-1cfc697cfca8)
