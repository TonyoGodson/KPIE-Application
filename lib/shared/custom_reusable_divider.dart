import 'package:flutter/material.dart';

class CustomReusableDivider extends StatefulWidget {
  final Color? color;
  final double? height;
  final double? leftIndent;
  final double? rightIndent;
  final double? thickness;
  const CustomReusableDivider({Key? key,
    this.height, this.color, this.thickness,
    this.leftIndent, this.rightIndent,
  }) : super(key: key);

  @override
  State<CustomReusableDivider> createState() => _CustomReusableDividerState();
}

class _CustomReusableDividerState extends State<CustomReusableDivider> {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: widget.color ?? Theme.of(context).primaryColor,
      height: widget.height,
      indent: widget.leftIndent,
      endIndent: widget.rightIndent,
      thickness: widget.thickness,
    );
  }
}
