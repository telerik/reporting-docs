---
title: Culture is not supported Exception
description: "Learn what are the causes for the 'Culture is not supported' exception and how to resolve the problem."
type: troubleshooting
page_title: Culture is not supported. Parameter name aa is an invalid culture identifier.
slug: culturenotfoundexception-culture-is-not-supported
position: 
tags: Culture, Windows Server 2012
ticketid: 1622021
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Operating System</td>
			<td>Windows Server 2012</td>
		</tr>
	</tbody>
</table>


## Description

After deploying my application to a server that uses `Windows Server 2012`, I am met with the error below when I attempt to load the page with the Report Viewer.

## Error Message

````
Description: An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

Exception Details: System.Globalization.CultureNotFoundException: Culture is not supported. Parameter name: name 'aa' is an invalid culture identifier.
````

## Cause

The exception is thrown in the following part of our code:

````CSharp
IEnumerable<string> ILocalizationHandler.AvailableUICultures
{
	get
	{
		var dir = GetResourcesPath();
		//
		var allCultures = CultureInfo.GetCultures(CultureTypes.AllCultures).Select(c => c.Name);
		//
		var cultureInfos = new List<string>();
		if (Directory.Exists(dir))
		{
			foreach (var d in Directory.GetDirectories(dir))
			{
				var directoryName = Path.GetFileName(d);
				var culture = allCultures.FirstOrDefault(c => c == directoryName);
				if (culture != null)
				{
					cultureInfos.Add(culture);
				}
			}
		}

		return cultureInfos;
	}
}
````

When using the `AllCultures` option of the [CultureTypes Enum](https://learn.microsoft.com/en-us/dotnet/api/system.globalization.culturetypes), the [GetCultures](https://learn.microsoft.com/en-us/dotnet/api/system.globalization.cultureinfo.getcultures) method will try to retrieve the `CultureInfo` object for all cultures that are recognized by .NET, including neutral and specific cultures and custom cultures created by the user. The culture 'aa' seems to be a part of these cultures, however, that culture is not included with Windows Server 2012.


## Solution

The only solution guaranteed to work for this case is to upgrade the version of Windows Server that you are hosting the Reporting service on to Windows Server 2016 or newer.

## Workaround

It may be possible to install new cultures on Windows Server 2012, however, this has not been tested and we cannot guarantee that it will resolve the problem in all scenarios - [Installing more cultures on Windows Server 2012](https://stackoverflow.com/questions/28281161/installing-more-cultures-on-windows-server-2012).

