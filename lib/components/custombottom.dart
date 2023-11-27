import 'package:flutter/material.dart';

class Custombuttom extends StatelessWidget {
  const Custombuttom({
    super.key,
    required this.ontap,
    required this.text,
    this.image,
    required this.color,
    required this.size,
  });
  final VoidCallback ontap;
  final String text;
  final String? image;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: size,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Image.asset(
                    image!,
                    width: 50,
                    height: 50,
                  )
                : Container(),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
