import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:noul_batmainton/app/modules/login_new/views/otp_page.dart';
import 'package:noul_batmainton/app/services/constants/app_image.dart';
import 'package:noul_batmainton/app/services/helpers/dialog.dart';

import '../controllers/login_new_controller.dart';

class LoginNewView extends GetView<LoginNewController> {
  const LoginNewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 35,
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Container(
                  height: .33 * size,
                  width: .33 * size,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.loginOtp),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "ເຂົ້າສູ່ລະບົບ DocQ Flow ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                    children: [
                      TextSpan(
                        text: "\nທ່ານຈະໄດ້ຮັບລະຫັດ OTP ຜ່ານເບີໂທລະສັບຂອງທ່ານ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ກະລຸນາປ້ອນເບີໂທລະສັບຂອງທ່ານ';
                    } else if (value.length < 10) {
                      return 'ກະລຸນາປ້ອນເບີໂທລະສັບຂອງທ່ານໃຫ້ຄົບຖ້ວນ';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.blue,
                  // controller: controller.phoneController,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    //TODO: language
                    hintText: '20 XXXX XXXX',
                    hintStyle: TextStyle(
                      //TODO: font
                      fontFamily: 'NotoSansLao',
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                      fontSize: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Get.to(const OtpPage());
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ສົ່ງລະຫັດ OTP  ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  // height: 60,
                  child: Center(
                    child: Text(
                      // "$character ( $buildNumber )",
                      "Version 1.0",
                      style: TextStyle(),
                    ),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     CustomDialog.rejectDialog(); // Show the save dialog
                //   },
                //   child: const Text('Show reject Dialog'),
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     CustomDialog.saveDialog(); // Show the cancel dialog
                //   },
                //   child: const Text('Show Save Dialog'),
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     CustomDialog.rejectSuccess(); // Show the cancel dialog
                //   },
                //   child: const Text('reject success Dialog'),
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     CustomDialog.saveSuccess(); // Show the cancel dialog
                //   },
                //   child: const Text('save success Dialog'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
