import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/services/navService/i_navigation_service.dart';

class NavigationService implements INavigationService {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  @override
  Future<dynamic>? pushNamed(String path, {Object? object}) {
    return _key.currentState?.pushNamed(path, arguments: object);
  }

  @override
  Future<dynamic>? pushNamedAndRemoveUntil(String path, {Object? object}) {
    return _key.currentState?.pushNamedAndRemoveUntil(path, (route) => false, arguments: object);
  }

  @override
  Future<dynamic>? pushReplacementNamed(String path, {Object? object}) {
    return _key.currentState?.pushReplacementNamed(path, arguments: object);
  }

  @override
  GlobalKey<NavigatorState> key() => _key;

  @override
  void pop([Object? result]) {
    return _key.currentState?.pop(result);
  }

  @override
  Future<bool?> showNAVDialog(String title, String content, {bool dismissOnly = false}) async {
    return await showDialog<bool>(
      context: _key.currentContext!,
      builder: (BuildContext dialogContext) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(dismissOnly);
          },
          child: AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: dismissOnly
                ? <Widget>[
                    TextButton(
                      child: const Text('Dismiss'),
                      onPressed: () {
                        _key.currentState?.pop(true); // Dismiss alert dialog
                      },
                    ),
                  ]
                : <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        _key.currentState?.pop(false); // Dismiss alert dialog
                      },
                    ),
                    TextButton(
                      child: const Text('Ok'),
                      onPressed: () {
                        _key.currentState?.pop(true); // Dismiss alert dialog
                      },
                    ),
                  ],
          ),
        );
      },
    );
  }

  @override
  Future<void> showLoadingDialog() async {
    return await showDialog<void>(
      context: _key.currentContext!,
      builder: (BuildContext dialogContext) {
        return const AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  @override
  Future<void> showCustomDialog(Widget content, {bool dismissible = false}) {
    return showGeneralDialog(
      barrierDismissible: dismissible,
      barrierLabel: '',
      barrierColor: Colors.black38,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (ctx, anim1, anim2) => content,
      transitionBuilder: (ctx, anim1, anim2, child) => WillPopScope(
        onWillPop: () => Future.value(dismissible),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
          child: FadeTransition(
            opacity: anim1,
            child: child,
          ),
        ),
      ),
      context: _key.currentContext!,
    );
  }

  @override
  void showBottomSheet({required Widget child, bool dismissible = false, Color? bgColor = Colors.transparent}) {
    showModalBottomSheet<void>(
      context: _key.currentState!.context,
      isScrollControlled: true,
      isDismissible: dismissible,
      backgroundColor: bgColor,
      enableDrag: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      builder: (BuildContext context) {
        return child;
      },
    );
  }

  @override
  Future popUntilNamed(String path, BuildContext context, {Object? object}) async {
    return Navigator.popUntil(context, ModalRoute.withName(path));
  }

  @override
  Future displayToast(String message) async {
    await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
