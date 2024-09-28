import 'dart:ui';

import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPasswordField;
  final String hint;
  final Icon icon;

  const MyTextField({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.isPasswordField,
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool _obsecureText;

  @override
  void initState() {
    super.initState();
    _obsecureText = widget.isPasswordField;
  }

  void _toggleVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPasswordField ? _obsecureText : false,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          prefixIcon: widget.icon,
          suffixIcon: widget.isPasswordField ?
          IconButton(
            onPressed: _toggleVisibility,
            icon: Icon(
                _obsecureText
                    ? Icons.visibility_off
                    : Icons.visibility),
            color: Theme.of(context).colorScheme.inversePrimary,
          ) : null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2.5,
            ),
          ),
          fillColor: Theme.of(context).colorScheme.tertiary,
          filled: true,
        ),
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,

        ),

      ),

    );
  }
}