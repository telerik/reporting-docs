---
title: TypeError Cannot read properties of undefined (reading 'options') in HTML5-based report viewers
description: Learn how to resolve the TypeError about 'options' in HTML5-based report viewers after upgrading Telerik Reporting.
type: troubleshooting
page_title: TypeError Cannot read properties of undefined (reading 'options') in HTML5-based report viewers
meta_title: TypeError Cannot read properties of undefined (reading 'options') in HTML5-based report viewers
slug: cannot-read-properties-of-undefined-reading-options
tags: reporting, export, download, kendo ui, upgrade, options, javascript, html5
res_type: kb
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td> Telerik Reporting </td>
</tr>
<tr>
<td> Version </td>
<td> 19.1.25.521 and later </td>
</tr>
<tr>
<td> Report Viewer </td>
<td> HTML5-based Report Viewer </td>
</tr>
</tbody>
</table>

## Description

After upgrading Telerik Reporting from version `19.0.25.313` to `19.1.25.521` or later, the export functionality in HTML5-based report viewers stops working. Export operations (such as downloading reports to Excel, PDF, or other formats) fail to initiate, and the following JavaScript error appears in the browser console:

```
TypeError: Cannot read properties of undefined (reading 'options')
```

The REST service continues to respond successfully for initial requests, indicating this is a client-side JavaScript compatibility issue.

## Error Details

This error typically occurs during export operations and may manifest as:
- Export buttons becoming unresponsive
- Downloads not starting when clicking export buttons
- JavaScript console errors preventing report viewer functionality

## Cause

The issue occurs due to version incompatibility between the HTML5 Report Viewer and the Kendo UI for jQuery library referenced on the page. 

When Telerik Reporting is upgraded, it is built against a specific version of Kendo UI for jQuery. If your page references an older or incompatible version of Kendo UI, it can cause JavaScript errors in the report viewer's export functionality.

**Example**: Telerik Reporting version `19.1.25.521` is built against Kendo UI for jQuery version `2025.1.227`. Using an older Kendo UI version will cause client-side compatibility issues.

## Solution

### Step 1: Check Current Kendo UI Version

1. Open the browser console on the page containing the report viewer
2. Execute the following command:
   ```javascript
   kendo.version
   ```
3. Note the returned version number

### Step 2: Determine Required Kendo UI Version

1. Visit the [Telerik Reporting Release History](https://www.telerik.com/support/whats-new/reporting/release-history)
2. Locate your current Reporting version
3. Check the compatible Kendo UI for jQuery version listed in the release notes

### Step 3: Choose a Resolution Method

#### Option A: Update Kendo UI for jQuery (Recommended)

Update your Kendo UI for jQuery reference to the compatible version:

- For Reporting version `19.1.25.521`: Use Kendo UI for jQuery version `2025.1.227` or higher
- For other Reporting versions: Check the specific requirement in the Release History

#### Option B: Use Telerik Reporting's Kendo UI Subset

If your page doesn't use other Kendo UI components, replace the Kendo UI script reference with the subset provided by Telerik Reporting:

```html
<script src="api/reports/resources/js/telerikReportViewer-kendo"></script>
```

**Note**: This approach ensures compatibility when the report viewer and Reporting REST service versions match.

## Prerequisites

- Access to modify JavaScript references on the page
- Administrative access to update Kendo UI for jQuery (for Option A)
- Telerik Reporting REST service running

## Verification

After implementing the solution:

1. Clear browser cache
2. Reload the page with the report viewer
3. Test export functionality by attempting to download a report
4. Verify no JavaScript errors appear in the browser console

## See Also

- [Telerik Reporting Release History](https://www.telerik.com/support/whats-new/reporting/release-history)
- [Kendo UI for jQuery Documentation](https://www.telerik.com/kendo-jquery-ui)

## Further Steps

If the issue persists after implementing the above solutions:

1. [Generate a HAR file](https://support.google.com/admanager/answer/10358597?hl=en#capture-your-http-network-session) to capture network activity
2. Submit a support ticket through the [Telerik Reporting support system](https://www.telerik.com/account/support-center/contact-us/technical-support)
3. Attach the HAR file so a support engineer can analyze the JavaScript file requests and responses

Include the following information in your support ticket:
- Current Telerik Reporting version
- Current Kendo UI for jQuery version
- Browser and version information
- Steps to reproduce the issue
