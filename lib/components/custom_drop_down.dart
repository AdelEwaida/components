import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* This DropDown Component,
    takes any type of List (List<dynamic>).
    */

class CustomDropDown extends StatelessWidget {
  final List<dynamic> items;
  String? value;
  final ValueChanged<dynamic> onChanged;
  final String? hint;
  final bool editatbale;
  final double? size;
  final Function(dynamic)? onValidator;
  final String? text;
  final double? containerWidth;

  CustomDropDown(
      {Key? key,
      required this.items,
      this.onValidator,
      this.value,
      required this.onChanged,
      this.hint,
      this.size,
      this.editatbale = true,
      this.text,
      this.containerWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth ?? MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton(
        elevation: 1,
        style: const TextStyle(color: Color(0xFF0D47A1)),
        hint: Text(
          hint.toString(),
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).hintColor,
          ),
        ),
        menuMaxHeight: 200,
        onChanged: (dynamic newValue) {
          onChanged(newValue);
          value = newValue;
        },

        value: value,
        // validator: (value) => onValidator == null ? null : onValidator!(value),
        // decoration: InputDecoration(
        //   alignLabelWithHint: true,
        //   hintText: hint ?? hint,
        //   enabled: editatbale,
        //   hintStyle: const TextStyle(
        //     color: blackColor,
        //     fontWeight: FontWeight.normal,
        //     fontSize: 12,
        //   ),
        //   border: InputBorder.none,
        // ),
        items: items.map((dynamic valueObject) {
          return DropdownMenuItem<String>(
            value: valueObject.toString(),
            child: Text(
              valueObject.toString(),
              textScaleFactor: ScaleSizeValue.textScaleFactor(context),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ScaleSizeValue {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 0.9}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1200) * maxTextScaleFactor;
    return max(0.7, min(val, maxTextScaleFactor));
  }
}
