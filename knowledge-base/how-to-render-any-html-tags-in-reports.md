---
title: How to render any HTML tags and CSS attributes in reports
description: How to render any HTML tags and CSS attributes in reports.
type: how-to
page_title: How to render any HTML tags and CSS attributes in reports
slug: how-to-render-any-html-tags-in-reports
res_type: kb
---

## Description

A frequently asked question is *how to render HTML tags and CSS attributes that are not supported by [HtmlTextBox item](../report-items-html-text-box)* in reports.  
  
## Solution  
  
The approach includes utilizing a [WebBrowser](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.webbrowser?redirectedfrom=MSDN&view=net-5.0) control to render HTML to a bitmap with a help of a [user defined function](../expressions-user-functions) and a [PictureBox item](../report-items-picture-box) that will display the generated image (PNG):  

```cs
static public Image HTML2BitMap(string url, Telerik.Reporting.Processing.PictureBox me)
        {
            Hashtable data = new Hashtable();
            data["url"] = url;
            data["image"] = null;
            // We expect PictureBox dimesions in pixels
            data["w"] = (int)me.Width.Value;
            data["h"] = (int)me.Height.Value;
            Thread t = new Thread(new ParameterizedThreadStart(Report1.GetImage));
            t.TrySetApartmentState(ApartmentState.STA);
            t.Start(data);
            t.Join();
            if (t.IsAlive)
                t.Abort();
 
            MemoryStream ms = new MemoryStream((byte[])data["image"]);
            Image img = Image.FromStream(ms);
            //Resize the PictureBox to the actual size of the browser image
            //me.Height = new Unit(img.Height,UnitType.Pixel);
            //me.Width = new Unit(img.Width, UnitType.Pixel);
            return img;
        }
 
        static public void GetImage(object _data)
        {
            Hashtable data = (Hashtable)_data;
            using (WebBrowser browser = new WebBrowser())
            {
                browser.ScrollBarsEnabled = false;
                // Set browser prefered size
                browser.Size = new Size((int)data["w"], (int)data["h"]);
 
                browser.DocumentText = (string)data["url"];
                while (browser.ReadyState != WebBrowserReadyState.Complete)
                    Application.DoEvents();
 
                Size sz = browser.Document.Body.ScrollRectangle.Size;
 
                using (Bitmap myBitmap = new Bitmap(sz.Width, sz.Height))
                {
                    browser.ClientSize = sz;
 
                    Rectangle drawRectangle = new Rectangle(0, 0, sz.Width, sz.Height);
                    browser.DrawToBitmap(myBitmap, drawRectangle);
 
                    MemoryStream ms = new MemoryStream();
                    myBitmap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
 
                    data["image"] = ms.ToArray();
                }
            }
        }
```
  
> **Note** 
> <br/> 
> The approach has several shortcomings and is far from perfect, but it seems to work in most cases and in all [export formats](../designing-reports-page-layout-rendering#rendering-extensions) (because all support the **PictureBox** item).   
  
The attached project demonstrates the described approach. One thing to note is that you should set the HTML as a value for the *browser.DocumentText* property, in the attached example we used **URL** from the **RadEditor** examples to quickly illustrate the approach.

## Additional Resources

[Sample Project](resources/htmltobitmapsample.zip)
