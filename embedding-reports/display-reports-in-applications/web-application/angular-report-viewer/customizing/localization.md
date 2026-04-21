---
title: Localization
page_title: Angular Report Viewer Localization
description: "Learn how to dynamically localize the Telerik Reporting Angular Report Viewer messages for multiple languages."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/customizing/localization
tags: localization
published: True
reportingArea: AngularWrapper
position: 1
previous_url: /angular-report-viewer-localization
---

# Localization Overview

The article elaborates on how to localize the messages displayed by the Angular Report Viewer.

1. To localize the report viewer, create a new TypeScript file `stringResources.ts`:

	{{source=CodeSnippets\Blazor\Docs\TypeScript\ViewerLocalizationStringResources.ts region=StringResourcesDefinition}}

	The file can contain all or only part of the string resources, which would be localized. For a full list of the report viewer string resources that could be localized, please refer to [HTML5 Report Viewer Localization](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization).

1. Import the new file with the localized strings in the component where the viewer is used:

	{{source=CodeSnippets\Blazor\Docs\TypeScript\ViewerLocalizationImport.ts region=ImportStringResources}}

1. In the component class, implement the `OnInit` lifecycle hook to set the localization resources for the desired culture:

	{{source=CodeSnippets\Blazor\Docs\TypeScript\AngularViewerLocalization.ts region=AngularViewerLocalizationApply}}

1. Bind the `localizationResources` property to the viewer component in the template:

	{{source=CodeSnippets\Blazor\Docs\html\AngularViewerLocalizationTemplate.html region=AngularViewerLocalizationTemplate}}

	The `localizationResources` input passes the string resources to the viewer during initialization, ensuring that all viewer areas (toolbar, content area, info messages) are properly localized.
