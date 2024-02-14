//email and phone widget
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class EmailPhoneTextfield extends StatelessWidget {
  EmailPhoneTextfield({super.key, required this.labelText});
  final String labelText;
  // LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller.emailController,  this is old code
      // this is new code
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
        label: Text(
          labelText,
          style: const TextStyle(color: Colors.grey),
        ),
        hintText: 'ໃສ່ອີເມວ ຫຼື ເບີໂທລະສັບ',
      ),
      validator: (value) {
        // Check if this field is empty
        if (value == null || value.isEmpty) {
          return '* Required';
        } else if (!RegExp(r'^\d{10}$').hasMatch(value) && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return '* ໃສ່ອີເມວ ຫຼື ເບີໂທລະສັບທີ່ຖືກຕ້ອງ';
        }
        // the email is valid
        return null;
      },
    );
  }
}
