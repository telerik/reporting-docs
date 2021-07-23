---
title: Font is missing in report designers
description: Font is missing in report designers.
type: how-to
page_title: Font is missing in report designers
slug: font-is-missing-in-report-designers
res_type: kb
---

## Description

A font is missing in the Report Designers

## Solution
   
Is the missing font **OpenType**? Generally Telerik Reporting engine uses the **GDI+** library and depends on the fonts that GDI+ supports. In this line of thoughts, .NET supports **only** TrueType fonts. Thus you can not use OpenType fonts with Telerik Reporting? If applicable you can convert the OpenType font to **TrueType** using a [free online converter](http://www.freefontconverter.com/).   
   
If the font is TrueType, check if the font is installed in **%windir%\fonts** .
 
## See Also

[How to install or remove a font in Windows](https://support.microsoft.com/en-us/windows/how-to-install-or-remove-a-font-in-windows-f12d0657-2fc8-7613-c76f-88d043b334b8).

