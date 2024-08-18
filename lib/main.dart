
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readky/view/screens/welcome_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // scrollBehavior: ScrollConfiguration.of(context).copyWith( dragDevices: { PointerDeviceKind.touch, PointerDeviceKind.mouse, },
      // scrollBehavior: const MaterialScrollBehavior().copyWith(
      //   dragDevices: {PointerDeviceKind.mouse},
      // ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'open sans',
      ),
      home: WelcomePage(),
    );
  }
}
