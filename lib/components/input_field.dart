import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController inputController;
  final String labelText;

  const InputField(
      {super.key, required this.inputController, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      decoration: InputDecoration(
        labelText: labelText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        floatingLabelStyle: const TextStyle(color: Colors.black),
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }
}
