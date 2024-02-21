---
title: How to Resolve the "You can assign System.String, IImage, System.Drawing.Image" Error in Telerik Reporting
description: "Learn how to resolve the error message 'You can assign System.String, IImage, System.Drawing.Image (for GDI rendering), or SKBitmap (for Skia rendering) instances only'."
type: how-to
page_title: Resolving the "You can assign System.String, IImage, System.Drawing.Image" Error in Telerik Reporting
slug: embedded-image-clr-report-skia-error
tags: telerik-reporting, error, graphicsEngine, skia, system-drawing, image
res_type: kb
---

## Environment

| Property | Value |
| --- | --- |
| Product | Progress® Telerik® Reporting |
| Version | 17.2.23.1010+ |

## Description

I have a CLR report definition created with the [Visual Studio Report Designer for the .NET Framework]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}).

I received an error message `You can assign System.String, IImage, System.Drawing.Image (for GDI rendering), or SKBitmap (for Skia rendering) instances only` when using Telerik Reporting with the Skia graphics engine.

## Solution

When you embed images in reports in the Visual Studio Report Designer, they get added as resources in the `resx` file of the report definition. If you open the resource file with a text editor like Notepad++, the corresponding asset looks like the next snippet that represents a `System.Drawing.Bitmap` object:

````XML
<assembly alias="System.Drawing" name="System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" />
<data name="pictureBox2.Value" type="System.Drawing.Bitmap, System.Drawing" mimetype="application/x-microsoft.net.object.bytearray.base64">
	<value>
		iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8
		YQUAAAAJcEhZcwAACxEAAAsRAX9kX5EAAAP8SURBVHhe7d2vbhRdHMbxGrgFLqFBIEm4AAQahysWg8CR
		cAVwBYBDkeBRCEQFooYQBKKiAoFoQhAIxDBP05Jtec7s7O6cmXN+53uSj3pn2U2/Dx22f/LudV1Xhf2P
		1w96HaZlP9il6V8o8TOxH/CS9C+S+BnZD3op+hdI/MzsB74E/Ysj/gzsB39p/Qsj/kxsgCX1L4r4M7IR
		ltK/IOLPzIZYws0311+7F4i8bIy5EX85NsiciL8sG2UuxF+eDTMH4pfBxsmN+OWwgXIifllspFyIXx4b
		Kgfil8nGmhrxy2WDTYn4ZbPRpkL88tlwUyB+HWy8XRG/HjbgLohfFxtxW8Svjw25DeLXycbcFPHrZYNu
		gvh1s1HHIn79bNgxiB+DjbsO8eOwgYcQPxYbOYX48djQDvFjsrGvIn5cNvgq4sdmo1+49eQav6sXnA0v
		it+zD0Icg/EZQHyD8RlAfIPxGUB8g/HFPQhxDMYX9yDEMRhf3IMQhwZgw19wD0IcDKBxDKBxDKBxDKBx
		DKBxDKBxDKBxYQfw8PO9bpvz889pd3j6oXtx/LS7f3TH/tmRMIA1R2O4+2nfPkcEDGDE0WeFqJ8NGMDI
		E3UEDGCDo9uBe66aNTkA/Tfn8dcH3cuT52d/21NH17nnq1WTA3DXr9Kn+tQINBD3mFoxgIRn3x6dX335
		RLsNMIAEvfVLHXd9rRjAgNRx19aKAQxIHXdtrRhAgt4RuPPl15G9vlYMwLh9eOMstDtvv7+yj6kVA1ih
		8PrXfyq+jj4zuMfWqskBbHtOfh/b56oZA9jg6M90z1UzBjDy6Nbgnqd2DGDN0Vf+Iv9gCANInOjhLzQ5
		gNXr9M0dd/TNIL0rWL02ouYHoMj6170773+8u3RtRM0PYN210d73X8UAzukrfO5EvxUwgHOKnPohkMi3
		AgawIvUNIJ2otwIGcIX+trsT9VbAAK5o7VbAAAz9Wljq8N3ASuwyANFXAt2JditgAAn6odAWbgVhB4Bx
		GEDjGEDjGEDjGEDbDhhAuw76NzR7DKBNZ/EZQJv+xWcA7bkUnwG05b/4DKAdNr4wgPiS8YUBBKb/7a+L
		vooBBDUmvjCAgMbGFwYQzCbxhQEEsml8YQBBbBNfGEAA28YXBlC5XeILA6jYrvGFAVRqivjCACo0VXxh
		AJWZMr4wgIpMHV8YQCVyxBcGUIFc8YUBFC5nfGEABcsdXxhAoeaILwygQHPFFwZQmDnjCwMoyNzxhQEU
		Yon4wgAKsFR8YQALWzK+MIAFLR1fGMBCSogvDGABpcSXtQPA5AZ/V29uDGBeRcUXBjCf4uILA5hHkfGF
		AeRXbHxhAHkVHV8YQD7FxxcGkEcV8buu2/sLNx2vmOLdNKkAAAAASUVORK5CYII=
	</value>
