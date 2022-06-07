---
title: Picturebox Throws Error 401 Unauthorized
description: The Error 401 Unauthorized might be thrown if you are using a PictureBox with a Value from URL
type: troubleshooting
page_title: The remote server returned an error:(401) Unauthorized when using a PictureBox from URL
slug: the-remote-server-returned-an-error-401-unauthorized-when-using-a-pictureBox-from-url
position: 
tags: picturebox,error401
ticketid: 1412798
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
			<td>Report item</td>
			<td>PictureBox</td>
		</tr>
	</tbody>
</table>


## Description
The error might be thrown when the report contains a [PictureBox](../designing-reports/report-structure/picturebox) whose Value is a URL. 
In general, when you provide an URL as a PictureBox.Value, we use a WebClient to download the image.
At that point, the connection to server fails with the statement that the application's process is not authorized to get the resource.

## Error Message
The remote server returned an error:(401) Unauthorized.

## Solution

You have to create a [User Function](../designing-reports/connecting-to-data/expressions/extending-expressions/user-functions) that will download the image after authorizing, and returns it (e.g. as type [Bitmap](https://docs.microsoft.com/en-us/dotnet/api/system.drawing.bitmap?view=netframework-4.8)) for the picture box value.

The User Function (without authorization) might look as follows:

```cs
public static Bitmap GetImage(string url)
{
    System.Net.WebRequest request = System.Net.WebRequest.Create(url);
    System.Net.WebResponse response = request.GetResponse();
    System.IO.Stream responseStream = response.GetResponseStream();
 
    Bitmap bitmap = new Bitmap(responseStream);
    return bitmap;
}
```

Another option is to return the image as byte[]. Note that it will be necessary to authorize the request to successfully download the image from the URL.

### See Also
- [PictureBox](../designing-reports/report-structure/picturebox)

- [User Function](../designing-reports/connecting-to-data/expressions/extending-expressions/user-functions)
