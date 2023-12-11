---
title: Styling Report Items
page_title: Report item style properties
description: "Find detailed information about the available styling properties that can be used to style different report items."
slug: telerikreporting/designing-reports/styling-reports/styling-report-items
tags: styling, report, items, properties
published: True
position: 7
---
<style>
table th:first-of-type {
	width: 20%;
}
table th:nth-of-type(2) {
	width: 80%;
}
</style>

# Styling Report Items Overview

Telerik Reporting uses a built-in styling model that is similar to CSS. The model provides for very fine-grained visual customization of all elements of a report directly in the Report designer. This CSS-like mechanism offers full control over such things as the background, colors, borders, and images for every item on your report.

 > All Style properties of a report item that have **not** been specifically set for that report item will inherit the corresponding value from the report item's parent.

Below is a list of the available styling options alongside short summaries of what they represent:

<body>
	<table>
		<tr>
			<th>Property</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>BackgroundColor</td>
			<td>A Color that represents the background color of the report item.
				Can be selected from the widget or written by hand as RGB, RGBA or Hex color.
				<i>
				The default value is Empty, which indicates
				that this property is not set.
				</i>
			</td>
		</tr>
		<tr>
			<td>BackgroundImage</td>
			<td>Represents the image to display in the background of the report item. 
				Supports BMP, GIF, JPG, JPEG, PNG, ICO, EMF and WMF image files.
				<ul>
					<li>ImageData - An Image containing the image data of this BackgroundImage. Use this property if you
						want to bind the BackgroundImage to an image that is not in the data source.</li>
					<li>MimeType - The MIME type of the current BackgroundImage object.</li>
					<li>Repeat - Indicates how a background image will be repeated.
						The available values are:
						<ul>
							<li>NoRepeat - The background-image will be displayed only once.</li>
							<li>Repeat - The background image will be repeated vertically and horizontally.</li>
							<li>RepeatX - The background image will be repeated horizontally.</li>
							<li>RepeatY - The background image will be repeated vertically.
						</ul>
					</li>
				</ul>
				<i>
				Report items have no background
				image by default.
				</i>
			</td>
		</tr>
		<tr>
			<td>BorderColor</td>
			<td>The border color of the item can be set by using the properties Default, Left, Right, Top, and Bottom.
				The Default property is used to set all borders colors at once.
				<i>All borders are Black by default.</i>
			</td>
		</tr>
		<tr>
			<td>BorderStyle</td>
			<td>The border style of the item can be set by using the properties Default, Left, Right, Top, and Bottom.
				The Default property is used to set all borders styles at once.
				The available border styles are:
				<ul>
					<li>None - No line.</li>
					<li>Solid - Solid line.</li>
					<li>Dotted - Dotted line.</li>
					<li>Dashed - Dashed line.</li>
					<li>Double - Double solid line.</li>
					<li>Groove - Grooved line for a sunken border appearance.</li>
					<li>Ridge - Ridged line for a raised border appearance.</li>
					<li>Inset - Inset line for a sunken item appearance.</li>
					<li>Outset - Outset line for a raised item appearance.</li>
				</ul>
				<i> All borders are BorderType.None by
				default.</i>
			</td>
		</tr>
		<tr>
			<td>BorderWidth</td>
			<td>The border width of the item can be set by using the properties Default, Left, Right, Top, and Bottom.
				The Default property is used to set all borders widths at once, however, the more specific rules will override the Default setting.
				For example, if you set the Default and then you set only the Top, then the Default will be applied to Bottom, Left, and Right only.
				<i>All borders are 1pt wide by default.</i>
			</td>
		</tr>
		<tr>
			<td>Color</td>
			<td>The foreground Color of the report item.
				Can be selected from the widget or written by hand as RGB, RGBA or Hex color.
				<i>The default color is Black.</i>
			</td>
		</tr>
		<tr>
			<td>Font</td>
			<td>Defines a particular format for text, including font face, size, and style attributes.
				The Font type exposes the following members:
				<ul>
					<li>Bold - <strong>Boolean</strong>. Indicates whether this Font is bold. </li>
					<li>Italic - <strong>Boolean</strong>. Indicates whether this Font is italic.</li>
					<li>Name - <strong>String</strong>. The face name of this Font.</li>
					<li>Size - <strong>Telerik.Reporting.Drawing.Unit</strong>. The size of this Font measured in Units.
					</li>
					<li>Strikeout - <strong>Boolean</strong>. Indicates whether this Font specifies a horizontal line
						through the font.</li>
					<li>Style - <strong>FontStyle</strong>
						enumeration that contains style information for this Font.</li>
					<li>Underline - <strong>Boolean.</strong> Indicates whether this Font is underlined.</li>
				</ul>
				<i>By default the font of a report item is Arial-Regular, 10pts.</i>
			</td>
		</tr>
		<tr>
			<td>LineColor</td>
			<td>The Color (stroke) representing the line color of report items that support it, such as lines and
				shapes.
				<i>By default, the value is Black.</i>
			</td>
		</tr>
		<tr>
			<td>LineStyle</td>
			<td>Represents the line style of the report item.
				The available values are:
				<ul>
					<li>Solid - Solid line.</li>
					<li>Dotted - Dotted line.</li>
					<li>Dashed - Dashed line.</li>
				</ul>
				<i>By default the line style is LineStyle.Solid.</i>
			</td>
		</tr>
		<tr>
			<td>LineWidth</td>
			<td>Represents the line width of report items that support it, such as lines and shapes.
				<i>By default, the width is 1pt.</i>
			</td>
		</tr>
		<tr>
			<td>Padding</td>
			<td>Represents the padding of the report item. You can set the padding of the item by using the properties
				Left, Right, Top, and Bottom.
				<i>Padding on all sides is 0 by default.</i>
			</td>
		</tr>
		<tr>
			<td>TextAlign</td>
			<td>Represents the horizontal alignment of text in the report item. The following horizonal alignments are
				available:
				<ul>
					<li>Left - Specifies that the text is aligned to the left.</li>
					<li>Center - Specifies that the text is aligned to the center.</li>
					<li>Right - Specifies that the text is aligned to the right.</li>
					<li>Justify - Specifies that the text is justified.</li>
				</ul>
				<i>By default, the TextAlign is Left.</i>
			</td>
		</tr>
		<tr>
			<td>VerticalAlign</td>
			<td>Represents the vertical alignment of text in the report item. The following vertical alignments are
				available:
				<ul>
					<li>Top - Specifies that the object is aligned to the top.</li>
					<li>Center - Specifies that the object is aligned to the middle.</li>
					<li>Bottom - Specifies that the object is aligned to the bottom.</li>
				</ul>
				<i>By default, the VerticalAlign is Top.</i>
			</td>
		</tr>
		<tr>
			<td>Visible</td>
			<td><strong>Boolean</strong>. Indicates whether the report item is displayed in the rendered document.
				<i>The default value is True</i>
			</td>
		</tr>
	</table>
</body>

## Notes

 - Some of the style properties behave differently in specific scenario.
For example, in the graph series' [DataPointStyle](/api/telerik.reporting.graphseriesbase), instead of using the BorderColor/BorderStyle/BorderWidth properties to style the graph's data points, you should use the LineColor/LineWidth/LineStyle properties.

 - Consider using numerical codes as (A)RGB or HEX when setting style colors. Using color names is not guaranteed to work in all scenarios. 
For example, the color name '_ControlDarkDark_' corresponds to [SystemColors.ControlDarkDark](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.systemcolors.controldarkdark) is translated to [ThreeDDarkShadow](https://www.w3.org/wiki/CSS/Properties/color/keywords) color, which is an obsolete CSS2 color and is rendered as RGB (0,0,0) by modern browsers.

## See Also

* [Style Class](/api/telerik.reporting.drawing.style)
