---
title: TypeError Cannot read properties of undefined (reading 'options') in HTML5-based report viewers
description: Learn how to resolve the TypeError about 'options' in HTML5-based report viewers.
type: troubleshooting
page_title: TypeError Cannot read properties of undefined (reading 'options') in HTML5-based report viewers
meta_title: TypeError Cannot read properties of undefined (reading 'options') in HTML5-based report viewers
slug: cannot-read-properties-of-undefined-reading-options
tags: reporting, export, download, kendo ui, upgrade, options
res_type: kb
---

## Environment

<table>
    <tbody>
        <tr>
            <td> Product </td>
            <td> Reporting </td>
        </tr>
        <tr>
            <td> Version </td>
            <td> 19.1.25.521+ </td>
        </tr>
    </tbody>
</table>

## Description

After updating Telerik Reporting from version `19.0.25.313` to `19.1.25.521`, the export functionality (for example, downloading to Excel) no longer works.

The button fails to initiate the download, and there is a `TypeError: Cannot read properties of undefined (reading 'options')` error in the browser console.

The initial REST service responses are successful, suggesting a frontend issue.

## Cause

The issue likely occurs due to an incompatibility between the report viewer and the [Kendo UI for jQuery](https://www.telerik.com/kendo-jquery-ui) version referenced on the page. For example, Reporting version (`19.1.25.521`) is built against Kendo UI for jQuery version `2025.1.227`, while an older Kendo UI version may cause client-side errors.

## Solution

### Step 1: Check Current Kendo UI Version

1. Open the browser console on the page containing the report viewer.
1. Execute the following command:

   ```JavaScript
   kendo.version
   ```

### Step 2: Determine Required Kendo UI Version

1. Visit the [Telerik Reporting Release History](https://www.telerik.com/support/whats-new/reporting/release-history) page.
1. Locate your current Reporting version and open the corresponding page.
1. Check the compatible Kendo UI for jQuery version listed in the release notes.
1. If the Kendo UI version matches the required version for your Reporting release, continue with [Further Steps](#further-steps). If there is a mismatch, follow [step 3](#step-3-choose-a-resolution-method) to resolve the compatibility issue.

### Step 3: Choose a Resolution Method

#### Option A: Update Kendo UI for jQuery

Update your Kendo UI for jQuery reference to the compatible version based on the [step 1](#step-1-check-current-kendo-ui-version) and [step 2](#step-2-determine-required-kendo-ui-version).

#### Option B: Use Telerik Reporting's Kendo UI Subset

If your page does not use other Kendo UI components, replace the Kendo UI script reference with the subset provided by the Reporting REST service:

```html
<script src="api/reports/resources/js/telerikReportViewer-kendo"></script>
```

> note This approach ensures compatibility when the report viewer and Reporting REST service versions match.

## Further Steps

If you continue to experience issues after verifying the Kendo UI version, consider [capturing a HAR file](https://support.google.com/admanager/answer/10358597?hl=en#capture-your-http-network-session) using your browser's DevTools.

Then, attach this file to a support ticket via the [Telerik Reporting support system](https://www.telerik.com/account/support-center/contact-us/technical-support).

This will help the support team review the JavaScript files requested by your application and provide more targeted assistance.
