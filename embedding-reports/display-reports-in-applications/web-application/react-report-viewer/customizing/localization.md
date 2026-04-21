---
title: Localization
page_title: Localizing the React Report Viewer
description: "Undertand how to localize the messages displayed by the React Report Viewer, using the provided steps and sample code snippets."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/customizing/localization
tags: react, report, viewer, localization
published: True
reportingArea: React
position: 2
previous_url: /react-report-viewer-localization
---

# Localization of the React Report Viewer

The article elaborates on how to localize the messages displayed by the React Report Viewer.

1. To localize the report viewer, create a new TypeScript file `stringResources.ts`:

	{{source=CodeSnippets\Blazor\Docs\TypeScript\ViewerLocalizationStringResources.ts region=StringResourcesDefinition}}

	The file can contain all or only a part of the string resources which would be localized. For a full list of the report viewer string resources which could be localized, please refer to [HTML5 Report Viewer Localization](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization).

1. Import the new file in the component where the viewer is used:

	{{source=CodeSnippets\Blazor\Docs\TypeScript\ViewerLocalizationImport.ts region=ImportStringResources}}

1. Pass the localization resources to the viewer component through the `localizationResources` prop:

	{{source=CodeSnippets\Blazor\Docs\jsx\ReactViewerLocalization.jsx region=ReactViewerLocalization}}

	The `localizationResources` prop passes the string resources to the viewer during initialization, ensuring that all viewer areas (toolbar, content area, info messages) are properly localized.

## See Also

- [Use React Report Viewer with REST Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-rest-service)
- [Use React Report Viewer with Report Server](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-report-server)
