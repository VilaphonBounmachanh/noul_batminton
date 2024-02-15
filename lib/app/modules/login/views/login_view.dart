// ignore_for_file: unused_import, must_be_immutable, avoid_print

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:noul_batmainton/app/modules/login/widgets/email_phone_text_field.dart';
import 'package:noul_batmainton/app/modules/login/widgets/login_button.dart';
import 'package:noul_batmainton/app/modules/login/widgets/password_text_filed.dart';
import 'package:noul_batmainton/app/modules/login/widgets/reuse_circular_avartar.dart';
import 'package:noul_batmainton/app/services/constants/app_color.dart';
import 'package:noul_batmainton/app/services/constants/logo_for_login.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  @override
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    // RegisterController registerController = Get.put(RegisterController());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 24,
                  right: 24,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: .25 * widthMediaQuery,
                              backgroundColor: const Color(0xFF00A950),
                              backgroundImage: const AssetImage(
                                "assets/images/logo_jong.png",
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Saysettha badminton bookings",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 24,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "ໃສ່ອີເມວ ຫຼື ເບີໂທຂອງທ່ານ",
                        style: TextStyle(
                          fontFamily: 'NotoSansLao',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      EmailPhoneTextfield(
                        labelText: 'Email/Phone',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const PasswordTextfield(
                        labelText: 'password',
                        iconSuffix: Icon(
                          Icons.visibility,
                          color: Colors.green,
                        ),
                        boolobscureText: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Get.to(const ResetPasswordView());
                            },
                            child: const Text(
                              "forgot password?",
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: LoginButton(
                          label: 'Login',
                          onPressed: () {
                            // if (formKey.currentState!.validate()) {
                            //   // final phoneNumberOrEmail = registerController.emailOrPhoneController.text;
                            //   if (RegExp(r'^\d{10}$').hasMatch(phoneNumberOrEmail)) {
                            //     print('Phone number entered: $phoneNumberOrEmail');

                            //     // registerPhoneController.verifyPhoneNumber(context: context);
                            //     // LoginProvider().loginWithPhone(
                            //     //   phoneNumber: registerController.emailOrPhoneController.text.trim(),
                            //     //   password: registerController.passwordController.text.trim(),
                            //     //   context: context,
                            //     // );
                            //   } else if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(phoneNumberOrEmail)) {
                            //     print('Email address entered: $phoneNumberOrEmail');
                            //     // controller.signInUser(context: context);
                            //     // LoginProvider().loginWithGmail(
                            //     //   email: registerController.emailOrPhoneController.text.trim(),
                            //     //   password: registerController.passwordController.text.trim(),
                            //     //   context: context,
                            //     // );
                            //   }
                            // }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      // Center(
                      //   child: SizedBox(
                      //     width: 250,
                      //     height: 40,
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         ReusableCircularAvatar(
                      //           onTap: () {},
                      //           imageUrl: imageList[2].image, // Provide the image URL here
                      //           radius: 0.07 * MediaQuery.of(context).size.width,
                      //         ),
                      //         ReusableCircularAvatar(
                      //           // onTap: () => controller.signInWithGoogle(context: context),

                      //           imageUrl: imageList[0].image,
                      //           radius: 0.07 * MediaQuery.of(context).size.width,
                      //         ),
                      //         ReusableCircularAvatar(
                      //           onTap: () {},
                      //           imageUrl: imageList[1].image,
                      //           radius: 0.07 * MediaQuery.of(context).size.width,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 100),
                          height: .005 * heightMediaQuery,
                          width: 0.5 * widthMediaQuery,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed('register');
                          },
                          child: const Text(
                            "Create new Account?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 16, 2, 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
