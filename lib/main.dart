import 'package:basic_mobile_app/core/routes/pages.dart';
import 'package:basic_mobile_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/di/dependency_injection.dart';
import 'core/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await DependencyInjection.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use GetX to rebuild when theme changes
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'StoreGo',
          theme: controller.theme,
          darkTheme: controller.theme, // Let controller determine theme
          themeMode: controller.themeMode,
          initialRoute: AppRoutes.onBoarding,
          getPages: AppPages.pages, // Assuming your routes are set up for GetX
          defaultTransition: Transition.fade,
        );
      },
    );
  }
}
