import 'package:flutter/material.dart';

import '../core/utils/color_utils.dart';


class CustomReusableButton extends StatefulWidget {
  final String buttonTitle;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final double? left;
  final double? right;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? titleColor;
  final Function() function;
  final bool? hasIcon;
  final bool? disabled;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Color? iconColor;
  const CustomReusableButton({Key? key,
    required this.buttonTitle, this.borderColor, this.rightIcon, this.disabled,
    this.buttonHeight, this.buttonWidth, this.borderRadius,this.fontSize,
    this.left, this.right, this.buttonColor, this.hasIcon, this.leftIcon,
    required this.function, this.titleColor, this.iconColor,this.fontWeight,
  }) : super(key: key);

  @override
  State<CustomReusableButton> createState() => _CustomReusableButtonState();
}

class _CustomReusableButtonState extends State<CustomReusableButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        width: widget.buttonWidth ?? double.maxFinite,
        height: widget.buttonHeight ?? 50,
        margin: EdgeInsets.only(
          left: widget.left ?? 50, right: widget.right ?? 50
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
          color: widget.disabled??false ? ColorUtils.TEXT_GREY.withOpacity(0.25): widget.buttonColor ?? ColorUtils.TRANSPARENT_,
          border: Border.all(
            width: 1.5,
            color: widget.borderColor ?? ColorUtils.TRANSPARENT_,
          )
        ),
        alignment: Alignment.center,
        child: widget.hasIcon??false ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 20,
                child: widget.leftIcon??const SizedBox.shrink()),
            const SizedBox(width: 10,),
            Text(widget.buttonTitle,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: widget.disabled??false ? ColorUtils.WHITE_COLOR : widget.titleColor ?? ColorUtils.TRANSPARENT_,
                fontSize: widget.fontSize ?? 16,
                fontWeight: widget.fontWeight??FontWeight.normal,
              ),),
            const SizedBox(width: 10,),
            widget.rightIcon??const SizedBox.shrink(),
          ],
        ):Text(widget.buttonTitle,
          style: TextStyle(
            decoration: TextDecoration.none,
              color: widget.disabled??false ? ColorUtils.WHITE_COLOR : widget.titleColor ?? ColorUtils.TRANSPARENT_,
              fontSize: widget.fontSize ?? 16,
            fontWeight: widget.fontWeight??FontWeight.normal,
          ),),
      ),
    );
  }
}
