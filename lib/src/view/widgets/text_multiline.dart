import 'package:flutter/material.dart';


class TextMultiline extends StatefulWidget {
  final String text;
  final int maxline;
  final double maxwidth;
  final TextStyle? textStyle;

  const TextMultiline({super.key, required this.text, this.maxline = 4, this.maxwidth = 400, this.textStyle});

  @override
  State<StatefulWidget> createState() => _TextMultilineState();
}

class _TextMultilineState extends State<TextMultiline> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.maxwidth,
      child: Text(
        widget.text,
        maxLines: widget.maxline,
        overflow: TextOverflow.ellipsis,
        style: widget.textStyle,
      ),
    );
  }

}
