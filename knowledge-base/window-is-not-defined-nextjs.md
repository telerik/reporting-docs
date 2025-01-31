---
title: Telerik React Report Viewer not working in NextJS
description: Telerik React Report Viewer not working in NextJS
type: troubleshooting
page_title: Telerik React Report Viewer not working in NextJS
slug: window-is-not-defined-nextjs
tags: Web, ReactJS, React, HTML5, Report Viewer
ticketid: 1581204
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
			<td>NextJs</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>React</td>
		</tr>
	</tbody>
</table>


## Description

The NextJS application cannot render the page with the `React Report Viewer`. Instead of the report viewer, the page shows a stack trace of errors.

## Steps to Reproduce

Create a new NextJS application through `create-next-app`, then add the [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%}) to a page and try to load that page.

## Error Message

````
ReferenceError: window is not defined
````

## Cause

[Next.js](https://nextjs.org/) is universal, which means it executes code first server-side, then client-side. The [window](https://developer.mozilla.org/en-US/docs/Web/API/Window) object is only present client-side which is a problem because our [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%}) interacts with it. 

## Solution

Render the [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%}) in a [NextJS Client Component](https://nextjs.org/docs/app/building-your-application/rendering/client-components) which you may enable with the [use client](https://nextjs.org/docs/app/api-reference/directives/use-client) directive, for example:

````JavaScript
"use client"

import dynamic from 'next/dynamic'

const ReactReportViewer = dynamic(() => import('@progress/telerik-react-report-viewer')
                          .then(types => types.TelerikReportViewer), { ssr: false });

export default function Home() {
  return (
    <>
        <link href="https://kendo.cdn.telerik.com/{}kendosubsetversion}}/styles/kendo.common.min.css" rel="stylesheet" />
        <link href="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/styles/kendo.blueopal.min.css" rel="stylesheet" />

      <ReactReportViewer
        serviceUrl="https://demos.telerik.com/reporting/api/reports/"
        reportSource={{
            report: 'Dashboard.trdx',
            parameters: {}
        }}
        viewerContainerStyle = {{
            position: 'absolute',
            inset: '5px'
        }}
        viewMode="INTERACTIVE"
        scaleMode="SPECIFIC"
        scale={1.0}
        enableAccessibility={false} />
    </>
  );
}
````

## Sample Project

Download the sample project from our [reporting-samples repository](https://github.com/telerik/reporting-samples/tree/master/nextjs-telerik-rv-example).

## Notes

The `next.config.js` configuration may also need to be updated so that React's `StrictMode` is not being used:

````JavaScript
/** @type {import('next').NextConfig} */
const nextConfig = {
    reactStrictMode: false
};

export default nextConfig;
````

## See Also

* [Dynamic Import with no SSR](https://nextjs.org/docs/advanced-features/dynamic-import#with-no-ssr)
* [Window is not defined in Next.js React app](https://stackoverflow.com/questions/55151041/window-is-not-defined-in-next-js-react-app)
