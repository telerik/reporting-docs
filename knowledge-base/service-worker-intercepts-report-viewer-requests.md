---
title: Service Worker Intercepts Report Viewer API Requests and Returns HTML Instead of Report Documents
page_title: Report Viewer Receives HTML Instead of Report Documents Due to Service Worker Interception
description: "Learn how to resolve the issue where a service worker intercepts Telerik Report Viewer API requests and returns the index HTML page instead of the expected report document."
slug: service-worker-intercepts-report-viewer-requests
tags: telerik, reporting, html5, report, viewer, service, worker, pwa, navigate, intercept, html, document, export, download
published: True
type: troubleshooting
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

When exporting a report from a web-based report viewer, the browser receives an HTML page instead of triggering a download for the expected report document (PDF, XLSX, DOCX, etc.). The problem occurs in production but not during local development.

## Cause

The most common cause of this issue is a **service worker** intercepting the report viewer's API requests and responding with an HTML page instead of forwarding the request to the Reporting REST Service.

Service workers are commonly used in Progressive Web Apps (PWA) and single-page applications (SPA) to enable offline support and improve performance. A typical service worker contains logic similar to:

```JavaScript
self.addEventListener('fetch', (event) => {
    const shouldServeIndexHtml = event.request.mode === 'navigate';

    if (shouldServeIndexHtml) {
        event.respondWith(caches.match('/index.html'));
    }
});
```

The `event.request.mode === 'navigate'` check is intended to serve the cached `index.html` for navigation requests so that client-side routing works offline. However, certain browser behaviors and request patterns can cause report document download requests to be classified as `navigate` requests, which leads the service worker to intercept them and return the HTML page instead of allowing the request to reach the Reporting REST Service.

## Diagnosing the Issue

To confirm that a service worker is the cause:

1. Open the browser **DevTools** > **Network** tab.
1. Export a report from the viewer.
1. Locate the document request (the URL contains a query parameter `response-content-disposition=attachment`).
1. Check the **Response Headers** for the `Content-Type` value. If it is `text/html` instead of the expected document content type (e.g. `application/pdf`), the response is being intercepted.
1. Check the **Size** column for the document request. If it shows **(ServiceWorker)** instead of the actual byte size, the response was served by the service worker.
1. Alternatively, temporarily disable the service worker through DevTools > **Application** > **Service Workers** > **Bypass for network**, then retry the export. If the issue is resolved, the service worker is the cause.

## Solution

Update the service worker to exclude Reporting REST Service API requests from interception. The exact change depends on the service worker implementation, but the general approach is to add a condition that skips requests targeting the reporting API:

```JavaScript
self.addEventListener('fetch', (event) => {
    const shouldServeIndexHtml = event.request.mode === 'navigate'
        && !event.request.url.includes('/api/reports/');

    if (shouldServeIndexHtml) {
        event.respondWith(caches.match('/index.html'));
    }
});
```

The key addition is `&& !event.request.url.includes('/api/reports/')`, which ensures that any request whose URL contains `/api/reports/` is forwarded to the server instead of being intercepted by the service worker.

>tip Adjust the `/api/reports/` path segment to match your specific Reporting REST Service route if you have configured a custom route.

## See Also

- [How to Change the Reporting REST Web API Routes]({%slug how-to-change-reporting-rest-web-api-routes-registered-by-default%})
- [Hosting the Reporting REST Service in ASP.NET Core]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/overview%})
