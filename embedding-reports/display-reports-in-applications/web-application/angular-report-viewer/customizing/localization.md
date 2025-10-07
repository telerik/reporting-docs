---
title: Localization
page_title: Angular Report Viewer Localization
description: "Learn how to dynamically localize the Telerik Reporting Angular Report Viewer messages for multiple languages."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/customizing/localization
tags: localization
published: True
reporting_area: AngularWrapper
position: 1
previous_url: /angular-report-viewer-localization
---

# Localization Overview

The article elaborates on how to localize the messages displayed by the Angular Report Viewer.

1. To localize the report viewer, create a new TypeScript file `stringResources.ts`:

   ```TypeScript
   export class StringResources {
   	static english = {
   		loadingReport: 'Loading...',
   		// override other string resources here
   	}
   	static japanese = {
   		loadingReport: 'ちょっと、まってください...',
   		// override other string resources here
   	}
   	// override string resources for other cultures here
   }
   ```

   The file can contain all or only part of the string resources which would be localized. For a full list of the report viewer string resources which could be localized, please refer to [HTML5 Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization%}).

1. Import the new file with the localized strings in the component where the viewer is used:

   ```TypeScript
   import { StringResources } from './stringResources';
   ```

1. Implement the `AfterViewInit` event and extend the viewer object with the string resources for the desired culture:

   ```TypeScript
   import { AfterViewInit, Component, ViewChild } from '@angular/core';
   import { TelerikReportViewerComponent } from '@progress/telerik-angular-report-viewer';
   import { StringResources } from './stringResources';

   export class AppComponent implements AfterViewInit {
   	@ViewChild('viewer1') viewer: TelerikReportViewerComponent;
   	ngAfterViewInit(): void {
   		const language = navigator.language;
   		let resources = StringResources.english; // default
   		if(language === 'ja-JP'){
   			resources = StringResources.japanese;
   		}
   		this.viewer.viewerObject.stringResources = Object.assign(this.viewer.viewerObject.stringResources, resources);
   	}
   }
   ```
