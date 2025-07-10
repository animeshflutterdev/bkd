import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../open_service.dart' deferred as open_service;

TextStyle customizeTextStyle(
    {FontWeight? fontWeight,
    double? fontSize,
    Color? fontColor,
    TextDecoration? decoration,
    Color? decorationColor,
    double? height,
    Color? backgroundColor,
    FontStyle? fontStyle,
    double? wordSpacing = 0,
    double? letterSpacing = 0}) {
  return GoogleFonts.inter(
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontWeight: fontWeight,
      wordSpacing: wordSpacing,
      color: fontColor,
      fontSize: fontSize,
      decorationColor: decorationColor,
      height: height,
      backgroundColor: backgroundColor,
      fontStyle: fontStyle);
}

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextDecoration? decoration;
  final double? height;
  final TextAlign? textAlign;
  final Color? backGroundColor;
  final Color? decorationColor;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;

  const CustomText(this.text,
      {super.key,
      this.color,
      this.size,
      this.fontWeight,
      this.maxLines,
      this.decoration,
      this.height,
      this.textAlign,
      this.backGroundColor,
      this.decorationColor,
      this.fontStyle,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      style: customizeTextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          fontColor: color,
          height: height ?? (kIsWeb ? 1.2 : 0.0),
          decoration: decoration,
          backgroundColor: backGroundColor,
          decorationColor: decorationColor ?? color,
          fontStyle: fontStyle),
    );
  }
}

/// A class that provides various text styles for custom text widgets.
///
/// The [CustomTextEnum] class allows you to create text widgets with
/// predefined styles, such as font size and weight, color, and other
/// text decorations.
class CustomTextEnum {
  Color? _color;
  int? _maxLines;
  TextDecoration? _decoration;
  bool? _lineGapNeeded;
  TextAlign? _textAlign;
  Color? _backGroundColor;
  String? _text;
  TextOverflow? _overflow;

  /// Creates a [CustomTextEnum] instance with the provided text and optional
  /// styling properties.
  ///
  /// The [text] parameter is required, while other parameters like [color],
  /// [maxLines], [decoration], [lineGapNeeded], [textAlign], and
  /// [backGroundColor] are optional.
  CustomTextEnum(String text,
      {Color? color,
      int? maxLines,
      TextDecoration? decoration,
      bool? lineGapNeeded,
      TextAlign? textAlign,
      Color? backGroundColor,
      TextOverflow? overflow}) {
    _text = text;
    _color = color;
    _maxLines = maxLines;
    _decoration = decoration;
    _lineGapNeeded = lineGapNeeded;
    _textAlign = textAlign;
    _backGroundColor = backGroundColor;
    _overflow = overflow;
  }

