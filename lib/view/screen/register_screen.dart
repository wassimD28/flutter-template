import 'package:basic_mobile_app/controller/register_controller.dart';
import 'package:basic_mobile_app/view/widget/styled_text.dart';
import 'package:basic_mobile_app/view/widget/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Register',
              ).heading2(context),
              const Text(
                'Create an account to get started',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              CustomTextInput(
                controller: controller.nameController,
                labelText: "Name",
                validator: controller.validateName,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextInput(
                controller: controller.emailController,
                labelText: "Email",
                validator: controller.validateEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextInput(
                controller: controller.passwordController,
                labelText: "Password",
                validator: controller.validatePassword,
                keyboardType: TextInputType.visiblePassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
