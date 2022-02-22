---
title: Get Available Document Formats
page_title: Get Available Document Formats 
description: Get Available Document Formats
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-available-document-formats
tags: get,available,document,formats
published: True
position: 0
---

# Get Available Document Formats



Public interface for retrieving available document formats.

## Request

    GET /api/reports/formats

## Response


| HTTP Status Code | Description |
| ------ | ------ |
|`200 OK`|Available document formats retrieved successfully|


__Response Body__ 

An array containing [FormatInfo]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/formatinfo%}) objects, which represent the available document formats for reports         

## Sample

    GET /api/reports/formats HTTP/1.1

    
          Response Message
          HTTP/1.1 200 OK

          [
            {"name":"PDF","localizedName":"Acrobat (PDF) file"},
            {"name":"CSV","localizedName":"CSV (comma delimited)"},
            {"name":"XLS","localizedName":"Excel 97-2003"},
            {"name":"XLSX","localizedName":"Excel Worksheet"},
            {"name":"PPTX","localizedName":"PowerPoint Presentation"},
            {"name":"RTF","localizedName":"Rich Text Format"},
            {"name":"IMAGE","localizedName":"TIFF file"},
            {"name":"DOCX","localizedName":"Word Document"},
            {"name":"XPS","localizedName":"XPS Document"}
       ]

