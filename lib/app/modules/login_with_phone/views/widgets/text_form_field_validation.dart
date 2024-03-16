import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:noul_batmainton/app/modules/login_with_phone/controllers/login_with_phone_controller.dart';

//commit

class TextFormFieldValidation extends StatelessWidget {
  TextFormFieldValidation({super.key});
  final LoginWithPhoneController loginController = Get.put(LoginWithPhoneController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Form(
      key: loginController.formKey,
      child: TextFormField(
        onChanged: (value) => loginController.mobile.value = value,
        controller: loginController.phoneController,
        maxLength: 8,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your phone number';
          } else if (value.length < 8) {
            return 'Please enter a valid phone number';
          } else if (!['2', '5', '7', '9'].contains(value[0])) {
            return 'Please enter a valid phone number';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        cursorColor: Colors.blue,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'XXXX XXXX',
          isDense: false,
          hintStyle: TextStyle(
            fontFamily: 'NotoSansLao',
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
            fontSize: 15,
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            width: size.width * .32,
            child: Row(
              children: [
                const Icon(Icons.phone),
                Text(
                  "(+856) 20",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.green), //<-- SEE HERE
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.green), //<-- SEE HERE
            borderRadius: BorderRadius.circular(50.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.red), //<-- SEE HERE
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.red), //<-- SEE HERE
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}
