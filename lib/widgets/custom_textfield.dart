
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key, required this.nameController, required this.name});

  final TextEditingController nameController;
  final String name;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(3, 3),
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10)
          ]),
      child: TextFormField(
          autofocus: false,
          controller: widget.nameController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter Correct Name";
            } else {
              return null;
            }
          },
          onSaved: (value) {
            widget.nameController.text = value!;
            setState(() {
              
            });
          },

          onChanged: (value) {
            setState(() {
              
            });
          },
          // textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.grey),
              //   prefixIcon: Icon(Icons.vpn_key),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: widget.name,
              border: InputBorder.none)),
    );
  }
}
