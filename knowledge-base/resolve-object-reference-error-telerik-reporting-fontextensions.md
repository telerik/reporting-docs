---
title: Resolving Object Reference Error with Telerik.Reporting.Drawing.FontExtensions.ToEngineFont in .NET on Alpine Docker
description: Learn how to fix the 'System.NullReferenceException' error related to font processing in Telerik Reporting within a .NET application deployed on Alpine Docker.
type: troubleshooting
page_title: Fix System.NullReferenceException for FontExtensions.ToEngineFont in Telerik Reporting on Alpine Docker
slug: resolve-object-reference-error-telerik-reporting-fontextensions
tags: progress® telerik® reporting, .net8, docker, alpine, kubernetes, font, system.nullreferenceexception
res_type: kb
ticketid: 1653593
---

## Environment

| Product | Progress® Telerik® Reporting |

## Description

When deploying a .NET application to an Alpine Docker Container Image running on Kubernetes, the following error occurs during report rendering. This issue is related to the application's inability to resolve fonts correctly within the Alpine environment.

## Error Message

`System.NullReferenceException: Object reference not set to an instance of an object at Telerik.Reporting.Drawing.FontExtensions.ToEngineFont(IFont font) ...`

## Cause

The error is caused by the absence of necessary fonts in the Alpine Docker image. Since the application cannot find any fonts, it results in a `NullReferenceException` when attempting to process fonts using `Telerik.Reporting.Drawing.FontExtensions.ToEngineFont`.

## Solution

To fix this issue, install the fonts used by your reports to your Alpine Docker container. You can install any supported TrueType font _(see [Fonts Requirements]({%slug telerikreporting/designing-reports/rendering-and-paging/fonts-requirements%}))_ but if a report uses a different font, it will be substituted with whatever is available.
For example, you can install the commonly used Microsoft TrueType fonts using the commands below.

````bash
apk update
apk upgrade
apk add freetype
apk add fontconfig
apk add msttcorefonts-installer
update-ms-fonts
fc-cache -f
````

These commands update the package list, upgrade existing packages, and install FreeType and font configuration tools. It also installs Microsoft's core TrueType fonts and updates the font cache, ensuring that the application can resolve fonts correctly.

## See Also

* [Fonts Requirements]({%slug telerikreporting/designing-reports/rendering-and-paging/fonts-requirements%})
* [Telerik Reporting Documentation](https://docs.telerik.com/reporting)
* [Alpine Linux Package Management](https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management)
* [Docker Official Documentation](https://docs.docker.com/)
