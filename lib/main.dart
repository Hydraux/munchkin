import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchkin/controllers/bindings/auth_binding.dart';
import 'package:munchkin/controllers/home_controller.dart';
import 'package:munchkin/root.dart';
import 'package:firebase_core/firebase_core.dart';

const BorderRadius _borderRadius = BorderRadius.all(Radius.circular(10));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<HomeController>(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.blue.shade800),
        scaffoldBackgroundColor: Colors.blue.shade200,
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.blue.shade700),
        snackBarTheme:
            const SnackBarThemeData(backgroundColor: Colors.white, contentTextStyle: TextStyle(color: Colors.black)),
        primarySwatch: Colors.blue,
        dialogBackgroundColor: Colors.blue.shade800,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: _borderRadius),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue.shade500),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
      ),
      home: const Root(),
    );
  }
}
