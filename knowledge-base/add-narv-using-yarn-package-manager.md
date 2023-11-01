---
title: Using Native Angular Report Viewer with Yarn
description: "Learn how the native Angular Report Viewer can be added to an Angular project that uses the yarn package manager."
type: how-to
page_title: Install the Native Angular Report Viewer using yarn
slug: add-narv-using-yarn-package-manager
tags: Angular, Native Angular Report Viewer, Yarn
ticketid: 1628141
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>17.2.23.1010+</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>Native Angular Report Viewer</td>
		</tr>
	</tbody>
</table>

## Description

After adding the [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%}) to my project that uses the [yarn](https://yarnpkg.com/) package manager, the project does not build and there are warnings about unresolved peer dependencies and packages with incorrect versions.

## Solution

1. Add the viewer package to the project's `package.json` with the `yarn add @progress/telerik-angular-native-report-viewer` command.
1. Use the `resolutions` field in `package.json` to specify the versions of the viewer's peer dependencies:

	````JSON
{
		...
		"resolutions": {
			"@progress/kendo-angular-buttons": "~13.2.0",
			"@progress/kendo-angular-common": "~13.2.0",
			"@progress/kendo-angular-dateinputs": "~13.2.0",
			"@progress/kendo-angular-dialog": "~13.2.0",
			"@progress/kendo-angular-dropdowns": "~13.2.0",
			"@progress/kendo-angular-icons": "~13.2.0",
			"@progress/kendo-angular-indicators": "~13.2.0",
			"@progress/kendo-angular-inputs": "~13.2.0",
			"@progress/kendo-angular-intl": "~13.2.0",
			"@progress/kendo-angular-l10n": "~13.2.0",
			"@progress/kendo-angular-label": "~13.2.0",
			"@progress/kendo-angular-layout": "~13.2.0",
			"@progress/kendo-angular-listbox": "~13.2.0",
			"@progress/kendo-angular-navigation": "~13.2.0",
			"@progress/kendo-angular-pager": "~13.2.0",
			"@progress/kendo-angular-popup": "~13.2.0",
			"@progress/kendo-angular-progressbar": "~13.2.0",
			"@progress/kendo-angular-toolbar": "~13.2.0",
			"@progress/kendo-angular-tooltip": "~13.2.0",
			"@progress/kendo-angular-treeview": "~13.2.0",
			"@progress/kendo-licensing": "^1.0.2",
			"@progress/telerik-common-report-viewer": "20.23.1010"
		}
	}
````


1. Some of the viewer's peer dependencies have their own dependencies that have to be manually added. The following command can be used to install the necesary packages:

	````powershell
yarn add @angular-devkit/schematics @angular-devkit/core @progress/kendo-angular-upload @progress/kendo-drawing @progress/kendo-svg-icons
````


1. Lastly, run `yarn` or `yarn install` to make sure that all packages are installed.

## Notes

Depending on the Angular version used in the project, the command from the 3rd step may need to be modified to install the correct version of the `@angular` packages, for example, with an **Angular 16** project:

````powershell
yarn add @angular-devkit/schematics@16 @angular-devkit/core@16 @progress/kendo-angular-upload @progress/kendo-drawing @progress/kendo-svg-icons
````

## See Also

* [Dependencies and versions](https://classic.yarnpkg.com/en/docs/dependencies)
* [Selective dependency resolutions](https://classic.yarnpkg.com/lang/en/docs/selective-version-resolutions/)
