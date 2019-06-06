---
title: Unable to use URL with encoded characters in PictureBox
description: This article explains how to use a URL with encoded characters in the PictureBox report item.
type: troubleshooting
page_title: Unable to use URL with encoded characters
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
</table>

## Problem
The report engine often needs to retrieve external resources such as PictureBox images via a URL. When such URL contains percent encoded path delimiters (e.g. forward slash encoded as '*%2F*') the request will fail with '*400 Bad Request*', '*404 Not Found*', or yield another unexpected result. This happens because under the hood the report engine uses the built-in .NET [Uri Class](https://docs.microsoft.com/en-us/dotnet/api/system.uri?view=netframework-4.8) which un-escapes percent encoded path delimiters as a security mechanism against malicious attacks. More details are provided [here](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/network/schemesettings-element-uri-settings#remarks).

For example, the following URL used for the *PictureBox.Value* property:

*http://myshop.com/products/shoes%2Flaces* 

will be sent to the server as:

*http://myshop.com/products/shoes/laces*

Depending on the route congiguration of the web application serving the request the result may vary from a 40x error response to a 200 OK result which contains data for an entirely different query.

## Solution
To change the default behavior of the Uri class which un-escapes percent encoded path delimiters, use a configuration file setting for each desired URL scheme in the client application:

`````
<configuration>  
  <uri>  
    <schemeSettings>  
      <add name="http" genericUriParserOptions="DontUnescapePathDotsAndSlashes"/>
      <add name="https" genericUriParserOptions="DontUnescapePathDotsAndSlashes"/>
    </schemeSettings>  
  </uri>  
</configuration>
`````
