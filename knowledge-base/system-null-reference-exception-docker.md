---
title: Docker Container Error on Missing Fonts
description: "Learn why an error might be thrown when using Telerik Reporting in a Docker Linux container while using Windows fonts like Arial, and how to resolve it."
type: troubleshooting
page_title: Docker Container Error System.NullReferenceException Object reference not set to an instance of an object
slug: system-null-reference-exception-docker
ticketid: 1445482
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Environment</td>
			<td>Docker Linux</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

When I try to render my report in a Docker container, and the report uses fonts such as **Arial**, which are not available on Linux by default, an exception may be thrown(_look below_).

Alternatively, the report may be rendered, but in rendering formats where the actual font is needed, such as PDF, the font will be replaced with the default one for the given Linux image(_usually DejaVu Sans_).

## Error Message

```error
System.NullReferenceException: Object reference not set to an instance of an object.
   at Telerik.Reporting.Drawing.FontExtensions.ToGdiFont(IFont font)
   at Telerik.Reporting.Processing.GdiFontInfoCache.CreateValue(IFont font)
   at Telerik.Reporting.Processing.GdiFontCache1.GetValue(IFont font)
```

## Solution

Use the `Dockerfile` to install the missing Microsoft fonts via the `ttf-mscorefonts-installer` package. For example:

```dockerfile
RUN apt-get update && \
    apt-get install -y debconf-utils && \
    echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections && \
    apt-get install -y \
        fontconfig \
        ttf-mscorefonts-installer && \
    fc-cache -f -v && \
    rm -rf /var/lib/apt/lists/*
```

> tip Fonts not included in the package can be installed directly to the container using the [docker container cp](https://docs.docker.com/reference/cli/docker/container/cp/) command to copy the font from a local directory into the container's `/usr/share/fonts`.

## See Also

[Using Container Platforms](slug:telerikreporting/using-reports-in-applications/dot-net-core-support#using-container-platforms)
