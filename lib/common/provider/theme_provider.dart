import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_chat/common/const/colors.dart';
import 'package:we_chat/common/const/index.dart';
import 'package:we_chat/common/const/styles.dart';

class ThemeProvider extends ChangeNotifier {
  static const Map<ThemeMode, String> themes = {
    ThemeMode.dark: 'Dark',
    ThemeMode.light: 'Light',
    ThemeMode.system: 'System',
  };

  /// 同步主题
  void syncTheme() {
    final String theme = SpUtil.getString(Constant.theme);

    if (theme.isNotEmpty && theme != themes[ThemeMode.system]) {
      notifyListeners();
    }
  }

  /// 设置主题
  void setTheme(ThemeMode themeMode) {
    /** 存到缓存中 */
    SpUtil.putString(Constant.theme, themes[themeMode]);
    /** 通知更改了Theme */
    notifyListeners();
  }

  ThemeMode getThemeMode() {
    final String theme = SpUtil.getString(Constant.theme);
    switch (theme) {
      case 'Dark':
        return ThemeMode.dark;
      case 'Light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  ThemeData getTheme({bool isDarkMode = false}) {
    return ThemeData(
      errorColor: isDarkMode ? Colours.dark_red : Colours.red,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primaryColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
      accentColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,

      /// Tab指示器颜色
      indicatorColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
      // cursorColor: Color(0xFF57BE6A),

      /// 页面背景色
      scaffoldBackgroundColor:
          isDarkMode ? Colours.dark_bg_color : Colors.white,

      /// 主要用于Material背景色
      canvasColor: isDarkMode ? Colours.dark_material_bg : Colors.white,

      /// 文字选择色（输入框复制粘贴菜单）
      textSelectionColor: Colours.app_main.withAlpha(70),
      textSelectionHandleColor: Colours.app_main,
      textTheme: TextTheme(
        // TextField输入文字颜色
        subtitle1: isDarkMode ? TextStyles.textDark : TextStyles.text,
        // Text文字样式
        bodyText2: isDarkMode ? TextStyles.textDark : TextStyles.text,
        subtitle2:
            isDarkMode ? TextStyles.textDarkGray12 : TextStyles.textGray12,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            isDarkMode ? TextStyles.textHint14 : TextStyles.textDarkGray14,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: isDarkMode ? Colours.dark_app_bar : Colours.app_bar,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        textTheme: TextTheme(
          headline6:
              isDarkMode ? TextStyles.appBarText : TextStyles.appBarTextDark,
        ),
      ),

      /// Divider 组件的主题样式，也就是那个横向线条组件
      dividerTheme: DividerThemeData(
        color: isDarkMode ? Colours.dark_line : Colours.line,
        space: 0.6,
        thickness: 0.6,
      ),

      /// 按钮主题
      buttonTheme: ButtonThemeData(
        buttonColor:
            isDarkMode ? Colours.dark_button_color : Colours.button_color,
        disabledColor:
            isDarkMode ? Colours.dark_button_disabled : Colours.button_disabled,
        highlightColor: isDarkMode
            ? Colours.dark_button_highlight
            : Colours.button_highlight,
        splashColor:
            isDarkMode ? Colours.dark_button_splash : Colours.button_splash,
      ),

      /// ios风格Widget主题
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        textTheme: CupertinoTextThemeData(
          textStyle: isDarkMode ? TextStyles.textDark : TextStyles.text,
        ),
        // https://github.com/flutter/flutter/pull/27697
        primaryColor: Colours.dark_app_main,
      ),
    );
  }
}
