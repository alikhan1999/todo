import 'package:flutter/material.dart';
import 'package:todo/constant/style.dart';

extension SizeExt on double {
  SizedBox verticalBoxPadding() => SizedBox(height: this);

  SizedBox horizontalBoxPadding() => SizedBox(width: this);
}

class Px {
  final double kDefaultDuration = .25;
  static const toolBar = 80.0;
  final defaultRadius = 20.0;

  double get statusBarSize => 30;

  double get extendSizeBodyBehindAppBar => toolBar + statusBarSize;
  final kDefault = 0.0;
  final k2 = 2.0;
  final k3 = 3.0;
  final k4 = 4.0;
  final k5 = 5.0;
  final k6 = 6.0;
  final k7 = 7.0;
  final k8 = 8.0;
  final k10 = 10.0;
  final k11 = 11.0;
  final k12 = 12.0;
  final k14 = 14.0;
  final k15 = 15.0;
  final k16 = 16.0;
  final k18 = 18.0;
  final k20 = 20.0;
  final k22 = 22.0;
  final k23 = 23.0;
  final k24 = 24.0;
  final k25 = 25.0;
  final k28 = 28.0;
  final k30 = 30.0;
  final k32 = 32.0;
  final k35 = 35.0;
  final k36 = 36.0;
  final k38 = 38.0;
  final k40 = 40.0;
  final k45 = 45.0;
  final k47 = 47.0;
  final k50 = 50.0;
  final k52 = 52.0;
  final k55 = 55.0;
  final k56 = 56.0;
  final k57 = 57.0;
  final k58 = 58.0;
  final k59 = 59.0;
  final k60 = 60.0;
  final k65 = 65.0;
  final k70 = 70.0;
  final k75 = 75.0;
  final k80 = 80.0;
  final k82 = 82.0;
  final k85 = 85.0;
  final k90 = 90.0;
  final k92 = 92.0;
  final k100 = 100.0;
  final k110 = 110.0;
  final k200 = 200.0;
  final k210 = 210.0;
  final k105 = 105.0;
  final k115 = 115.0;
  final k120 = 120.0;
  final k125 = 125.0;
  final k130 = 130.0;
  final k140 = 140.0;
  final k150 = 150.0;
  final k160 = 160.0;
  final k170 = 170.0;
  final k175 = 175.0;
  final k180 = 180.0;
  final k220 = 220.0;
  final k230 = 230.0;
  final k240 = 240.0;
  final k250 = 250.0;
  final k260 = 260.0;
  final k280 = 280.0;
  final k270 = 270.0;
  final k300 = 300.0;
  final k320 = 320.0;
  final k312 = 312.0;
  final k350 = 350.0;
  final k370 = 370.0;
  final k400 = 400.0;
  final k500 = 500.0;
  final k520 = 520.0;
  final k550 = 550.0;
  final k570 = 570.0;
  final k600 = 600.0;
  final k700 = 700.0;
  final k710 = 710.0;

  double get toolBarHeight => toolBar;
}

class Constants {
  static const notAvailable = 'N/A';

  static String? months(int value) {
    switch (value) {
      case 1:
        return "JANUARY";
      case 2:
        return "FEBRUARY";
      case 3:
        return "MARCH";
      case 4:
        return "APRIL";
      case 5:
        return "MAY";
      case 6:
        return "JUNE";
      case 7:
        return "JULY";
      case 8:
        return "AUGUST";
      case 9:
        return "SEPTEMBER";
      case 10:
        return "OCTOBER";
      case 11:
        return "NOVEMBER";
      case 12:
        return "DECEMBER";
      default:
        return null;
    }
  }

  static int? weekDay(String value) {
    switch (value) {
      case 'Mon':
        return 0;
      case 'Tue':
        return 1;
      case 'Wed':
        return 2;
      case 'Thu':
        return 3;
      case 'Fri':
        return 4;
      case 'Sat':
        return 5;
      case 'Sun':
        return 6;
      default:
        return 0;
    }
  }

