---
title: Pass Values to Report Parameters
page_title: Passing Values to Report Parameters from a custom UI
description: "Understand how to update the report parameters with values passed from a custom UI instead of using the report viewer's default parameters area, using the provided code snippets."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/customizing/how-to-pass-values-to-report-parameters
tags: react, report, viewer, pass, values, to, report, parameters
published: True
reporting_area: React
position: 3
previous_url: /react-report-viewer-how-to-pass-values-to-report-parameters
---

# How to Pass Values to Report Parameters

This topic explains how to update the report parameters with values passed from a custom UI instead of using the report viewer's default parameters area.
The report identifier and all required parameters values for it are packed in a **ReportSource** object.
To update the report source, the [reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}) method is used.

## Pass values to report parameters from the application UI

The following example demonstrates how to update the report viewer when the selected value of the dropdown changes. It assumes that the viewer component is defined in a separate file, `ReportViewer.js`. The component may be imported and used in the `index.js` as follows :

**index.js**:

```JavaScript
import 'react-app-polyfill/ie11';
import 'react-app-polyfill/stable';
import React from 'react';
import ReactDOM from 'react-dom';
import reportWebVitals from './reportWebVitals';
import {ReportViewer} from './ReportViewer.js';

ReactDOM.render(
	<ReportViewer/>,
	document.getElementById('root')
);
```

**ReportViewer.js**:

```JavaScript
import 'react-app-polyfill/ie11';
import 'react-app-polyfill/stable';
import { React, useRef} from 'react';
import './index.css';
import { TelerikReportViewer } from '@progress/telerik-react-report-viewer'

export function ReportViewer() {
	const viewerRef = useRef(null);

	const reportSource = {
			report: 'Invoice.trdx',
			parameters: {}
			};

	const viewerContainerStyle = {
			position: 'absolute',
			inset: "5px",
			overflow: 'hidden',
			clear: 'both'
			};

	return (
		<>
		<div id="invoiceIdSelector">
			<label htmlFor="invoiceId">Invoices</label>

			<select defaultValue="SO51081" id="invoiceId" onChange={(e => {
				const { viewerObject } = viewerRef.current;

				viewerObject.reportSource({
					report: viewerObject.reportSource().report,
					parameters: {
							OrderNumber: e.target.value
						}
					})
				})}
			title="Select the Invoice ID">
				<option value="SO51081">SO51081</option>
				<option value="SO51082">SO51082</option>
				<option value="SO51083">SO51083</option>
			</select>
		</div>

		<TelerikReportViewer
			ref={viewerRef}
			serviceUrl="https://demos.telerik.com/reporting/api/reports/"
			reportSource={reportSource}
			viewerContainerStyle={viewerContainerStyle}
			viewMode="INTERACTIVE"
			scaleMode="SPECIFIC"
			scale={1.0}
			enableAccessibility={false} />
		</>
	)
}
```

> The React Report Viewer is not a native react.js component. If you use a state variable as the value of a report parameter, the report viewer will not refresh with the new value when the setState method of the state variable is executed.

> In order for the report viewer to be updated with the new value, the **reportSource(rs)** method must be called with the updated value of the state variable.

## See Also

- [How to Use React Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-rest-service%})
- [How to Use React Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-report-server%})
