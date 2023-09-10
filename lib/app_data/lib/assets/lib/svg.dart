import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Svg {
  final String _defaultPath = 'assets/images/';

  String _name(String name) {
    if (name.endsWith('.svg')) {
      return _defaultPath + name;
    } else {
      return '$_defaultPath$name.svg';
    }
  }

  ColorFilter? _getColorFilterFromColor(Color? color) =>
      color == null ? null : ColorFilter.mode(color, BlendMode.srcIn);

  // Auth
  SvgPicture closeSquare({
    Color? color,
    double? size,
  }) =>
      SvgPicture.asset(
        _name('close-square'),
        colorFilter: _getColorFilterFromColor(color),
        width: size,
      );

  SvgPicture emojiHappy({
    Color? color,
    double? size,
  }) =>
      SvgPicture.asset(
        _name('emoji-happy'),
        colorFilter: _getColorFilterFromColor(color),
        width: size,
      );

  SvgPicture tickSquare({
    Color? color,
    double? size,
  }) =>
      SvgPicture.asset(
        _name('tick-square'),
        colorFilter: _getColorFilterFromColor(color),
        width: size,
      );

  SvgPicture icons({
    Color? color,
    double? size,
  }) =>
      SvgPicture.asset(
        _name('Icons'),
        colorFilter: _getColorFilterFromColor(color),
        width: size,
      );
  SvgPicture arrowBack({
    Color? color,
    double? size,
  }) =>
      SvgPicture.asset(
        _name('arrow-back'),
        colorFilter: _getColorFilterFromColor(color),
        width: size,
      );

  SvgPicture vector1({
    Color? color,
    double? size,
  }) =>
      SvgPicture.asset(
        _name('Vector1'),
        colorFilter: _getColorFilterFromColor(color),
        width: size,
      );

  SvgPicture vector2({
    Color? color,
    double? size,
  }) =>
      SvgPicture.asset(
        _name('Vector2'),
        colorFilter: _getColorFilterFromColor(color),
        width: size,
      );

  SvgPicture frame({
    Color? color,
    double? size,
  }) =>
      SvgPicture.asset(
        _name('610'),
        colorFilter: _getColorFilterFromColor(color),
        width: size,
      );
}
