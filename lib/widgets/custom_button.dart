
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;
  const CustomButton({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
        child: SizedBox(
            width: double.infinity,
            // height: 50,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff5473bb),
                //  elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                //shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 50,
                ),
              ),
              //
              child: Text(
                name,
                style: const TextStyle(color: Colors.white),
              ),
            )));
  }
}
