---
title: How to Dynamically Style the React Report Viewer
description: How to Dynamically Style the React Report Viewer
type: how-to
page_title: How to Dynamically Style the React Report Viewer
slug: how-to-dynamically-style-react-report-viewer
position:
tags: Web, React, ReactJS, Style, Styling
ticketid: 1578385
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
			<td>React</td>
		</tr>
	</tbody>
</table>

## Description

In certain cases, one might want to change the styling of the React Report Viewer widget dynamically.
The styles can be controlled through the `viewerContainerStyle` property, even in run-time.

## Solution

Using the `useState` React hook, we can create a `styles` object that we can pass to the `viewerContainerStyle` property.
Then, whenever we update the styles state, the page will be updated and the new style rules will take effect.

For example, we can hide the report viewer through a button with the following code:

```TypeScript
import React, { useState } from 'react';
import { TelerikReportViewer } from '@progress/telerik-react-report-viewer/dist/cjs/main';

export function ReportViewer() {

	let viewer;
	const reportSource = { report: 'Barcodes Report.trdp' };

	const [styles, setStyles] = useState({
		position: 'absolute',
		inset: "5px",
		overflow: 'hidden',
		clear: 'both',
		fontFamily: 'ms sans serif'
	})

	return (
		<>
			<TelerikReportViewer
				ref={el => viewer = el}
				serviceUrl="http://localhost:59655/api/reports/"
				reportSource={reportSource}
				viewerContainerStyle={styles}
				viewMode="INTERACTIVE"
				scaleMode="SPECIFIC"
				scale={1.0}
				enableAccessibility={false} />
			<button onClick={() => setStyles(prev => ({ ...prev, display: "none" }))}>Hide</button>
		</>
	)
}
```

## See Also

- [Using the State Hook](https://reactjs.org/docs/hooks-state.html)
