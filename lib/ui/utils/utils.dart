import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:todo/constant/Images/const_image.dart';
import 'package:todo/constant/style.dart';
import 'package:todo/constant/text_style/text_style.dart';

import '../../application/network/external_values/iExternalValue.dart';
import '../../di/di.dart';

class Utils {
  late IExternalValues _iExternal;
  Utils() {
    _iExternal = inject<IExternalValues>();
  }
  getTimeAgo(String? date) {
    DateTime? date0 = DateTime.tryParse(date!);
    if (date0 != null) {
      return timeago.format(date0);
    }
    return "Some time ago";
  }

  static void displayToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  String symbolText(dynamic text, String symbol, [bool isAfter = true]) {
    return text == null
        ? '-'
        : isAfter
            ? '${NumberFormat.decimalPattern().format(text)} $symbol'
            : '$symbol ${NumberFormat.decimalPattern().format(text)}';
  }

  double cast(int? value) => value?.toDouble() ?? 0.0;

  String compactText(dynamic value) => value == null ? '-' : value.toString();

  String attachBaseUrl(String? path) {
    String? pth = path;

    if (path != null && path.startsWith("/")) {
      pth = path.substring(1);
    }

    return "${_iExternal.getBaseUrl()}/$pth";
  }

  Widget loadingWidget() {
    return const Center(child: CircularProgressIndicator(color: Style.lightGradient1));
  }

  Widget loadingWidgetWithText() {
    return Center(
        child: Column(
      children: [
        const CircularProgressIndicator(color: Style.lightGradient1),
        Text('...Loading', style: headingNormalTextStyle.copyWith(color: Style.lightGradient1)),
      ],
    ));
  }

  Widget noDataWidget(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          Image.asset(AppConstImages.noDataImage),
          const SizedBox(height: 16.0),
          Text(message, style: headingNormalTextStyle),
        ],
      ),
    );
  }

  // static DateTime convertDateFromString(String? strDate) {
  //   DateTime todayDate = DateTime.parse(strDate ?? '');
  //   print(todayDate);
  //   print(formatDate(todayDate, [yyyy, '-', mm, '-', dd]));
  //
  //   return todayDate;
  // }
}
