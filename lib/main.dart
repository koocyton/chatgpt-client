import 'dart:ui';

import 'package:aichat/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wakelock/wakelock.dart';
import 'package:logging/logging.dart';
import 'package:get/get.dart';

const Color BaseColor = Color(0xFFEEEEEE);
final MediaQueryData windowMediaQueryData = MediaQueryData.fromWindow(window);
final double topHeight = windowMediaQueryData.padding.top;
final double windowWidth = windowMediaQueryData.size.width;
final double windowHeight = windowMediaQueryData.size.height;
const double headHeight = 54.00;

void main() {

  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name} [${record.time.toString().substring(0, 19)}] ${record.message}');
  });

  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  Future.delayed(const Duration(milliseconds: 200), () {
    runApp(const App());
  });
  SystemChrome.restoreSystemUIOverlays();
  // 强制竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: BaseColor,
    systemNavigationBarDividerColor: Colors.transparent,
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  ));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        return;
      },
      initialRoute: "/chatPage",
      getPages: Routes.getPages,
      // title: '',
      color: BaseColor,
      // home: ,
      home: Container(),
      locale: Get.deviceLocale,
      theme: ThemeData(brightness: Brightness.light),
      builder: (BuildContext context, Widget? child) {
        // LoginHelper.initSession();
        EasyLoading.instance
            ..displayDuration = const Duration(milliseconds: 2000)
            ..indicatorType = EasyLoadingIndicatorType.fadingCircle
            ..loadingStyle = EasyLoadingStyle.custom
            ..indicatorSize = 44.0
            ..radius = 5.0
            ..toastPosition = EasyLoadingToastPosition.bottom
            ..contentPadding = const EdgeInsets.fromLTRB(10, 10, 10, 10)
            ..backgroundColor = BaseColor
            ..indicatorColor = Colors.white
            ..textColor = Colors.white
            ..maskColor = Colors.white;
          return EasyLoading.init().call(context, child);
      },
    );
  }
}