</data>
````

Skia does not support the types from the GDI namespace `System.Drawing`. To resolve this error, you need to change the type of the above image to a type that is valid for both Skia and System.Drawing (GDI) graphic engines.

Follow these steps to fix the error:

1. Open the RESX file that contains the code referencing the image.
1. Locate the code that references the image as a `Bitmap` instance:

	````XML
<assembly alias="System.Drawing" name="System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" />
	<data name="{pictureBoxNameHere}.Value" type="System.Drawing.Bitmap, System.Drawing" mimetype="application/x-microsoft.net.object.bytearray.base64">
		<value>
			{the value of the image base64 string here}
		</value>
	</data>
````


1. Replace the code referencing the image with a pure base64 string:

	````XML
<data name="{pictureBoxNameHere}.Value" xml:space="preserve">
		<value>
			{the value of the image base64 string here}
		</value>
	</data>
````


The result for the sample image above would be:

````XML
<data name="pictureBox2.Value" xml:space="preserve">
	<value>
		iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8
		YQUAAAAJcEhZcwAACxEAAAsRAX9kX5EAAAP8SURBVHhe7d2vbhRdHMbxGrgFLqFBIEm4AAQahysWg8CR
		cAVwBYBDkeBRCEQFooYQBKKiAoFoQhAIxDBP05Jtec7s7O6cmXN+53uSj3pn2U2/Dx22f/LudV1Xhf2P
		1w96HaZlP9il6V8o8TOxH/CS9C+S+BnZD3op+hdI/MzsB74E/Ysj/gzsB39p/Qsj/kxsgCX1L4r4M7IR
		ltK/IOLPzIZYws0311+7F4i8bIy5EX85NsiciL8sG2UuxF+eDTMH4pfBxsmN+OWwgXIifllspFyIXx4b
		Kgfil8nGmhrxy2WDTYn4ZbPRpkL88tlwUyB+HWy8XRG/HjbgLohfFxtxW8Svjw25DeLXycbcFPHrZYNu
		gvh1s1HHIn79bNgxiB+DjbsO8eOwgYcQPxYbOYX48djQDvFjsrGvIn5cNvgq4sdmo1+49eQav6sXnA0v
		it+zD0Icg/EZQHyD8RlAfIPxGUB8g/HFPQhxDMYX9yDEMRhf3IMQhwZgw19wD0IcDKBxDKBxDKBxDKBx
		DKBxDKBxDKBxYQfw8PO9bpvz889pd3j6oXtx/LS7f3TH/tmRMIA1R2O4+2nfPkcEDGDE0WeFqJ8NGMDI
		E3UEDGCDo9uBe66aNTkA/Tfn8dcH3cuT52d/21NH17nnq1WTA3DXr9Kn+tQINBD3mFoxgIRn3x6dX335
		RLsNMIAEvfVLHXd9rRjAgNRx19aKAQxIHXdtrRhAgt4RuPPl15G9vlYMwLh9eOMstDtvv7+yj6kVA1ih
		8PrXfyq+jj4zuMfWqskBbHtOfh/b56oZA9jg6M90z1UzBjDy6Nbgnqd2DGDN0Vf+Iv9gCANInOjhLzQ5
		gNXr9M0dd/TNIL0rWL02ouYHoMj6170773+8u3RtRM0PYN210d73X8UAzukrfO5EvxUwgHOKnPohkMi3
		AgawIvUNIJ2otwIGcIX+trsT9VbAAK5o7VbAAAz9Wljq8N3ASuwyANFXAt2JditgAAn6odAWbgVhB4Bx
		GEDjGEDjGEDjGEDbDhhAuw76NzR7DKBNZ/EZQJv+xWcA7bkUnwG05b/4DKAdNr4wgPiS8YUBBKb/7a+L
		vooBBDUmvjCAgMbGFwYQzCbxhQEEsml8YQBBbBNfGEAA28YXBlC5XeILA6jYrvGFAVRqivjCACo0VXxh
		AJWZMr4wgIpMHV8YQCVyxBcGUIFc8YUBFC5nfGEABcsdXxhAoeaILwygQHPFFwZQmDnjCwMoyNzxhQEU
		Yon4wgAKsFR8YQALWzK+MIAFLR1fGMBCSogvDGABpcSXtQPA5AZ/V29uDGBeRcUXBjCf4uILA5hHkfGF
		AeRXbHxhAHkVHV8YQD7FxxcGkEcV8buu2/sLNx2vmOLdNKkAAAAASUVORK5CYII=
	</value>
</data>
````

## Note

If you assign the PictureBox value with code, you can also cast the `Bitmap` to `Telerik.Drawing.ImageBase` or `byte[]` before assigning it to the report item.
