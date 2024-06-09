import 'package:flutter/material.dart';
import 'package:todo/application/core/extensions/extensions.dart';
import 'package:todo/constant/style.dart';
import 'package:todo/ui/base/base_state.dart';
import 'package:todo/ui/base/base_widget.dart';
import 'package:todo/widgets/base_container.dart';
import 'package:todo/widgets/loading_overlay.dart';

class BaseScaffoldWithBaseContainer extends BaseStateLessWidget {
  BaseScaffoldWithBaseContainer(
      {Key? key,
      this.appBar,
      required this.body,
      this.bottomNavBar,
      this.scroll,
      this.image,
      this.verticalPadding = false,
      this.boxDecoration,
      this.loadingState,
      this.bodyColor,
      this.fullPageLoading = false,
      this.padding,
      this.willPop,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.resizeToAvoidBottomInset = false,
      this.controller})
      : super(key: key);
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavBar;
  final Widget body;
  final bool? scroll;
  final DecorationImage? image;
  final bool verticalPadding;
  final BoxDecoration? boxDecoration;
  final Color? bodyColor;
  final bool resizeToAvoidBottomInset;
  final EdgeInsetsGeometry? padding;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final ScrollController? controller;
  final BaseLoadingState? loadingState;
  final bool fullPageLoading;
  final WillPopCallback? willPop;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPop,
      child: Container(
        decoration: boxDecoration ?? Style.baseBackground,
        child: LoadingOverLay(
          loadingState: fullPageLoading ? loadingState ?? BaseLoadingState.none : BaseLoadingState.none,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            bottomNavigationBar: bottomNavBar,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: appBar,
            body: BaseContainer(
              padding: padding ?? EdgeInsets.symmetric(horizontal: dimens.k20, vertical: verticalPadding ? dimens.k5 : dimens.kDefault),
              scroll: scroll ?? true,
              image: image,
              loadingState: fullPageLoading ? null : loadingState,
              bodyColor: bodyColor,
              controller: controller,
              width: context.width,
              height: context.height,
              child: body,
            ),
            floatingActionButtonLocation: floatingActionButtonLocation ?? FloatingActionButtonLocation.centerFloat,
            floatingActionButton: floatingActionButton,
          ),
        ),
      ),
    );
  }
}

class BaseScaffold extends BaseStateLessWidget {
  BaseScaffold(
      {Key? key,
      this.appBar,
      required this.body,
      this.height,
      this.willPop,
      this.width,
      this.boxDecoration,
      this.bottomNavBar,
      this.loadingState,
      this.fullPageLoading = false,
      this.color = Colors.transparent,
      this.floatingActionButtonLocation,
      this.floatingActionButton})
      : super(key: key);
  final PreferredSizeWidget? appBar;
  final Widget body;
  final BoxDecoration? boxDecoration;
  final double? height;
  final Color color;
  final double? width;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavBar;
  final BaseLoadingState? loadingState;
  final bool fullPageLoading;
  final WillPopCallback? willPop;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPop,
      child: Container(
        height: height,
        width: width,
        decoration: boxDecoration ?? Style.baseBackground,
        child: LoadingOverLay(
          loadingState: fullPageLoading ? loadingState ?? BaseLoadingState.none : BaseLoadingState.none,
          child: Scaffold(
            backgroundColor: color,
            appBar: appBar,
            body: body,
            floatingActionButtonLocation: floatingActionButtonLocation ?? FloatingActionButtonLocation.centerFloat,
            floatingActionButton: floatingActionButton,
            bottomNavigationBar: bottomNavBar,
          ),
        ),
      ),
    );
  }
}
