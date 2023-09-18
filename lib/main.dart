import 'package:fittrix/common/init_bindings.dart';
import 'package:fittrix/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitBinding(),
      title: 'Fittrix',
      debugShowCheckedModeBanner: false,
      // starting point from where app should begin
      locale: const Locale('ko'), // translations will be displayed in that locale
      fallbackLocale: const Locale('ko'),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.white,
          shadowColor: Colors.white,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        unselectedWidgetColor: const Color.fromRGBO(113, 113, 120, 0.4),
      ),
      home: MainPage(),
    );
  }
}