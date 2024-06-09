import 'package:flutter/material.dart';
import 'package:todo/constant/constants.dart';
import 'package:todo/constant/style.dart';
import 'package:todo/ui/base/base_widget.dart';

class TimeAndDataWidget extends BaseStateLessWidget {
  final String title;
  final String time;
  final VoidCallback onaTap;
  TimeAndDataWidget({
    super.key,
    required this.onaTap,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onaTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: dimens.k14,
              fontWeight: FontWeight.w600,
              color: Style.textColor,
            ),
          ),
          dimens.k8.verticalBoxPadding(),
          Container(
            padding: EdgeInsets.all(dimens.k10),
            decoration: Style.splashBackgroundLinearDecoration(opacity: 0.2).copyWith(
              borderRadius: BorderRadius.circular(dimens.k10),
            ),
            child: Row(
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: dimens.k12,
                    fontWeight: FontWeight.w600,
                    color: Style.textColor,
                  ),
                ),
                dimens.k8.horizontalBoxPadding(),
                Container(
                  decoration: Style.splashBackgroundLinearDecoration(opacity: 0.3).copyWith(
                    borderRadius: BorderRadius.circular(dimens.k10),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Style.greenColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
