//Button Login
import 'package:flutter/material.dart';

import 'package:noul_batmainton/app/services/constants/app_color.dart';

//TODO: name
class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.label,
    required this.onPressed,
  });
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    // final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: .06 * heightMediaQuery,
      width: .35 * widthMediaQuery,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // fixedSize: const Size(150, 60),
          backgroundColor: AppColors.primaryColor,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
