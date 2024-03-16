// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWithPhoneController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final formKeyOtp = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final count = 0.obs;
  RxString mobile = "".obs;
  RxString otp = "".obs;
  String phoneCode = "+85620";
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
