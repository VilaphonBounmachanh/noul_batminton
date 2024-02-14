// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({
    super.key,
    required this.labelText,
    required this.iconSuffix,
    required this.boolobscureText,
  });
  final String labelText;
  final Icon iconSuffix;
  final bool boolobscureText;

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  // final LoginController controller = Get.put(LoginController());

  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller.passwordController, this is old code

      obscureText: isShowPassword,
      inputFormatters: [
        LengthLimitingTextInputFormatter(6), // Limit to 6 characters
      ],
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF00A950)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF00A950)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 14,
        ),
        label: const Text(
          "password",
          style: TextStyle(color: Colors.grey),
        ),
        hintText: 'ໃສ່ລະຫັດຜ່ານ',
        suffixIcon: GestureDetector(
          onTap: () {
            setState(
              () {
                isShowPassword = !isShowPassword;
              },
            );
          },
          child: Icon(
            isShowPassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.green,
          ),
        ),
      ),
      validator: (value) {
        // Check if this field is empty
        if (value == null || value.isEmpty) {
          return '* Required';
        }
        if (value.length < 6) {
          return 'ລະຫັດຜ່ານຕ້ອງມີຄວາມຍາວຢ່າງໜ້ອຍ 6 ຕົວອັກສອນ';
        }
        return null;
      },
    );
  }
}
