import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TxtStyle extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TxtStyle(this._text, this._size, this._color, this._fontWeight,
      {this.textDecoration, this.textAlignm, this.decorationColor});
  final String _text;
  final Color _color;
  final double _size;
  final FontWeight _fontWeight;
  final TextDecoration? textDecoration;
  final TextAlign? textAlignm;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    return Text(_text,
        textAlign: textAlignm,
        maxLines: 2,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          decoration: textDecoration,
          decorationColor: decorationColor,
          fontFamily: 'Cairo',
          color: _color,
          fontSize: _size.sp,
          fontWeight: _fontWeight,
        ));
  }
}
