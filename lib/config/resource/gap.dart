import 'package:flutter/cupertino.dart';

// this extension for gaping between widgets
// SizedBox(height= 20) => 20.height,
extension Gap on double {
  SizedBox get height => SizedBox(height: this);
  SizedBox get width => SizedBox(width: this);
}