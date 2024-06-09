// app theme
import 'package:todo/application/main_config/routes/route_import.dart';

class AppTheme {
  static ThemeData getAppThemeData() {
    return ThemeData(
        appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Style.whiteColor), backgroundColor: Style.blueColor),
        scaffoldBackgroundColor: Style.primaryColor,
        timePickerTheme: TimePickerThemeData(
            hourMinuteTextColor: Style.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.transparent),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        colorScheme: const ColorScheme.light(
            background: Style.scaffoldBackground, secondary: Style.accentColor, primary: Style.primaryColor, brightness: Brightness.light),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          side: const BorderSide(color: Style.accentColor),
          fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return Colors.teal;
            }
            return null;
          }),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return Colors.teal;
            }
            return null;
          }),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return Colors.green;
            }
            return null;
          }),
          trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return Colors.green;
            }
            return null;
          }),
        ));
  }

  static ThemeData getThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      useMaterial3: true,
      primarySwatch: AppMaterialColor.primarySwatch,
      primaryColor: AppColors.primaryColor,

      // Define the scaffold background color
      scaffoldBackgroundColor: AppMaterialColor.primarySwatch.shade50,

      //Define the font family
      fontFamily: AppFonts.primaryFont,

      // Define the input decoration theme for all text fields
      inputDecorationTheme: _inputDecorationTheme(),
      // Define the elevated button theme for all elevated buttons
      elevatedButtonTheme: _elevatedButtonTheme(),

      // Define the app bar theme for the app bar
      appBarTheme: _appBarTheme(),

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: _textTheme(),

      // Define the list tile theme for the list tile
      listTileTheme: _listTileTheme(),
    );
  }

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
        centerTitle: false,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.white),
        titleTextStyle: TextStyle(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 20));
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return const InputDecorationTheme(
      border: OutlineInputBorder(),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // alignment: Alignment.center,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        disabledForegroundColor: Colors.grey,
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        // minimumSize: const Size(88.0, 36.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }

  static _textTheme() {
    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    return const TextTheme(
      displayLarge: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w600),
      displaySmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),

      //Define the default text styling for body1
      bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
      bodyLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
      labelSmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: AppColors.grey),
    );
  }

  static _listTileTheme() {
    // Define the list tile theme for the list tile
    return const ListTileThemeData(
        tileColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        subtitleTextStyle: TextStyle(color: AppColors.grey),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black, fontSize: 18));
  }
}

class AppColors {
  static const Color primaryColor = Color(0xFF673AB7);

  // static const Color darkGreen = Color(0xFF00BFA5);
  static const Color darkGreen = Color(0xFF038249);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color red = Color(0xFFE53935);
  static const Color green = Color(0xFF43A047);
  static const Color blue = Color(0xFF1E88E5);
  static const Color yellow = Color(0xFFFFEB3B);
  static const Color orange = Color(0xFFFF9800);
  static const Color purple = Color(0xFF9C27B0);
  static const Color brown = Color(0xFF795548);
  static const Color pink = Color(0xFFE91E63);
  static const Color teal = Color(0xFF009688);
  static const Color indigo = Color(0xFF3F51B5);
  static const Color cyan = Color(0xFF00BCD4);
  static const Color amber = Color(0xFFFFC107);
  static const Color deepOrange = Color(0xFFFF5722);
  static const Color lime = Color(0xFFCDDC39);
  static const Color lightGreen = Color(0xFF8BC34A);
  static const Color lightBlue = Color(0xFF03A9F4);
  static const Color deepPurple = Color(0xFF673AB7);
  static const Color redDark = Color(0xFFD80346);
}

class AppMaterialColor {
  static MaterialColor primarySwatch = MaterialColor(
    AppColors.primaryColor.value,
    const <int, Color>{
      50: Color(0xFFE8EAF6),
      100: Color(0xFFC5CAE9),
      200: Color(0xFF9FA8DA),
      300: Color(0xFF7986CB),
      400: Color(0xFF5C6BC0),
      500: Color(0xFF3F51B5),
      600: Color(0xFF3949AB),
      700: Color(0xFF303F9F),
      800: Color(0xFF283593),
      900: Color(0xFF1A237E),
    },
  );
}

class AppFonts {
  static const String primaryFont = 'OpenSans';
}
