import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onTextChanged;

  const CustomSearchField({
    Key? key,
    required this.controller,
    required this.onTextChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: controller,
      onChanged: onTextChanged,
      decoration: const InputDecoration(
        hintText: "Search a movie",

      ),
    );
  }
}

