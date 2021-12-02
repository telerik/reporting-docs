---
title: dpiAware Element
page_title: dpiAware Element | for Telerik Reporting Documentation
description: dpiAware Element
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/dpiaware-element
tags: dpiaware,element
published: True
position: 9
---

# dpiAware Element



Telerik Reporting uses the machine DPI settings to determine the physical sizes of report items, images, calculate text sizes         and draw the graphic primitives. That's why it is vital to obtain the correct DPI settings of the machine which renders and shows the report in any of the viewers.         If the machine's DPI settings are set higher than the default value of 96, it is recommended to make the application DPI-aware, either         through an application manifest or by setting the __```<dpiAware>```__  configuration element, as shown below.       

## General Information

Usually the DPI awareness is set on the application level through a            [manifest file](https://msdn.microsoft.com/library/windows/desktop/mt843498(v=vs.85).aspx(d=robot)) , but in some cases such manifest cannot be applied. That's why the reporting engine           provides the option to explicitly set the DPI awareness flag prior to rendering the report.         

The __```<dpiAware>```__  section has only one attribute: __dpiAwareness__ .           Its value corresponds with the Windows API            [PROCESS_DPI_AWARENESS enumeration](https://msdn.microsoft.com/en-us/library/windows/desktop/dn280512(v=vs.85).aspx)            and can be one of the following:         

* PROCESS_DPI_UNAWARE = 0

* PROCESS_SYSTEM_DPI_AWARE = 1

* PROCESS_PER_MONITOR_DPI_AWARE = 2

The default value of the __dpiAwareness__  attribute is *PROCESS_DPI_UNAWARE_NOT_SET* .           The current process's DPI awareness is set using the native Windows API function            [SetProcessDpiAwareness](https://msdn.microsoft.com/en-us/library/windows/desktop/dn302122(v=vs.85).aspx) .           It is important to note that once the process' DPI awareness is set, every next function call will fail with __E_ACCESSDENIED__  result.         

>important This API function is available on Windows Vista and newer operating systems. If Telerik Reporting is used on a machine with older OS, the DPI awareness would not be set and report rendering might produce unexpected results.           


__Example__ 

The following snippet shows how to set the current application's DPI awareness to PROCESS_SYSTEM_DPI_AWARE.         

XML-based configuration file:

	
````xml
<Telerik.Reporting>
...
  <dpiAware dpiAwareness="PROCESS_SYSTEM_DPI_AWARE"></dpiAware>
</Telerik.Reporting>
````



JSON-based configuration file:

	
````js
          "telerikReporting": {
            "dpiAware": {
              "dpiAwareness": "PROCESS_SYSTEM_DPI_AWARE"
            }
          }
````



## DPI Awareness in Report Viewers

The following list explains how the DPI awareness is respected in applications that use Telerik Reporting:

### Windows Forms Report Viewer

The Windows Forms applications are not DPI-aware by default. The recommended approach for declaring an application as DPI-aware               is adding a __dpiAware__  element to its application manifest, as shown                [here](https://docs.telerik.com/reporting/winforms-report-viewer) .                           

### WPF Report Viewer

The WPF Report Viewer must be used in a WPF application and they are system DPI-aware by default, so no additional settings should be applied.               In case you want to change its awareness to *per monitor* , please check                [here](https://msdn.microsoft.com/en-us/library/windows/desktop/ee308410(v=vs.85).aspx) .               

### HTML5-based Report Viewers

The HTML5-based report viewers use Telerik Reporting REST Service, which is an application executed in a web server (usually IIS) domain. Instead of applying a                [custom manifest](https://docs.microsoft.com/en-us/iis/publish/using-web-deploy/using-custom-manifests) , the recommended approach is to add the __```<dpiAware>```__  section to the               application's __web.config__  and set the __dpiAwareness__  attribute to PROCESS_SYSTEM_DPI_AWARE.             

# See Also
[](F25EB909-7941-4B78-B24C-4025257A26C4#dpiAware)

 * [Creating a DPI-Aware Application](https://msdn.microsoft.com/en-us/library/ms701681(v=vs.85).aspx)

 * [High DPI Desktop Application Development on Windows](https://msdn.microsoft.com/library/windows/desktop/mt843498(v=vs.85).aspx(d=robot))

 * [SetProcessDpiAwareness](https://msdn.microsoft.com/en-us/library/windows/desktop/dn302122(v=vs.85).aspx)
