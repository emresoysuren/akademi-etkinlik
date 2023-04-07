import 'package:akademi_etkinlik/config/config.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final bool? show;
  final String? text;
  final double? fontSize;
  final int? expandedLines;
  final int? maxLines;
  final Color? color;

  const ExpandableText({
    super.key,
    this.show,
    this.text,
    this.fontSize,
    this.expandedLines,
    this.maxLines,
    this.color,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late bool _show = widget.show ?? false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => setState(() {
        _show = !_show;
      }),
      child: Text(
        widget.text ?? "",
        textWidthBasis: TextWidthBasis.parent,
        maxLines: _show ? widget.expandedLines : widget.maxLines ?? 6,
        overflow: (_show && widget.expandedLines == null)
            ? null
            : TextOverflow.ellipsis,
        style: TextStyle(
          color: widget.color ?? ColorPalette.primaryText,
          fontSize: widget.fontSize ?? 16,
        ),
      ),
    );
  }
}
