import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/constant/constants.dart';
import 'package:todo/ui/base/base_widget.dart';

class SectionVerticalWidget extends BaseStateLessWidget {
  final Widget firstWidget;
  final Widget secondWidget;
  final double? gap;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  SectionVerticalWidget({Key? key, this.gap, required this.firstWidget, required this.secondWidget, this.crossAxisAlignment, this.mainAxisAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double _gap = gap ?? (_scale <= 1 ? 8 : lerpDouble(8, 4, math.min(_scale - 1, 1)))!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [firstWidget, _gap.verticalBoxPadding(), secondWidget],
    );
  }
}
