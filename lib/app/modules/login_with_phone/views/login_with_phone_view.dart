import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noul_batmainton/app/modules/login_with_phone/views/otp_page.dart';
import 'package:noul_batmainton/app/modules/login_with_phone/views/widgets/text_form_field_validation.dart';
import 'package:noul_batmainton/app/services/constants/app_image.dart';
import 'package:noul_batmainton/app/services/widgets/botton_login.dart';

import '../controllers/login_with_phone_controller.dart';

class LoginWithPhoneView extends GetView<LoginWithPhoneController> {
  const LoginWithPhoneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginWithPhoneController>(
      init: LoginWithPhoneController(),
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: const AssetImage(AppImages.whiteJongLogo),
                          backgroundColor: Colors.green[500],
                          radius: 80,
                        ),
                        const SizedBox(height: 22),
                        const Text(
                          'Jong',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        const SizedBox(height: 22),
                        const Text(
                          'ລົງທະບຽນ ຫຼື ລົງຊື່ເຂົ້າໃຊ້ດ້ວຍເບີໂທລະສັບ',
                          style: TextStyle(
                            fontFamily: 'NotoSansLao',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 22),
                        TextFormFieldValidation(),
                        const SizedBox(height: 70),
                        SizedBox(
                          height: 50,
                          child: ButtonLogin(
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                Get.to(OtpPage(onCompleted: (String value) {}, onChange: (String value) {}, phone: '', onSummit: () {}));
                              }
                            },
                            label: 'Submit',
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('home');
                          },
                          child: const Text(
                            " Skip",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