  static List<int> daysInMonthList = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  static const apiDateFormat = "dd-MM-yyyy";
  static const dateMonthYearFormat = "d MMMM, yy";
  static const monYearFormat = "MMM yy";
  static const dateMonthFormat = "MMM d";
  static const dateWeetDateFormat = "EEE d";

  ///2023 July 10 AD 12:08 PM
  static const completeDateTime = "yyyy MMM dd hh:mm aaa";

  ///Wed, 11 Jan , 2023
  static const weekDateMonYear = "EEE, d MMM , yyyy";

  /// 11 Wed
  static const dateDay = "d EEE";

  ///wed
  static const day = "EEE";

  //02
  static const date = "dd";

  static List<String> weekDaysShort = <String>[
    'Mo',
    'Tu',
    'We',
    'Th',
    'Fr',
    'Sa',
    'Su',
  ];

  static List<String> genderList = <String>['Male', 'Female', 'Other', "He/him/his", "She/her/hers", "They/them", "Prefer not to say"];

  static List<String> psyTabsName = <String>[
    'Habit Tracker',
    'Chores Tracker',
    'Cut Back Coach',
    'Selfcare Tracker',
    'Journal',
    'Mood Tracker',
    'Affirmations',
    // 'Mindfulness',
  ];

  static List<Color> tabColor = [Style.tabColor1, Style.tabColor2, Style.tabColor3, Style.tabColor4, Style.tabColor5];
  static List<MultipleSelectedDate> listOfMultipleDate = [
    MultipleSelectedDate(title: 'Mo', isSelected: false),
    MultipleSelectedDate(title: 'Tu', isSelected: false),
    MultipleSelectedDate(title: 'We', isSelected: false),
    MultipleSelectedDate(title: 'Th', isSelected: false),
    MultipleSelectedDate(title: 'Fr', isSelected: false),
    MultipleSelectedDate(title: 'Sa', isSelected: false),
    MultipleSelectedDate(title: 'Su', isSelected: false),
  ];

  static List<TimeSlotModel> morningTimeSlot = [
    TimeSlotModel(title: '07:00 am - 07:45 am', setTime: '07:00 am', isSelected: true),
    TimeSlotModel(title: '08:00 am - 08:45 am', setTime: '08:00 am', isSelected: false),
    TimeSlotModel(title: '09:00 am - 09:45 pm', setTime: '09:00 am', isSelected: false),
    TimeSlotModel(title: '10:00 pm - 10:45 pm', setTime: '10:00 am', isSelected: false),
    TimeSlotModel(title: '11:00 pm - 11:45 pm', setTime: '11:00 am', isSelected: false)
  ];
  static List<TimeSlotModel> afterNoonTimeSlot = [
    TimeSlotModel(title: '12:00 pm - 12:45 pm', setTime: '12:00 am', isSelected: true),
    TimeSlotModel(title: '01:00 pm - 01:45 pm', setTime: '01:00 am', isSelected: false),
    TimeSlotModel(title: '02:00 pm - 02:45 pm', setTime: '02:00 am', isSelected: false),
    TimeSlotModel(title: '03:00 pm - 03:45 pm', setTime: '03:00 am', isSelected: false),
  ];

  static List<TimeSlotModel> eveningTimeSlot = [
    TimeSlotModel(title: '04:00 pm - 04:45 pm', setTime: '04:00 am', isSelected: true),
    TimeSlotModel(title: '05:00 pm - 05:45 pm', setTime: '05:00 am', isSelected: false),
    TimeSlotModel(title: '06:00 pm - 06:45 pm', setTime: '06:00 am', isSelected: false),
    TimeSlotModel(title: '07:00 pm - 07:45 pm', setTime: '07:00 am', isSelected: false),
    TimeSlotModel(title: '08:00 pm - 08:45 pm', setTime: '08:00 am', isSelected: false),
    TimeSlotModel(title: '09:00 pm - 09:45 pm', setTime: '09:00 am', isSelected: false),
  ];
}

class TimeSlotModel {
  String title;

  String setTime;
  bool isSelected;

  TimeSlotModel({required this.title, required this.setTime, required this.isSelected});
}

class MultipleSelectedDate {
  String title;
  bool isSelected;
  MultipleSelectedDate({required this.title, required this.isSelected});
}
