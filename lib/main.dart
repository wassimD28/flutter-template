import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:basic_mobile_app/core/routes/routes.dart';
import 'package:basic_mobile_app/core/routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.onBoarding, // Define the starting screen
      getPages: AppPages.pages, // Register all route definitions
    );
  }
}
