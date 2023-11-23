---
title: Providers from the BrowserModule have already been loaded
description: "Learn what causes the 'Providers from the BrowserModule have already been loaded' error when using the NARV and how to resolve it."
type: troubleshooting
page_title: BrowserModule runtime exception when loading the ReportingAngularViewerModule
slug: providers-from-browsermodule-already-loaded-narv
position: 
tags: Native Angular Report Viewer, Angular
ticketid: 1631545
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
			<td>Report Viewer</td>
			<td>Native Angular Report Viewer</td>
		</tr>
	</tbody>
</table>


## Description

I have integrated the [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%}) in the project and it build successfully, however, upon loading the page with the viewer it remains blank and there is an error in the browser's console.

## Steps to Reproduce

The issue reproduces when the module of the Native Angular Report Viewer - `ReportingAngularViewerModule`, is not loaded in the root module of the Angular application but is instead imported someplace else.

## Error Message

````
Error: Providers from the `BrowserModule` have already been loaded. If you need access to common directives such as NgIf and NgFor, import the `CommonModule` instead.
	at new BrowserModule (platform-browser.mjs:1128:19)
	at Object.BrowserModule_Factory [as useFactory] (platform-browser.mjs:1151:19)
	at Object.factory (core.mjs:8102:38)
	at R3Injector.hydrate (core.mjs:8015:35)
	at R3Injector.get (core.mjs:7903:33)
	at injectInjectorOnly (core.mjs:618:33)
	at ɵɵinject (core.mjs:622:60)
	at useValue (core.mjs:7697:65)
	at R3Injector.resolveInjectorInitializers (core.mjs:7952:17)
	at new NgModuleRef (core.mjs:19821:26)
	at resolvePromise (zone.js:1214:31)
	at resolvePromise (zone.js:1168:17)
	at zone.js:1281:17
	at _ZoneDelegate.invokeTask (zone.js:409:31)
	at core.mjs:23896:55
	at AsyncStackTaggingZoneSpec.onInvokeTask (core.mjs:23896:36)
	at _ZoneDelegate.invokeTask (zone.js:408:60)
	at Object.onInvokeTask (core.mjs:24197:33)
	at _ZoneDelegate.invokeTask (zone.js:408:60)
	at Zone.runTask (zone.js:178:47)
handleError @ core.mjs:8400
Promise.then (async)
nativeScheduleMicroTask @ zone.js:564
scheduleMicroTask @ zone.js:575
scheduleTask @ zone.js:399
onScheduleTask @ core.mjs:23891
scheduleTask @ zone.js:389
onScheduleTask @ zone.js:286
scheduleTask @ zone.js:389
scheduleTask @ zone.js:221
scheduleMicroTask @ zone.js:241
scheduleResolveOrReject @ zone.js:1268
resolvePromise @ zone.js:1205
(anonymous) @ zone.js:1121
(anonymous) @ zone.js:1137
webpackJsonpCallback @ jsonp chunk loading:77
(anonymous) @ src_app_reports_reports_module_ts.js:1
````

## Suggested Workarounds

The only workaround, currently available, is to `Import` the `ReportingAngularViewerModule` in the root module of the Angular application which by convention is the `AppModule` class defined in `app.module.ts`:

````TypeScript
import { ReportingAngularViewerModule } from '@progress/telerik-angular-native-report-viewer';

@NgModule({
	declarations: [
		AppComponent
	],
	imports: [
		BrowserModule,
		AppRoutingModule,
		ReportingAngularViewerModule
	],
	providers: [],
	bootstrap: [AppComponent]
})
````

## See Also

* [Angular - Launching your app with a root module](https://angular.io/guide/bootstrapping)