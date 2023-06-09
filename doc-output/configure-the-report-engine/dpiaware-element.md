---
title: dpiAware Element
page_title: dpiAware Element Configuration
description: "Learn how to change the DPI awareness settings of the application through the dpiAware configuration element."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/dpiaware-element
tags: dpiaware,element
published: True
position: 9
previous_url: /configuring-telerik-reporting-dpiaware
---

# dpiAware Element Overview

Telerik Reporting uses the machine `DPI` settings to determine the physical sizes of report items, images, calculate text sizes and draw the graphic primitives. That's why it is vital to obtain the correct DPI settings of the machine which renders and shows the report in any of the viewers. If the machine's DPI settings are set higher than the default value of 96, it is recommended to make the application DPI-aware, either through an application manifest or by setting the `<dpiAware>` configuration element, as shown below.

## General Information

Usually, the DPI awareness is set on the application level through a [manifest file](https://learn.microsoft.com/en-us/windows/win32/hidpi/high-dpi-desktop-application-development-on-windows), but in some cases such manifest cannot be applied. That is why the reporting engine provides the option to explicitly set the DPI awareness flag prior to rendering the report.

The `<dpiAware>` section has only one attribute: __dpiAwareness__. Its value corresponds with the Windows API [PROCESS_DPI_AWARENESS enumeration](https://learn.microsoft.com/en-us/windows/win32/api/shellscalingapi/ne-shellscalingapi-process_dpi_awareness) and can be one of the following:

* `PROCESS_DPI_UNAWARE = 0`
* `PROCESS_SYSTEM_DPI_AWARE = 1`
* `PROCESS_PER_MONITOR_DPI_AWARE = 2`

The default value of the `dpiAwareness` attribute is `PROCESS_DPI_UNAWARE_NOT_SET`. The current process's DPI awareness is set using the native Windows API function [SetProcessDpiAwareness](https://learn.microsoft.com/en-us/windows/win32/api/shellscalingapi/nf-shellscalingapi-setprocessdpiawareness). It is important to note that once the process' DPI awareness is set, every next function call will fail with `E_ACCESSDENIED` result.

> This API function is available on `Windows Vista and later` operating systems. If Telerik Reporting is used on a machine with older OS, the DPI awareness would not be set and report rendering might produce unexpected results.

>caption __Example__

The following snippet demonstrates how to set the current application's DPI awareness to `PROCESS_SYSTEM_DPI_AWARE`.

XML-based configuration file:

````XML
<Telerik.Reporting>
	...
	<dpiAware dpiAwareness="PROCESS_SYSTEM_DPI_AWARE"></dpiAware>
</Telerik.Reporting>
````

JSON-based configuration file:

````JSON
"telerikReporting": {
	"dpiAware": {
		"dpiAwareness": "PROCESS_SYSTEM_DPI_AWARE"
	}
}
````

## DPI Awareness in Report Viewers

The following list explains how the DPI awareness is respected in applications that use Telerik Reporting:

### Windows Forms Report Viewer

The Windows Forms applications are __not__ DPI-aware by default. The recommended approach for declaring an application as DPI-aware is adding a `dpiAware` element to its application manifest, as shown in the article [Windows Forms Application Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}#declaring-the-application-as-dpi-aware).

### WPF Report Viewer

The WPF Report Viewer must be used in a WPF application and they are system DPI-aware __by default__, thus no additional settings need to be applied. In case you want to change the awareness to *per monitor*, please check the article [Developing a Per-Monitor DPI-Aware WPF Application](https://learn.microsoft.com/en-us/windows/win32/hidpi/declaring-managed-apps-dpi-aware).

### HTML5-based Report Viewers

The HTML5-based report viewers use the Telerik Reporting REST Service, which is an application executed in a web server (usually IIS) domain. Instead of applying a [custom manifest](https://learn.microsoft.com/en-us/iis/publish/using-web-deploy/using-custom-manifests), the recommended approach is to add the `<dpiAware>` section to the application's `web.config`/`appSettings.json` and set the `dpiAwareness` attribute to `PROCESS_SYSTEM_DPI_AWARE`.

## See Also

* [Declaring Windows Forms Application as DPI-aware]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}#declaring-the-application-as-dpi-aware)
* [Creating a DPI-Aware Application](https://learn.microsoft.com/en-us/previous-versions/windows/desktop/ms701681(v=vs.85))
* [High DPI Desktop Application Development on Windows](https://learn.microsoft.com/en-us/windows/win32/hidpi/high-dpi-desktop-application-development-on-windows)
* [SetProcessDpiAwareness](https://learn.microsoft.com/en-us/windows/win32/api/shellscalingapi/nf-shellscalingapi-setprocessdpiawareness)
