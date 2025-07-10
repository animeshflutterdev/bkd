import 'package:bkd/services/custom_widgets/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants/color_const.dart';
import '../../utils/constants/hex_color.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? title;
  final String? label;
  final bool? isRequired;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLength;
  final void Function()? onTap;
  final bool? enabled;
  final bool readOnly;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final EdgeInsets scrollPadding;
  final bool autofocus;
  final TextAlign? textAlign;
  final String? errorText;
  final BorderRadius borderRadius;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.title,
    this.label,
    this.isRequired,
    this.keyboardType,
    this.inputFormatters,
    this.suffix,
    this.prefix,
    this.maxLength,
    this.onTap,
    this.enabled,
    this.readOnly = false,
    this.onChanged,
    this.focusNode,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.autofocus = false,
    this.textAlign,
    this.errorText,
    this.borderRadius = const BorderRadius.all(Radius.circular(6.0)),
    this.textInputAction = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title?.isNotEmpty == true)
          CustomText('${title ?? ""}${isRequired == true ? " *" : ""}',
              color: HexColor.fromHex(ColorConst.primaryDark),
              size: 14,
              fontWeight: FontWeightEnum.Regular),
        if (title?.isNotEmpty == true) 5.ph,
        TextFormField(
            textInputAction: textInputAction,
            autofocus: autofocus,
            cursorColor: HexColor.fromHex(ColorConst.primaryDark),
            cursorErrorColor: HexColor.fromHex(ColorConst.primaryDark),
            onChanged: onChanged,
            readOnly: readOnly,
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onTap: onTap,
            enabled: enabled,
            focusNode: focusNode,
            scrollPadding: scrollPadding,
            onFieldSubmitted: onFieldSubmitted,
            maxLines: maxLines,
            textAlign: textAlign ?? TextAlign.start,
            style: customizeTextStyle(
                fontWeight: FontWeightEnum.Regular,
                fontSize: 16,
                fontColor: HexColor.fromHex(enabled == false
                    ? ColorConst.gray500
                    : ColorConst.gray700)),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              filled: enabled == false ? true : null,
              fillColor:
                  enabled == false ? HexColor.fromHex(ColorConst.gray50) : null,
              errorText: errorText,
              counterText: "",
              prefixIcon: prefix,
              suffixIcon: suffix,
              labelText: (label?.isNotEmpty == true)
                  ? '${label ?? ""}${isRequired == true ? " *" : ""}'
                  : null,
              hintText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              errorMaxLines: 3,
              errorStyle: customizeTextStyle(
                fontWeight: FontWeightEnum.Regular,
                fontSize: 14,
                fontColor: HexColor.fromHex(ColorConst.red),
              ),
              hintStyle: customizeTextStyle(
                  fontWeight: FontWeightEnum.Regular,
                  fontSize: 14,
                  fontColor: HexColor.fromHex(ColorConst.secondaryDark)),
              labelStyle: customizeTextStyle(
                  fontWeight: FontWeightEnum.Regular,
                  fontSize: 16,
                  fontColor: HexColor.fromHex(ColorConst.secondaryDark)),
              floatingLabelStyle: customizeTextStyle(
                  fontWeight: FontWeightEnum.Regular,
                  fontSize: 16,
                  fontColor: HexColor.fromHex(ColorConst.gray500)),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: HexColor.fromHex(ColorConst.gray300),
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: HexColor.fromHex(ColorConst.gray300),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: HexColor.fromHex(ColorConst.gray300),
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: HexColor.fromHex(ColorConst.gray300),
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: HexColor.fromHex(ColorConst.red),
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: HexColor.fromHex(ColorConst.red),
                  width: 1,
                ),
              ),
            )),
      ],
    );
  }
}

class PinCodeFormField extends StatefulWidget {
  final int length;
  final TextEditingController? controller;
  final void Function(String)? onCompleted;
  final BorderRadius borderRadius;

