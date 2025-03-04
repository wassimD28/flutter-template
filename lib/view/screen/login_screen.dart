import 'package:basic_mobile_app/core/constant/theme_constants.dart';
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

    return Scaffold(
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
                  style: AppTheme.headingLarge,
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
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              AppTheme.globalBorderRadius),
                        ),
                        backgroundColor: AppTheme.backgroundColor,
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                    )),
                const SizedBox(height: 16),

                // Forgot Password and Register links
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to forgot password screen
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
