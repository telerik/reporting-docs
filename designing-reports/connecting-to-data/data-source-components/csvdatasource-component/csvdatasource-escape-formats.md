---
title: Escape Formats
page_title: CsvDataSource Escape Formats Overview
description: "Learn which are the escape formats for the CsvDataSource and how you may configure and use them in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/csvdatasource-escape-formats
tags: csvdatasource,escape,formats
published: True
position: 2
previous_url: /csvdatasource-escape-formats
reportingArea: General
---
<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# CsvDataSource Escape Formats

The available Escape formats for the CsvDataSource component are `None`, `Backslash` and `BackslashAlternative`, `Quotes` and `QuotesMixed`. Unix style programs use backslashes for escaping only the symbol followed by the backslash. Excel and other programs that follow the RFC 4180 standard use a text qualifier to embed the whole field. The text qualifier usually is single quote or double quotes, but can be other symbol as well (according to RFC 4180 only double quotes have to be used).

| Escape format | Description |
| ------ | ------ |
|None|No symbols are escaped.|
|Backslash|Unix style programs use backslashes for escaping both field and record separators. Backslash is escaped with a second backslash.|
|BackslashAlternative|Some Unix style programs use backslashes for escaping field separators, but for escaping record separators can use \r\n instead of backslash. Backslash is escaped with a second backslash.|
|Quotes|Excel uses single or double quotes to embed escaped text (in accordance to RFC 4180). Single or double quotes are escaped with second single or double quotes.|
|QuotesMixed|Some files use a mixed escaping format - fields are embedded in quotes (Excel like), quotes (single or double) are escaped with backslash (Unix like). Backslash is escaped with a second backslash.|
