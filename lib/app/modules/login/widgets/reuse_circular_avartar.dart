import 'package:flutter/material.dart';

class ReusableCircularAvatar extends StatelessWidget {
  final VoidCallback onTap;
  final String imageUrl;
  final double radius;

  const ReusableCircularAvatar({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.2,
              color: Color.fromARGB(255, 215, 215, 215),
              spreadRadius: 2,
            )
          ],
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image(
              image: AssetImage(imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}
