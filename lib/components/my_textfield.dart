import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final controller;
  final bool obsecureText;
  final String hint;
  final Icon icon;

  const MyTextField({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.obsecureText,
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool _obsecureText;

  @override
  void initState() {
    super.initState();
    _obsecureText = widget.obsecureText;
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
        obscureText: _obsecureText,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          prefixIcon: widget.icon,
          suffixIcon: IconButton(
              onPressed: _toggleVisibility,
              icon: Icon(
                  _obsecureText
                      ? Icons.visibility
                      : Icons.visibility_off)
          ),
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
      ),
    );
  }
}