  /// Returns a [Text] widget with XXL size (72) and regular font weight.
  Widget displayXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with XXL size (72) and medium font weight.
  Widget displayMediumXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with XXL size (72) and semibold font weight.
  Widget displaySemiboldXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XXL size (72) and bold font weight.
  Widget displayBoldXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with XL size (60) and regular font weight.
  Widget displayXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with XL size (60) and medium font weight.
  Widget displayMediumXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with XL size (60) and semibold font weight.
  Widget displaySemiboldXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XL size (60) and bold font weight.
  Widget displayBoldXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with LG size (48) and regular font weight.
  Widget displayLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with LG size (48) and medium font weight.
  Widget displayMediumLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with LG size (48) and semibold font weight.
  Widget displaySemiboldLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with LG size (48) and bold font weight.
  Widget displayBoldLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with MD size (36) and regular font weight.
  Widget displayMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with MD size (36) and medium font weight.
  Widget displayMediumMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with MD size (36) and semibold font weight.
  Widget displaySemiboldMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with MD size (36) and bold font weight.
  Widget displayBoldMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with SM size (30) and regular font weight.
  Widget displaySM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with SM size (30) and medium font weight.
  Widget displayMediumSM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with SM size (30) and semibold font weight.
  Widget displaySemiboldSM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with SM size (30) and bold font weight.
  Widget displayBoldSM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with XS size (24) and regular font weight.
  Widget displayXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with XS size (24) and medium font weight.
  Widget displayMediumXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with XS size (24) and semibold font weight.
  Widget displaySemiboldXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XS size (24) and bold font weight.
  Widget displayBoldXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with XL text size (20) and regular font weight.
  Widget textXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with XL text size (20) and medium font weight.
  Widget textMediumXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with XL text size (20) and semibold font weight.
  Widget textSemiboldXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XL text size (20) and bold font weight.
  Widget textBoldXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with LG text size (18) and regular font weight.
  Widget textLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with LG text size (18) and medium font weight.
  Widget textMediumLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with LG text size (18) and semibold font weight.
  Widget textSemiboldLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with LG text size (18) and bold font weight.
  Widget textBoldLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with MD text size (16) and regular font weight.
  Widget textMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with MD text size (16) and medium font weight.
  Widget textMediumMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with MD text size (16) and semibold font weight.
  Widget textSemiboldMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with MD text size (16) and bold font weight.
  Widget textBoldMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with SM text size (14) and regular font weight.
  Widget textSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with SM text size (14) and medium font weight.
  Widget textMediumSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with SM text size (14) and semibold font weight.
  Widget textSemiboldSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with SM text size (14) and bold font weight.
  Widget textBoldSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with XS text size (12) and regular font weight.
  Widget textXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with XS text size (12) and medium font weight.
  Widget textMediumXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with XS text size (12) and semibold font weight.
  Widget textSemiboldXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XS text size (12) and bold font weight.
  Widget textBoldXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with XS text size (13) and semibold font weight.
  Widget textSemiboldXSM() =>
      _getData(size: 13, height: 18, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XS text size (13) and semibold font weight.
  Widget textMediumXSM() =>
      _getData(size: 13, height: 18, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with XS text size (15) and bold font weight.
  Widget textBoldXMSM() =>
      _getData(size: 15, height: 18, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with XS text size (15) and bold font weight.
  Widget textSemiboldXMSM() =>
      _getData(size: 15, height: 18, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XS text size (10) and bold font weight.
  Widget textBoldXXS() =>
      _getData(size: 10, height: 16, fontWeight: FontWeightEnum.Bold);

  /// Creates a [Text] widget with the provided size and font weight.
  ///
  /// The [size] parameter specifies the font size, while [fontWeight]
  /// specifies the weight of the font. Other styling properties are
  /// inherited from the [CustomTextEnum] instance.
  Widget _getData(
          {required double size,
          required double height,
          FontWeight? fontWeight}) =>
      CustomText(_text!,
          maxLines: _maxLines,
          textAlign: _textAlign,
          overflow: _overflow,
          fontWeight: fontWeight,
          size: size,
          color: _color,
          height: height / size,
          decoration: _decoration,
          backGroundColor: _backGroundColor);
}

class CustomRichText extends StatelessWidget {
  final List<InlineSpan> textSpanList;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;

  const CustomRichText({
    super.key,
    required this.textSpanList,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: textSpanList,
      ),
      overflow: overflow, // Handle text overflow
      maxLines: maxLines,
    );
  }
}

InlineSpan CustomTextSpan(
    {required String text,
    FontWeight? fontWeight,
    double? size,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
    double? height,
    Color? backgroundColor,
    PlaceholderAlignment? alignment,
    bool? isTextSpan}) {
  assert(!(isTextSpan == true && alignment != null),
      'alignment and seoTag are not available in TextSpan');
  return isTextSpan == true
      ? TextSpan(
          text: text,
          style: customizeTextStyle(
              fontWeight: fontWeight,
              fontSize: size,
              fontColor: color,
              decoration: decoration,
              decorationColor: decorationColor,
              height: height,
              backgroundColor: backgroundColor))
      : WidgetSpan(
          alignment: alignment ?? PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: CustomText(
            text,
            fontWeight: fontWeight,
            size: size,
            color: color,
            decoration: decoration,
            decorationColor: decorationColor,
            height: height,
            backGroundColor: backgroundColor,
          ),
        );
}

/// A class that provides various text styles for custom text spans.
///
/// The [CustomTextSpanEnum] class allows you to create text spans with
/// predefined styles, such as font size and weight, color, and other
/// text decorations.
class CustomTextSpanEnum {
  Color? color;
  TextDecoration? decoration;
  Color? backGroundColor, decorationColor;
  String text;
  PlaceholderAlignment? alignment;
  bool? isTextSpan;

  /// Creates a [CustomTextSpanEnum] instance with the provided text and optional
  /// styling properties.
  ///
  /// The [text] parameter is required, while other parameters like [color],
  /// [maxLines], [decoration], [lineGapNeeded], [textAlign], and
  /// [backGroundColor] are optional.

  CustomTextSpanEnum(
      {required this.text,
      this.color,
      this.decoration,
      this.backGroundColor,
      this.decorationColor,
      this.alignment,
      this.isTextSpan});

  /// Returns a [TextSpan] with XXL size (72) and regular font weight.
  InlineSpan displayXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with XXL size (72) and medium font weight.
  InlineSpan displayMediumXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with XXL size (72) and semibold font weight.
  InlineSpan displaySemiboldXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with XXL size (72) and bold font weight.
  InlineSpan displayBoldXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with XL size (60) and regular font weight.
  InlineSpan displayXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with XL size (60) and medium font weight.
  InlineSpan displayMediumXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with XL size (60) and semibold font weight.
  InlineSpan displaySemiboldXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with XL size (60) and bold font weight.
  InlineSpan displayBoldXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with LG size (48) and regular font weight.
  InlineSpan displayLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with LG size (48) and medium font weight.
  InlineSpan displayMediumLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with LG size (48) and semibold font weight.
  InlineSpan displaySemiboldLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with LG size (48) and bold font weight.
  InlineSpan displayBoldLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with MD size (36) and regular font weight.
  InlineSpan displayMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with MD size (36) and medium font weight.
  InlineSpan displayMediumMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with MD size (36) and semibold font weight.
  InlineSpan displaySemiboldMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with MD size (36) and bold font weight.
  InlineSpan displayBoldMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with SM size (30) and regular font weight.
  InlineSpan displaySM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with SM size (30) and medium font weight.
  InlineSpan displayMediumSM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with SM size (30) and semibold font weight.
  InlineSpan displaySemiboldSM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with SM size (30) and bold font weight.
  InlineSpan displayBoldSM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with XS size (24) and regular font weight.
  InlineSpan displayXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with XS size (24) and medium font weight.
  InlineSpan displayMediumXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with XS size (24) and semibold font weight.
  InlineSpan displaySemiboldXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with XS size (24) and bold font weight.
  InlineSpan displayBoldXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with XL text size (20) and regular font weight.
  InlineSpan textXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with XL text size (20) and medium font weight.
  InlineSpan textMediumXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with XL text size (20) and semibold font weight.
  InlineSpan textSemiboldXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with XL text size (20) and bold font weight.
  InlineSpan textBoldXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with LG text size (18) and regular font weight.
  InlineSpan textLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with LG text size (18) and medium font weight.
  InlineSpan textMediumLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with LG text size (18) and semibold font weight.
  InlineSpan textSemiboldLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with LG text size (18) and bold font weight.
  InlineSpan textBoldLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with MD text size (16) and regular font weight.
  InlineSpan textMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with MD text size (16) and medium font weight.
  InlineSpan textMediumMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with MD text size (16) and semibold font weight.
  InlineSpan textSemiboldMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with MD text size (16) and bold font weight.
  InlineSpan textBoldMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with SM text size (14) and regular font weight.
  InlineSpan textSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with SM text size (14) and medium font weight.
  InlineSpan textMediumSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with SM text size (14) and semibold font weight.
  InlineSpan textSemiboldSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with SM text size (14) and bold font weight.
  InlineSpan textBoldSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] widget with XS text size (12) and semibold font weight.
  InlineSpan textSemiboldXSM() =>
      _getData(size: 13, height: 18, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with XS text size (12) and regular font weight.
  InlineSpan textXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with XS text size (12) and medium font weight.
  InlineSpan textMediumXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with XS text size (12) and semibold font weight.
  InlineSpan textSemiboldXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with XS text size (12) and bold font weight.
  InlineSpan textBoldXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Bold);

  /// Creates a [TextSpan] with the provided size and font weight.
  ///
  /// The [size] parameter specifies the font size, while [fontWeight]
  /// specifies the weight of the font. Other styling properties are
  /// inherited from the [CustomTextSpanEnum] instance.
  InlineSpan _getData(
          {required double size,
          required double height,
          FontWeight? fontWeight}) =>
      CustomTextSpan(
        text: text,
        size: size,
        color: color,
        fontWeight: fontWeight,
        decoration: decoration,
        backgroundColor: backGroundColor,
        height: height / size,
        isTextSpan: isTextSpan,
        alignment: alignment,
        decorationColor: decorationColor,
      );
}

class CustomHtmlText extends StatelessWidget {
  final String html;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextDecoration? decoration;
  final bool lineGapNeeded;
  final Color? backGroundColor;
  final LaunchMode openUrlMode;

  const CustomHtmlText(
    this.html, {
    super.key,
    this.color,
    this.size,
    this.fontWeight,
    this.maxLines,
    this.decoration,
    this.lineGapNeeded = false,
    this.backGroundColor,
    this.openUrlMode = LaunchMode.inAppWebView,
  });

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      html,
      textStyle: customizeTextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          fontColor: color,
          height: lineGapNeeded == true
              ? 1.8
              : kIsWeb
                  ? 1.2
                  : 0.0,
          decoration: decoration,
          backgroundColor: backGroundColor,
          decorationColor: color),
      onTapUrl: (url) async {
        await open_service.loadLibrary();
        await open_service.OpenService()
            .openUrl(uri: Uri.parse(url), mode: openUrlMode);
        return true;
      },
    );
  }
}

/*class CustomExpandableText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const CustomExpandableText(
      this.text, {
        super.key,
        this.color,
        this.size,
        this.fontWeight,
        this.textAlign,
      });

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      text,
      textAlign: textAlign,
      style: customizeTextStyle(
        fontWeight: fontWeight,
        fontSize: size,
        fontColor: color,
      ),
      expandText: 'show more',
      collapseText: 'show less',
      maxLines: 1,
      linkColor: Colors.blue,
    );
  }
}*/

class FontWeightEnum {
  static FontWeight Regular = FontWeight.w400;
  static FontWeight Medium = FontWeight.w500;
  static FontWeight Semibold = FontWeight.w600;
  static FontWeight Bold = FontWeight.w700;
}
