import 'package:flutter/material.dart';
import 'dart:math';

class SizeUtil {
  static const _DESIGN_WIDTH = 750;
  static const _DESIGN_HEIGHT = 1334;

  static Size _logicSize = const Size(0.0, 0.0);

  static get width {
    return _logicSize.width;
  }

  static get height {
    return _logicSize.height;
  }

  static set size(size) {
    _logicSize = size;
  }
  
  static double getAxisX (double w) {
    return (w * width) / _DESIGN_WIDTH;
  }

  static double getAxisY (double h) {
    return (h * height) / _DESIGN_HEIGHT;
  }

  static double getBothAxis (double s) {
    return s * sqrt((width * width + height * height) /
            (_DESIGN_WIDTH * _DESIGN_WIDTH + _DESIGN_HEIGHT * _DESIGN_HEIGHT));
  }
}