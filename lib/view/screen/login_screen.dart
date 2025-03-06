import 'package:basic_mobile_app/core/routes/routes.dart';
import 'package:basic_mobile_app/core/theme/color_extension.dart';
import 'package:basic_mobile_app/view/widget/styled_buttons.dart';
import 'package:basic_mobile_app/view/widget/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:basic_mobile_app/controller/login_controller.dart';
import 'package:basic_mobile_app/view/widget/text_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller using GetX
    final controller = Get.put(LoginController());
    // Get the app colors from theme extension
    final colors = Theme.of(context).extension<AppColorExtension>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('StoreGo'),
        actions: const [ThemeToggle()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                // App logo or header image could go here
                const SizedBox(height: 24),

                // Email Input
                CustomTextInput(
                  controller: controller.emailController,
                  labelText: 'Email Address',
                  validator: controller.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),

                // Password Input with visibility toggle
                Obx(() => CustomTextInput(
                      controller: controller.passwordController,
                      labelText: 'Password',
                      validator: controller.validatePassword,
                      obscureText: !controller.isPasswordVisible.value,
                      textInputAction: TextInputAction.done,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    )),
                const SizedBox(height: 24),

                // Login Button with loading state
                Obx(() => ElevatedButton(
                      onPressed:
                          controller.isLoading.value ? null : controller.login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors?.primary,
                        foregroundColor: colors?.primaryForeground,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text(
                              'Login',
                            ),
                    )),
                const SizedBox(height: 16),
                const Text("Register").secondaryButton(
                  context,
                  onPressed: () {
                    Get.toNamed(AppRoutes.register);
                  },
                  isLoading: controller.isLoading.value,
                ),
                // Forgot Password and Register links
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.register);
                      },
                      child: const Text('Create One'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