  const PinCodeFormField({
    super.key,
    this.length = 6,
    this.controller,
    this.onCompleted,
    this.borderRadius = const BorderRadius.all(Radius.circular(6.0)),
  });

  @override
  State<PinCodeFormField> createState() => _PinCodeFormFieldState();
}

class _PinCodeFormFieldState extends State<PinCodeFormField> {
  late final List<TextEditingController> _fieldControllers;
  late final List<FocusNode> _focusNodes;
  late final TextEditingController _mainController;

  bool _hasError = false;
  bool _hasCompleted = false;

  @override
  void initState() {
    super.initState();

    _fieldControllers =
        List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    _mainController = widget.controller ?? TextEditingController();

    _mainController.addListener(_syncFromMainController);

    // Listen for paste on first box
    _focusNodes[0].addListener(() async {
      if (_focusNodes[0].hasFocus) {
        final data = await Clipboard.getData('text/plain');
        final pasted = data?.text?.replaceAll(RegExp(r'\D'), '') ?? '';
        if (pasted.length == widget.length) {
          for (int i = 0; i < widget.length; i++) {
            _fieldControllers[i].text = pasted[i];
          }
          _mainController.text = pasted;
          setState(() {
            _hasCompleted = true;
            _hasError = false;
          });
          widget.onCompleted?.call(pasted);
        }
      }
    });
  }

  @override
  void dispose() {
    _mainController.removeListener(_syncFromMainController);
    if (widget.controller == null) {
      _mainController.dispose();
    }
    for (final controller in _fieldControllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _syncFromMainController() {
    final text = _mainController.text;
    for (int i = 0; i < widget.length; i++) {
      _fieldControllers[i].text = i < text.length ? text[i] : '';
    }
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final pin = _fieldControllers.map((c) => c.text).join();
    _mainController.text = pin;

    if (pin.length == widget.length && !pin.contains('')) {
      setState(() {
        _hasCompleted = true;
        _hasError = false;
      });
      widget.onCompleted?.call(pin);
    }
  }

  void clear() {
    for (final controller in _fieldControllers) {
      controller.clear();
    }
    _mainController.clear();
    _focusNodes[0].requestFocus();
    setState(() {
      _hasCompleted = false;
      _hasError = false;
    });
  }

  void markError() {
    setState(() {
      _hasError = true;
      _hasCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Hidden TextField for testing
        Opacity(
          opacity: 0,
          child: SizedBox(
            height: 0,
            width: 0,
            child: TextField(
              key: widget.key,
              autofocus: false,
              enableInteractiveSelection: false,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.length > widget.length) return;

                for (int i = 0; i < widget.length; i++) {
                  _fieldControllers[i].text = i < value.length ? value[i] : '';
                }

                _mainController.text = value;
                if (value.length == widget.length) {
                  widget.onCompleted?.call(value);
                }
                setState(() {
                  _hasCompleted = value.length == widget.length;
                  _hasError = false;
                });
              },
            ),
          ),
        ),

        // Real PIN fields
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 8,
          children: List.generate(widget.length, (index) {
            final isFilled = _fieldControllers[index].text.isNotEmpty;
            final color = _hasError
                ? HexColor.fromHex(ColorConst.red)
                : _hasCompleted && isFilled
                    ? HexColor.fromHex(ColorConst.brand600)
                    : HexColor.fromHex(ColorConst.gray300);

            return Flexible(
              child: TextField(
                controller: _fieldControllers[index],
                focusNode: _focusNodes[index],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 1,
                style: customizeTextStyle(
                    fontWeight: FontWeightEnum.Regular,
                    fontSize: 16,
                    fontColor: HexColor.fromHex(ColorConst.gray700)),
                decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: color, width: 1),
                    borderRadius: widget.borderRadius,
                  ),
                ),
                onChanged: (value) => _onChanged(value, index),
              ),
            );
          }),
        ),
      ],
    );
  }
}
