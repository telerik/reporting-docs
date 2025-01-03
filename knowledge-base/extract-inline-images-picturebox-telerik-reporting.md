---
title: Extracting Inline Images from PictureBox in Telerik Reporting
description: Learn how to retrieve and save inline images embedded in a PictureBox within a Telerik Reporting template file.
type: how-to
page_title: How to Extract and Save Inline Images from a PictureBox in Telerik Reporting Templates
slug: extract-inline-images-picturebox-telerik-reporting
tags: progress® telerik® reporting, report, picturebox, image, extract, save
res_type: kb
ticketid: 1674786
---

## Description

In Telerik Reporting, images can be embedded directly into a report's PictureBox. This becomes an issue when the original image file needs to be edited, but cannot be located outside the report template (.trdp file). This knowledge base article also answers the following questions:

- How can I save an embedded image from a Telerik Report PictureBox?
- How to extract an image embedded within a Telerik Reporting template?
- What is the method to retrieve inline images from Telerik Reporting files?

## Environment

| Product          | Version        |
|------------------|----------------|
| Progress® Telerik® Reporting | 18.2.24.924 |

## Solution

To extract and save the original image embedded in a PictureBox within a Telerik Reporting template file, follow these steps:

1. Make a copy of the report template file (.trdp) to ensure the original file remains unaltered and safe.

2. Change the file extension of the copied .trdp file to .zip. For example, if your report file is named `MyReport.trdp`, rename it to `MyReport.zip`.

3. Extract the content of the .zip file using any standard archiving software like WinRAR, WinZip, or the built-in Windows extractor.

4. Navigate to the `Images` folder within the extracted contents. Here, you will find the original image file that was embedded in the PictureBox.

5. Once located, you can copy the image file to another location for editing or use as needed.

**Important:** Always work with a copy of the report file to avoid any potential data loss or corruption of your original report template.

## See Also

- [Telerik Reporting Documentation](https://docs.telerik.com/reporting/overview)
- [Managing Report Resources](https://docs.telerik.com/reporting/designing-reports-managing-report-resources)
- [How to Add a PictureBox to a Report](https://docs.telerik.com/reporting/picturebox)

---
