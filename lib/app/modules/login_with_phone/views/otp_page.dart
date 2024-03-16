import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:noul_batmainton/app/modules/login_with_phone/controllers/login_with_phone_controller.dart';
import 'package:noul_batmainton/app/services/widgets/botton_login.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatelessWidget {
  final Function(String value) onCompleted;
  final Function(String value) onChange;
  final Function() onSummit;
  final String phone;
  const OtpPage({
    super.key,
    required this.onCompleted,
    required this.onChange,
    required this.phone,
    required this.onSummit,
  });

  @override
  Widget build(BuildContext context) {
    final LoginWithPhoneController loginWithPhoneController = Get.put(LoginWithPhoneController());
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(fontSize: 22, color: Color.fromRGBO(30, 60, 87, 1)),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: loginWithPhoneController.formKeyOtp,
            child: Column(
              children: [
                SizedBox(height: Get.width * 0.2),
                const Text("ປ້ອນລະຫັດ OTP", style: TextStyle(fontSize: 24)),
                const SizedBox(height: 12),
                Column(
                  children: [
                    const Text(
                      "ລະຫັດ OTP ໄດ້ຖືກສົ່ງໄປຍັງ ",
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${loginWithPhoneController.phoneCode} $phone",
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Color(0xFFF5F6F8), borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Pinput(
                          length: 6,
                          controller: loginWithPhoneController.otpController,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.phone,
                          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: defaultPinTheme,
                          validator: (value) {
                            //TODO: lanauge
                            if (value!.isEmpty) {
                              return 'Please enter the OTP';
                            } else if (value.length != 6) {
                              return 'Please enter 6 digit OTP';
                            }
                            return null;
                          },
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onCompleted: (pin) => onCompleted(pin),
                          onChanged: (value) => onChange(value),
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 9),
                                width: 22,
                                height: 1,
                                color: Colors.green,
                              ),
                            ],
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.green),
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.green),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ButtonLogin(
                          onPressed: () {
                            if (loginWithPhoneController.formKeyOtp.currentState!.validate()) {
                              onSummit();
                            }
                          },
                          label: 'ເຂົ້າ​ສູ່​ລະ​ບົບ',
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            ' ສົ່ງລະຫັດ OTP ໃໝ່',
                            style: TextStyle(
                              // color: AppColors.primaryColor,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
