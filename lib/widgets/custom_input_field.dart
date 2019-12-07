import 'package:flutter/material.dart';
import 'package:flutter_freefire/utils/scale_config.dart';

// ignore: must_be_immutable
class CustomInputField extends StatelessWidget {
  SizeScaleConfig scaleConfig = SizeScaleConfig();
  final Icon icon;
  final String hintText;
  final TextInputType textInputType;
  final Color iconColor;
  final bool obscureText;
  final TextStyle textStyle, hintStyle;
  final validateFunction;
  final onSaved;
  final key;
  final EdgeInsetsGeometry padding;
  final String initialValue;

  //passing props in the Constructor.
  //Java like style
  CustomInputField(
      {this.key,
      this.hintText,
      this.obscureText,
      this.textInputType,
      this.icon,
      this.iconColor,
      this.textStyle,
      this.validateFunction,
      this.onSaved,
      this.hintStyle,
      this.padding,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: textStyle,
      key: key,
      obscureText: obscureText,
      keyboardType: textInputType,
      validator: validateFunction,
      onSaved: onSaved,
      cursorColor: Colors.black,
      cursorWidth: 1.0,
      decoration: InputDecoration(
        icon: icon,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300], width: 0.5),
          borderRadius: BorderRadius.circular(scaleConfig.scaleWidth(15))
        ),
        hintText: hintText,
        hintStyle: hintStyle,
        contentPadding: padding,
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.7),
        ),
      ),
    );
  }
}
