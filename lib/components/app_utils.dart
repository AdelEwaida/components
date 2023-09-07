import 'dart:ui';

import 'package:flutter/material.dart';

class Components {

  /* Button Component with width, onPressed(), color, fontSize, and fontWeight
    */
  Widget bigButton({
    double? width,
    onPressed,
    double? borderRadius,
    String? text,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
        ),
        elevation: 3,
        padding: const EdgeInsets.all(10.0),
        minimumSize: const Size(0.0, 50.0),
        fixedSize: Size(width ?? 0.0, 50.0),
        //fixedSize: Size(width, 50),
      ),
      child: Center(
        child: Text(
          text ?? "",
          style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: fontSize ?? 13.0,
            fontWeight: fontWeight ?? FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
