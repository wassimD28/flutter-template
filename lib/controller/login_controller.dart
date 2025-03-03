import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:basic_mobile_app/core/routes/routes.dart';

class LoginController extends GetxController {
  // Form key to validate the form
  final formKey = GlobalKey<FormState>();

  // TextEditingControllers to get text input values
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable variables
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

  // Email validation using GetX's built-in validators
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Login function
  Future<void> login() async {
    // Validate form first
    if (formKey.currentState!.validate()) {
      try {
        // Set loading state
        isLoading.value = true;

        // Simulate network delay
        await Future.delayed(const Duration(seconds: 2));

        // Here you would normally:
        // 1. Call your authentication service
        // 2. Store user token in secure storage
        // 3. Navigate on success

        // For now, just navigate to home
        Get.offAllNamed(AppRoutes.home);
      } catch (e) {
        // Show error message
        Get.snackbar(
          'Error',
          'Login failed: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        // Reset loading state
        isLoading.value = false;
      }
    }
  }

  @override
  void onClose() {
    // Dispose controllers when the controller is removed
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
