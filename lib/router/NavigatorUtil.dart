import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:we_chat/common/utils/fluro_convert_util.dart';
import 'package:we_chat/router/routes.dart';

import 'application.dart';

class NavigatorUtil {
  /// 返回
  static void goBack(BuildContext context) {
    unfocus();

    /// 其实这边调用的是 Navigator.pop(context);
    Application.router.pop(context);
  }

  /// 带参数的返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  static void goLoginPage(BuildContext context) {
    Application.router.navigateTo(
      context,
      Routes.login,
      replace: true,
      transition: TransitionType.fadeIn,
    );
  }

  static void goAppPage(BuildContext context) {
    Application.router.navigateTo(
      context,
      Routes.app,
      replace: true,
      transition: TransitionType.fadeIn,
    );
  }

  /// 跳转到 传参demo 页面
  static void goDemoParamsPage(
      BuildContext context, String name, int age, double score, bool sex) {
    /// 对中文进行编码
    String mName = FluroConvertUtils.fluroCnParamsEncode(name);

    /// 对自定义类型 转为 json string
    // String personJson = FluroConvertUtils.object2string(person);
    Application.router.navigateTo(
      context,
      Routes.demoParams + "?name=$mName&age=$age&score=$score&sex=$sex",
    );
  }

  /// 跳转到 会返回参数的 页面
  static Future goReturnParamsPage(BuildContext context) {
    return Application.router.navigateTo(context, Routes.returnParams);
  }

  /// 跳转到 转场动画 页面 ， 这边只展示 inFromLeft ，剩下的自己去尝试下，
  /// 框架自带的有 native，nativeModal，inFromLeft，inFromRight，inFromBottom，fadeIn，custom
  static Future gotransitionDemoPage(BuildContext context, String title) {
    return Application.router.navigateTo(
      context, Routes.transitionDemo + "?title=$title",

      /// 指定了 转场动画 inFromLeft
      transition: TransitionType.inFromLeft,
    );
  }

  /// 自定义 转场动画
  static Future gotransitionCustomDemoPage(BuildContext context, String title) {
    var transition = (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return new ScaleTransition(
        scale: animation,
        child: new RotationTransition(
          turns: animation,
          child: child,
        ),
      );
    };
    return Application.router.navigateTo(
      context, Routes.transitionCustomDemo + "?title=$title",
      transition: TransitionType.custom,

      /// 指定是自定义动画
      transitionBuilder: transition,

      /// 自定义的动画
      transitionDuration: const Duration(milliseconds: 600),
    );

    /// 时间
  }

  /// 使用 IOS 的 Cupertino 的转场动画，这个是修改了源码的 转场动画
  /// Fluro本身不带，但是 Flutter自带
  /// Fluro 现已支持 Cupertino
  static Future gotransitionCupertinoDemoPage(
    BuildContext context,
    String title,
  ) {
    return Application.router.navigateTo(
      context,
      Routes.transitionCupertinoDemo + "?title=$title",
      transition: TransitionType.cupertino,
    );
  }

  static void unfocus() {
    // 使用下面的方式，会触发不必要的build。
    // FocusScope.of(context).unfocus();
    // https://github.com/flutter/flutter/issues/47128#issuecomment-627551073
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
