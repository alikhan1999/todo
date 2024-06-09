import 'package:flutter/material.dart';

class Style {
  static const primaryColor = Color(0xFFFFFFFF);
  static const accentColor = Color(0xff39cfa8);
  static const scaffoldBackground = Colors.white;
  static const scaffoldBackgroundDark = Color(0xff475063);
  static const scaffoldBackgroundlight = Color(0xfff0f1f2);
  static const disableColor = Color(0xffC7CAD0);
  static const textHeadingColor = Color(0xff31B2AA);
  static const orange = Color(0xffF7630C);
  static const textTitleColor = Color(0xcc9e9fa0);
  static const lightblueTeal = Color(0xffD5F0EE);
  static const darkBorderColor = Color(0xff475569);
  static const lightGradient1 = Color(0xff1B5381);
  static const lightGradient2 = Color(0xff39CFA8);
  static const lightPrimaryColor = Color(0xffD6ECEB);
  static const brownOrange = Color(0xff71360D);

  static const textColor = scaffoldBackgroundDark;
  static const fieldBackgroundColor = Color(0xfff0f1f2);

  static const lightRed = Color(0xffda9494);
  static const black = Color(0xff000000);

  static const card1 = Color(0xff75CECC);
  static const card2 = Color(0xff86DBAC);
  static const card3 = Color(0xff539D84);
  static const card4 = Color(0xffEAF6F7);

  static const gridColors = [card1, card2, card3];
  static const tabColor1 = Color(0xfff0f1f2);
  static const tabColor2 = Color(0xffE7F8FF);
  static const tabColor3 = Color(0xffFFF9EB);
  static const tabColor4 = Color(0xffEFF3FF);
  static const tabColor5 = Color(0xffE5FFF1);

  static const greenColor = Color(0xff8EC941);
  static const lightGreenColor = Color(0xffddffbb);
  static const darkGreenColor = Color(0xff0a9144);
  static const darkGreenColor2 = Color(0xff1B783D);
  static const tt = Colors.transparent;
  static const splashBg = Color(0xffe5f5fb);
  static const tBg = Color(0x33000000);
  static const orangeMix = Color(0xffFFB674);
  static const neoBlue = Color(0xff25B7CB);
  static const purpleAccent = Color(0xffCE8CF9);
  static const parrotGreen = Color(0xff97E37A);

  /// new colors

  static const Color bgColor = Color(0xFFFFFFFF);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color blueColor = Color(0xFF0E5EA6);
  static const Color lightBlueColor = Colors.blue;
  static const Color greyColor = Colors.grey;

  static const splashBackgroundDecoration = BoxDecoration(
    gradient: RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.468,
      colors: [Color(0xffffffff), Color(0xffe5f5fb)],
      stops: [0.0, 1.0],
    ),
  );
  static BoxDecoration splashBackgroundLinearDecoration(
          {double opacity = 0.15,
          bool applyGradient = true,
          AlignmentGeometry begin = Alignment.centerLeft,
          AlignmentGeometry end = Alignment.centerRight}) =>
      BoxDecoration(
        gradient: applyGradient
            ? LinearGradient(
                begin: begin,
                end: end,
                colors: [const Color(0xff206EAF).withOpacity(opacity), const Color(0xff39CFA8).withOpacity(opacity)],
              )
            : null,
      );

  static const trackGradient = LinearGradient(
    begin: Alignment(1.151, 6.586),
    end: Alignment(-1.05, -8.099),
    colors: [Color(0x33206eaf), Color(0x3339cfa8)],
    stops: [0.0, 1.0],
  );
  static const barGradient = LinearGradient(
    begin: Alignment(1.151, 6.586),
    end: Alignment(-1.05, -8.099),
    colors: [primaryColor, accentColor],
    stops: [0.0, 1.0],
  );

  static const gaugeGradient = LinearGradient(colors: [
    Color(0xff39CFA8),
    Color(0xffE4C711),
    Color(0xffEC1717),
  ]);

  static const baseGradient = LinearGradient(
    begin: Alignment(-1.135, -1.058),
    end: Alignment(1.0, -0.414),
    colors: [primaryColor, accentColor],
    stops: [0.0, 1.0],
  );
  static const baseGradient2 = LinearGradient(
    begin: Alignment(-1.135, -1.058),
    end: Alignment(1.0, -0.414),
    colors: [Color(0xff781ff5), Color(0xffea73d6)],
    stops: [0.0, 1.0],
  );

  static const lightGradient = LinearGradient(
    begin: Alignment(-1.135, -1.058),
    end: Alignment(1.0, -0.414),
    colors: [lightGradient1, lightGradient2],
    stops: [0.0, 1.0],
  );
  static const boxGradient = LinearGradient(
    begin: Alignment(-1.0, -0.759),
    end: Alignment(1.0, 1.0),
    colors: [primaryColor, accentColor],
    stops: [0.0, 1.0],
  );
  static LinearGradient boxGradientWithOpacity({double opacity = 1}) => LinearGradient(
        begin: const Alignment(-1.0, -0.759),
        end: const Alignment(1.0, 1.0),
        colors: [primaryColor.withOpacity(opacity), accentColor.withOpacity(opacity)],
        stops: const [0.0, 1.0],
      );

  static const progressBarGradient = LinearGradient(
    colors: [Style.primaryColor, Style.accentColor],
    begin: Alignment.topRight,
    end: Alignment.bottomCenter,
  );

  static const lineGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomRight,
    colors: [primaryColor, accentColor],
    stops: [0.0, 1.0],
  );

  static BoxDecoration imageDecoration(String path) => BoxDecoration(image: DecorationImage(image: AssetImage(path)));

  static BoxDecoration customGradientBackground({double? radius, BorderRadius? borderRadius, required LinearGradient gradient}) => BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 20),
      );

  //background screen
  // static const BoxDecoration baseBackground = BoxDecoration(gradient: baseGradient);
  static const BoxDecoration baseBackground = BoxDecoration(color: Style.tabColor1);

  static const BoxDecoration baseBackground2 = BoxDecoration(
    gradient: baseGradient2,
  );

  //buttons, tabs etc
  static BoxDecoration sectionBoxGradientDecoration({double? radius, BorderRadius? borderRadius, Gradient? gradient, bool applyGradient = true}) =>
      BoxDecoration(
        gradient: applyGradient ? gradient ?? boxGradient : null,
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 20),
      );

  //single color buttons, tabs etc
  static BoxDecoration sectionBoxDecoration({double? radius, BorderRadius? borderRadius, required Color color}) => BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 10),
      );

  static BoxDecoration sectionToggleBoxDecoration({double? radius, BorderRadius? borderRadius, Color? color, required bool isGradient}) =>
      BoxDecoration(
        color: color,
        gradient: isGradient ? boxGradient : null,
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 10),
      );
}
