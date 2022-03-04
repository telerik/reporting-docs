---
title: Styling Report Items
page_title: Styling Report Items 
description: Styling Report Items
slug: telerikreporting/designing-reports/styling-reports/styling-report-items
tags: styling,report,items
published: True
position: 7
---

# Styling Report Items

## Styling Report Items Overview
Telerik Reporting uses a built-in styling model that is similar to CSS. The model provides for very fine-grained visual customization of all elements of a report directly in the Report designer. This CSS-like mechanism offers full control over such things as the background, colors, borders, and images for every item on your report.

Below is a list of the available styling options alongside short summaries of what they represent:

<body>
    <table>
        <tr>
            <th>Property</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>BackgroundColor</td>
            <td>A Color that represents the background color of the report item. The default is Empty, which indicates
                that this property is not set.
                Can be selected from the widget or written by hand as RGB, RGBA or Hex color.</td>
        </tr>
        <tr>
            <td>BackgroundImage</td>
            <td>Represents the image to display in the background of the report item. Report items have no background
                image by default.
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
            </td>
        </tr>
        <tr>
            <td>BorderColor</td>
            <td>The border color of the item can be set by using the properties Default, Left, Right, Top, and Bottom.
                The Default property is used to set all borders colors at once. All borders are Black by default.</td>
        </tr>
        <tr>
            <td>BorderStyle</td>
            <td>The border style of the item can be set by using the properties Default, Left, Right, Top, and Bottom.
                The Default property is used to set all borders styles at once. All borders are BorderType.None by
                default.
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
            </td>
        </tr>
        <tr>
            <td>BorderWidth</td>
            <td>The border width of the item can be set by using the properties Default, Left, Right, Top, and Bottom.
                The Default property is used to set all borders widths at once. All borders are 1pt wide by default.
            </td>
        </tr>
        <tr>
            <td>Color</td>
            <td>The foreground Color of the report item. The default is Black.
                Can be selected from the widget or written by hand as RGB, RGBA or Hex color.
            </td>
        </tr>
        <tr>
            <td>Font</td>
            <td>Defines a particular format for text, including font face, size, and style attributes.
                By default the font of a report item is Arial-Regular, 10pts.
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
                    <li>Underline - <strong>Boolean.</strong>Indicates whether this Font is underlined.</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>LineColor</td>
            <td>The Color (stroke) representing the line color of report items that support it, such as lines and
                shapes.
                By default its value is Black.
            </td>
        </tr>
        <tr>
            <td>LineStyle</td>
            <td>Represents the line style of the report item. By default the line style is LineStyle.Solid.
                The available values are:
                <ul>
                    <li>Solid - Solid line.</li>
                    <li>Dotted - Dotted line.</li>
                    <li>Dashed - Dashed line.</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>LineWidth</td>
            <td>Represents the line width of report items that support it, such as lines and shapes. By default the
                width is 1pt.</td>
        </tr>
        <tr>
            <td>Padding</td>
            <td>Represents the padding of the report item. You can set the padding of the item by using the properties
                Left, Right, Top, and Bottom. Padding on all
                sides is 0 by default.</td>
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
            </td>
        </tr>
        <tr>
            <td>Visible</td>
            <td>Indicates whether the report item is displayed in the rendered document.</td>
        </tr>
    </table>
</body>

## Notes

Some of the style properties behave differently in specific scenario.

For example, in the graph series' [DataPointStyle](../api/Telerik.Reporting.GraphSeriesBase.html#collapsible-Telerik_Reporting_GraphSeriesBase_DataPointStyle), instead of using the BorderColor/BorderStyle/BorderWidth properties to style the graph's data points, you should use the LineColor/LineWidth/LineStyle properties.

## See Also

* [Style Class](../api/Telerik.Reporting.Drawing.Style.html)             
