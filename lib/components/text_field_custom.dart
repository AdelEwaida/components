import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/* This TextField Component,
    Supports Email, Password, and defualt TextFields
    Example:
    TextFieldCustom(
      text: Text(_locale.userName), -> this is the hint for the Text Field
      obscureText: false, -> if the text is shown or not in the Text Field
      controller: username, -> The controller of the Text Field
    ),
    */

class TextFieldCustom extends StatefulWidget {
  Text? text;
  Function? onChanged;
  Function? onSaved;
  TextEditingController? controller;
  Icon? customIcon;
  dynamic customIconSuffix;
  bool? notefield;
  Color? color;
  Function()? onTap;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  Function(String)? onValidator;
  bool? obscureText;
  String? initialValue;
  bool? readOnly;
  int? maxLength;
  InputDecoration? decoration;
  bool? showText;
  bool? enabled;
  TextFieldCustom(
      {Key? key,
      this.customIcon,
      this.customIconSuffix,
      this.color,
      this.onValidator,
      this.onTap,
      this.onSaved,
      this.keyboardType,
      this.inputFormatters,
      this.text,
      this.onChanged,
      this.controller,
      this.initialValue,
      this.notefield,
      this.readOnly,
      this.maxLength,
      this.decoration,
      this.showText,
      this.obscureText,
      this.enabled})
      : super(key: key);

  @override
  State createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: TextFormField(
        controller: widget.controller,
        onChanged: (newValue) {
          _setCursorToEnd();
        },
        decoration: widget.decoration ??
            InputDecoration(
              label: Text(
                widget.text!.data!,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.015,
                  color:
                      widget.color ?? const Color.fromARGB(255, 114, 119, 123),
                ),
              ),
              labelStyle: TextStyle(
                color: widget.color ?? const Color.fromARGB(255, 114, 119, 123),
              ),
              floatingLabelAlignment: FloatingLabelAlignment.start,
              prefixIcon: widget.showText == false ? null : widget.customIcon,
              suffixIcon:
                  widget.showText == true ? null : widget.customIconSuffix,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              constraints: BoxConstraints.tightFor(
                width: MediaQuery.of(context).size.width * 0.007,
              ),
            ),
        inputFormatters: widget.inputFormatters,
        onSaved: (value) => widget.onSaved,
        obscureText: widget.obscureText ?? false,
        initialValue: widget.initialValue,
        maxLength: widget.maxLength,
        readOnly: widget.readOnly ?? false,
        keyboardType: widget.keyboardType,
        enabled: widget.enabled ?? true,
      ),
    );
  }

  void _setCursorToEnd() {
    final textLength = widget.controller?.text.length ?? 0;
    widget.controller?.selection = TextSelection.fromPosition(
      TextPosition(offset: textLength),
    );
  }
}
