---
title: Resolving "DTD is Prohibited in This XML Document" Error in Telerik Reporting
description: Learn how to resolve the "DTD is prohibited in this XML document" error when generating reports programmatically using Telerik Reporting.
type: troubleshooting
page_title: Fixing DTD Prohibition Issue in Telerik Reporting Programmatic Report Generation
meta_title: Fixing DTD Prohibition Issue in Telerik Reporting Programmatic Report Generation
slug: fixing-dtd-prohibition-error-telerik-reporting
tags: reporting, xmlexception, dtd, trdx, reportprocessor, programmatic-report-generation
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
<td> Any </td>
</tr>
</tbody>
</table>

## Description

I encounter an `XmlException: For security reasons DTD is prohibited in this XML document. To enable DTD processing set the DtdProcessing property on XmlReaderSettings to Parse and pass the settings into XmlReader.Create method` error while attempting to render a report from a `.trdx` file using Telerik Reporting.

## Cause

The error occurs because the internal XML parser in Telerik Reporting disables DTD processing to mitigate potential security vulnerabilities, such as [XML External Entity (XXE) attacks](https://owasp.org/www-community/vulnerabilities/XML_External_Entity_(XXE)_Processing). Such attacks can lead to denial of service or other exploits.

Report definition files created by the Standalone Report Designer or the Web Report Designer typically do not include any DTD rules. If DTD processing is required, it may indicate that the file's XML content has been modified.

Another potential cause is incorrectly serving the `.trdx` file from a URI. If the server alters the XML content, this can trigger the error.

## Solution

To resolve the issue, follow these steps:

1. **Use a File System Path**  
Replace the report source with a file path pointing directly to the `.trdx` file stored locally. This ensures that the XML content is not modified during file serving.

2. **Provide the Report for Investigation**  
If the problem persists, consider opening a support ticket via the [Technical Support Center](https://www.telerik.com/account/support-center) and provide the problematic `.trdx` file for further investigation.