---
title: Unable to Use URL With Encoded Characters in PictureBox
description: "Learn why in some scenarios URLs with encoded characters in the PictureBox may not be resolved correctly and how to fix the problem."
type: troubleshooting
page_title: PictureBox cannot use URL with encoded characters
slug: picturebox-encoded-url-bad-request-not-found
position: 
tags: BadRequest, NotFound, Request, PictureBox
ticketid: 
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Target Framework</td>
		<td>.NET 4.0</td>
	</tr>
</table>

## Problem

The Reporting engine often needs to retrieve external resources such as PictureBox images via a URL. When such URL contains percent encoded path delimiters for example, forward slash `/` encoded as `%2F`) the request will fail with `400 Bad Request`, `404 Not Found`, or yield another unexpected result. This happens because under the hood the Reporting engine uses the built-in .NET [Uri Class](https://learn.microsoft.com/en-us/dotnet/api/system.uri?view=netframework-4.8) which un-escapes percent encoded path delimiters as a security mechanism against malicious attacks. More details are provided in the Microsoft article section [<schemeSettings> Element (Uri Settings) - Remarks](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/network/schemesettings-element-uri-settings#remarks).

For example, the following URL used for the `PictureBox.Value` property:

`http://myshop.com/products/shoes%2Flaces`

will be sent to the server as:

`http://myshop.com/products/shoes/laces`

Depending on the route congiguration of the web application serving the request the result may vary from a `40x error` response to a `200 OK` result which contains data for an entirely different query.

## Solution

To change the default behavior of the Uri class which un-escapes percent encoded path delimiters, use a configuration file setting for each desired URL scheme in the client application. The configuration setting is only applicable to .NET Framework 4.0:

````
<configuration>
	<uri>
		<schemeSettings>
			<add name="http" genericUriParserOptions="DontUnescapePathDotsAndSlashes"/>
			<add name="https" genericUriParserOptions="DontUnescapePathDotsAndSlashes"/>
		</schemeSettings>
	</uri>
</configuration>
````

