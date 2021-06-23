import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final Function onChanged;
  final IconData icon;
  final double width;
  final bool enabled;
  final TextEditingController controller;

  CustomTextFormField(
      {Key key,
      this.enabled = true,
      @required this.label,
      @required this.keyboardType,
      @required this.onChanged,
      this.icon,
      this.width = double.infinity,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: this.width,
      child: TextField(
        enabled: this.enabled,
        controller: controller,
        keyboardType: this.keyboardType,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
              horizontal: 12.5, vertical: this.icon != null ? 12.5 : 14),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none),
          prefixIcon: this.icon != null ? Icon(this.icon) : null,
          labelText: this.label,
          errorStyle: TextStyle(fontSize: 0, height: 0),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        cursorColor: Colors.black,
        onChanged: this.onChanged,
      ),
    );
  }
}
