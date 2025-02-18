import 'package:flutter/material.dart';

import '../core/utils/color_utils.dart';
import '../core/utils/helper.dart';


class CustomReusableTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final int? maxLines;
  final double? fieldHeight;
  final double? fontSize;
  final double? labelFontSize;
  final double? leftMargin;
  final double? topMargin;
  final double? rightMargin;
  final double? bottomMargin;
  final double? borderRadius;
  final double? borderThickness;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String?)? onChange;
  final Function(String?)? onFieldSubmitted;
  final bool? filled;
  final Widget? prefIcon;
  final Widget? sufIcon;
  final Color? fillColor;
  final Color? labelColor;
  final Color? textColor;
  final Color? cursorColor;
  final bool? passwordField;
  final bool? showCursor;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final FloatingLabelBehavior? behavior;
  final Function()? ontap;
  final bool? readOnly;
  final int? maxLength;
  const CustomReusableTextField({Key? key,
    required this.controller, this.hint, this.label, this.leftMargin, this.focusedBorderColor,
    this.topMargin, this.rightMargin, this.bottomMargin, this.onChange, this.validator,
    this.fieldHeight, this.borderRadius, this.borderColor, this.filled, this.behavior,
    this.fillColor, this.prefIcon, this.sufIcon, this.maxLines, this.borderThickness,
    this.passwordField, this.onFieldSubmitted, this.fontSize, this.labelFontSize,
    this.keyboardType, this.readOnly, this.ontap, this.maxLength, this.labelColor,
    this.focusNode, this.textColor, this.showCursor, this.cursorColor,
  }) : super(key: key);

  @override
  State<CustomReusableTextField> createState() => _CustomReusableTextFieldState();
}

class _CustomReusableTextFieldState extends State<CustomReusableTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.leftMargin ?? 8.0,
        top: widget.topMargin ?? 0,
        right: widget.rightMargin ?? 8.0,
        bottom: widget.bottomMargin ?? 0.0,
      ),
      child: Stack(
        children: [
          Container(
            width: screenWidth(context),
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.teal,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 8,
                  spreadRadius: 1,
                  color: ColorUtils.TRANSPARENT_
                )
              ]
            ),
          ),
          TextFormField(
            controller: widget.controller,
            validator:  widget.validator,
            obscureText: widget.passwordField??false,
            onChanged: widget.onChange,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            onTap: widget.ontap,
            maxLines: widget.maxLines ?? 1,
            minLines: 1,
            showCursor: widget.showCursor,
            maxLength: widget.maxLength??10,
            // enabled: widget.readOnly,
            readOnly: widget.readOnly??false,
            keyboardType: widget.keyboardType?? TextInputType.text,
            cursorColor: widget.cursorColor??ColorUtils.TRANSPARENT_,
            textAlign: TextAlign.justify,
            style: specialText(
              context: context,
                fs: widget.fontSize??12,
                c: widget.textColor??ColorUtils.BLACK_COLOR,
                fw:FontWeight.w400
            ),
            decoration: InputDecoration(
              counter: SizedBox.shrink(),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius ?? 50.0),
                    borderSide: BorderSide(
                        width: widget.borderThickness ??  1.5, color: widget.borderColor ?? Theme.of(context).primaryColor
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius ?? 50.0),
                    borderSide: BorderSide(
                        width: widget.borderThickness ??  1.5, color: widget.borderColor ?? Theme.of(context).primaryColor
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius ?? 50.0),
                    borderSide: BorderSide(
                        width: widget.borderThickness ?? 1.5, color: widget.focusedBorderColor ?? ColorUtils.KPIE_BLUE
                    )
                ),
                filled: widget.filled,
                fillColor: widget.fillColor,
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: widget.fieldHeight ?? 0),
                hintText: widget.hint ?? "hint",
                hintStyle: specialText(
                    context: context,
                    fs: widget.fontSize??12,
                    c: widget.labelColor??ColorUtils.KPIE_BLUE,
                    fw:FontWeight.w400
                ),
                label: Text(widget.label ?? "label",
                  style: specialText(
                      context: context,
                      fs: widget.fontSize??12,
                      c: widget.labelColor??ColorUtils.KPIE_BLUE,
                      fw:FontWeight.w400
                  ),
                ),
                floatingLabelBehavior:  widget.behavior ?? FloatingLabelBehavior.never,
                prefixIcon: widget.prefIcon,
                suffixIcon: widget.sufIcon
            ),
          ),
        ],
      ),
    );
  }
}
