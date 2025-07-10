import 'package:bkd/services/custom_widgets/sizing.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color_const.dart';
import '../../utils/constants/hex_color.dart';
import 'custom_text.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final BoxBorder? border;
  final DecorationImage? image;

  const CustomContainer({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.color,
    required this.child,
    this.padding,
    this.margin,
    this.borderColor,
    this.boxShadow,
    this.gradient,
    this.border,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
              )
            : border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        image: image,
      ),
      child: child,
    );
  }
}

@Deprecated('Use [CustomContainer]')
class CustomCardDesign extends StatelessWidget {
  final Size? minimumSize;
  final double? radius;
  final Color? color;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;

  const CustomCardDesign({
    super.key,
    this.minimumSize,
    this.radius,
    this.color,
    required this.child,
    this.padding,
    this.margin,
    this.borderColor,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: minimumSize?.height,
      width: minimumSize?.width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
              )
            : null,
        borderRadius:
            radius != null ? BorderRadius.all(Radius.circular(radius!)) : null,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}

class PagedScrollRefreshWidget extends StatefulWidget {
  final Function? paginate, onRefresh, onScroll;
  final Widget child;

  const PagedScrollRefreshWidget({
    super.key,
    this.paginate,
    this.onRefresh,
    this.onScroll,
    required this.child,
  });

  @override
  State<PagedScrollRefreshWidget> createState() =>
      _PagedScrollRefreshWidgetState();
}

class _PagedScrollRefreshWidgetState extends State<PagedScrollRefreshWidget> {
  double _previousScrollPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        widget.onScroll?.call();
        final maxScrollExtent = scrollInfo.metrics.maxScrollExtent;
        final currentScrollPosition = scrollInfo.metrics.pixels;

        if (maxScrollExtent > 0 &&
            currentScrollPosition >= (maxScrollExtent / 4) &&
            currentScrollPosition > _previousScrollPosition) {
          widget.paginate?.call();
        }

        _previousScrollPosition = currentScrollPosition;
        return true;
      },
      child: RefreshIndicator(
        color: HexColor.fromHex(ColorConst.baseHexColor),
        backgroundColor: Colors.white,
        onRefresh: () async {
          if (widget.onRefresh != null) {
            widget.onRefresh?.call();
          }
        },
        child: widget.child,
      ),
    );
  }
}

class KeyValueWidget extends StatelessWidget {
  final FontWeight? fontWeight;
  final String keyName;
  final Widget? keyNameSuffixWidget;
  final Widget? keyValuePrefixWidget;
  final String value;
  final double? size;
  final Color color;

  const KeyValueWidget({
    super.key,
    required this.keyName,
    this.keyNameSuffixWidget,
    this.keyValuePrefixWidget,
    this.fontWeight,
    required this.value,
    this.size,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomText(keyName,
                color: color, size: size ?? 16, fontWeight: fontWeight),
            if (keyNameSuffixWidget != null)
              Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: keyNameSuffixWidget!)
          ],
        ),
        16.pw,
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (keyValuePrefixWidget != null)
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: keyValuePrefixWidget!,
                  ),
                ),
              Flexible(
                child: CustomText(
                  value,
                  color: color,
                  size: size ?? 16,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
