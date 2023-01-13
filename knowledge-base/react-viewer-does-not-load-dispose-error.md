---
title: The React Report Viewer Does Not Load
description: The React Report Viewer is not loaded on the page and there are errors in the console
type: troubleshooting
page_title: Dispose Is Not a Function Error On Loading the React Report Viewer
slug: react-viewer-does-not-load-dispose-error
position: 
tags: 
ticketid: 1568686
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
			<td>Project Type</td>
			<td>ReactJs Application</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>React</td>
		</tr>
	</tbody>
</table>

## Description

Loading a page with the React Report Viewer does not load the viewer, instead, there are errors in the browser console

## Error Message

````
react-dom.development.js:22686 

	Uncaught TypeError: perspectiveManager.dispose is not a function
	at Object.dispose (telerikReportViewer.js:9876:1)
	at TelerikReportViewer.dispose (telerik-report-viewer.js:345:1)
	at TelerikReportViewer.componentWillUnmount (telerik-report-viewer.js:237:1)
	at callComponentWillUnmountWithTimer (react-dom.development.js:22699:1)
	at safelyCallComponentWillUnmount (react-dom.development.js:22720:1)
	at commitDeletionEffectsOnFiber (react-dom.development.js:23948:1)
	at recursivelyTraverseDeletionEffects (react-dom.development.js:23813:1)
	at commitDeletionEffectsOnFiber (react-dom.development.js:23937:1)
	at recursivelyTraverseDeletionEffects (react-dom.development.js:23813:1)
	at commitDeletionEffectsOnFiber (react-dom.development.js:23988:1)
````


## Cause\Possible Cause(s)

The `React` project uses `StrictMode` which is throwing errors because of how we dispose the report viewer on unmounting.

## Suggested Workarounds

Until we resolve the problem internally, the error can be avoided by not using `StrictMode` on the `TelerikReportViewer` component:

````TypeScript
import React from 'react';

function ExampleApplication() {
	return (
	<div>
		<TelerikReportViewer ... />
		<React.StrictMode>
		<div>
			<ComponentOne />
			<ComponentTwo />
		</div>
		</React.StrictMode>
	</div>
	);
}
````


## See Also

* [Strict Mode - React Docs](https://reactjs.org/docs/strict-mode.html)