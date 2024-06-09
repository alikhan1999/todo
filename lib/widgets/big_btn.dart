import 'package:flutter/material.dart';
import 'package:todo/application/core/extensions/extensions.dart';
import 'package:todo/constant/style.dart';
import 'package:todo/ui/base/base_state.dart';
import 'package:todo/ui/base/base_widget.dart';

import 'custom_loader.dart';

class BigBtn extends BaseStateLessWidget {
  final VoidCallback onTap;
  final Widget child;
  final bool showGradient;
  final Color? color;
  final double? radius;
  final double? height;
  final double? width;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final bool showArrow;
  final BaseLoadingState loadingState;

  BigBtn(
      {required this.onTap,
      Key? key,
      this.showArrow = false,
      this.loadingState = BaseLoadingState.none,
      required this.child,
      this.padding = EdgeInsets.zero,
      this.borderColor = Colors.transparent,
      this.showGradient = false,
      this.radius,
      this.color = Style.scaffoldBackground,
      this.elevation = 4.0,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: loadingState == BaseLoadingState.loading
          ? const FlickrLoader()
          : TextButton(
              onPressed: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
                onTap();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius ?? dimens.defaultRadius),
                  ),
                  maximumSize: Size(width ?? context.width, height ?? dimens.k50),
                  padding: EdgeInsets.zero,
                  elevation: elevation),
              child: Container(
                height: height ?? dimens.k50,
                decoration: showGradient
                    ? Style.sectionBoxGradientDecoration(radius: radius ?? dimens.defaultRadius)
                    : Style.sectionBoxDecoration(color: color!, radius: radius ?? dimens.defaultRadius)
                        .copyWith(border: Border.all(color: borderColor)),
                child: showArrow
                    ? Center(
                        child: Row(
                        children: <Widget>[
                          const Spacer(
                            flex: 2,
                          ),
                          child,
                          const Spacer(
                            flex: 1,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(
                            width: dimens.k8,
                          )
                        ],
                      ))
                    : Center(child: child),
              ),
            ),
    );
  }
}
