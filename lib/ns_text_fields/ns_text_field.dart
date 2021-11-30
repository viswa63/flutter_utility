import 'package:flutter/material.dart';

class NSTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? lableText;
  final String? errorText;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final bool isDisable;
  final bool isTextHide;
  final bool isAutoFocus;
  final Color? prefixIconColor;
  final Color? sufixIconColor;
  final Color? enableBorderColor;
  final Color? borderColor;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;

  final Function()? sufixIconResponse;
  final Function(String)? onEnter;
  final Function(String)? onChange;

  const NSTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.lableText,
      this.errorText,
      this.prefixIcon,
      this.sufixIcon,
      this.isDisable = false,
      this.isTextHide = false,
      this.isAutoFocus = false,
      this.prefixIconColor,
      this.sufixIconColor,
      this.enableBorderColor,
      this.borderColor,
      this.maxLines = 1,
      this.keyboardType,
      this.textAlignVertical,
      this.textAlign,
      this.textInputAction,
      this.sufixIconResponse,
      this.onEnter,
      this.onChange})
      : super(key: key);

  @override
  _NSTextFieldState createState() => _NSTextFieldState();
}

class _NSTextFieldState extends State<NSTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isTextHide,
      readOnly: widget.isDisable,
      autofocus: widget.isAutoFocus,
      onChanged: widget.onChange,
      maxLines: widget.maxLines,
      decoration: showInputDecoration(),
      onFieldSubmitted: widget.onEnter,
    );
  }

  InputDecoration showInputDecoration() {
    if (widget.prefixIcon == null && widget.sufixIcon == null) {
      return defaultDecoration();
    } else if (widget.prefixIcon != null && widget.sufixIcon == null) {
      return inputDecorationWithPrefix();
    } else if (widget.prefixIcon == null && widget.sufixIcon != null) {
      return inputDecorationWithSuffix();
    } else if (widget.prefixIcon != null && widget.sufixIcon != null) {
      return inputDecorationWithPrefixAndSufix();
    } else {
      return defaultDecoration();
    }
  }

  InputDecoration inputDecorationWithPrefixAndSufix() {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.enableBorderColor ?? Colors.grey.shade400, width: 1.0)),
      labelText: widget.lableText,
      hintText: widget.hintText,
      errorText: widget.errorText,
      prefixIcon: Icon(
        widget.prefixIcon,
        color: widget.prefixIconColor,
      ),
      suffixIcon: IconButton(
        onPressed: widget.sufixIconResponse,
        icon: Icon(
          widget.sufixIcon,
          color: widget.sufixIconColor,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? Theme.of(context).primaryColor),
      ),
    );
  }

  InputDecoration inputDecorationWithPrefix() {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.enableBorderColor ?? Colors.grey.shade400, width: 1)),
      labelText: widget.lableText,
      hintText: widget.hintText,
      errorText: widget.errorText,
      prefixIcon: Icon(
        widget.prefixIcon,
        color: widget.prefixIconColor,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? Theme.of(context).primaryColor),
      ),
    );
  }

  InputDecoration inputDecorationWithSuffix() {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.enableBorderColor ?? Colors.grey.shade400, width: 1)),
      labelText: widget.lableText,
      hintText: widget.hintText,
      errorText: (widget.errorText == "") ? null : widget.errorText,
      suffixIcon: IconButton(
        onPressed: () {
          widget.sufixIconResponse!();
        },
        icon: Icon(
          widget.sufixIcon,
          color: widget.sufixIconColor,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? Theme.of(context).primaryColor),
      ),
    );
  }

  InputDecoration defaultDecoration() {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.enableBorderColor ?? Colors.grey.shade400, width: 1)),
      labelText: widget.lableText,
      hintText: widget.hintText,
      errorText: (widget.errorText == "") ? null : widget.errorText,
      border: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(AgTextFieldConstants.brdrRadiusAll),
        borderSide: BorderSide(color: widget.borderColor ?? Theme.of(context).primaryColor, width: 2),
      ),
    );
  }
}
