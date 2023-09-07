import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_example/components/text_field_custom.dart';

import 'DecimalInputFormatter.dart';


class NumberField extends StatefulWidget {
  TextEditingController controller;
  String labelText;
  Icon? fieldIcon;
  int? length;
  bool isDicemal;
  int? maxValue;
  int? minValue;
  final void Function(bool)? enterPressed;
  final void Function()? onSubmitted;

  NumberField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.maxValue,
      this.minValue,
      this.fieldIcon,
      this.length,
      required this.isDicemal,
      this.enterPressed,
      this.onSubmitted});

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {

  String handleErrorText = "";
  @override
  void didChangeDependencies() {
    // if (widget.controller.text.isEmpty) {
    //   widget.controller.text = widget.isDicemal == false ? "00" : "0.0";
    // }
    // widget.controller.text = "";
    super.didChangeDependencies();
  }

  void _updateText(String newText) {
    setState(() {
      handleErrorText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.13,
          child: TextFieldCustom(
            onTap: () {
              // showDialog(
              //   // barrierDismissible: false,
              //   barrierColor: Colors.transparent,
              //   context: context,
              //   builder: (context) {
              //     return widget.labelText.compareTo(_local.closeShift) == 0
              //         ? NumericInputKeyboard(
              //             textController: widget.controller,
              //             validator: validateNumber,
              //             errorText: _local.inputError,
              //             labelText: widget.labelText,
              //             isPriceField: false,
              //             isDecimal: widget.isDicemal,
              //             isCurrency: widget.isDicemal ? true : false,
              //             onChanged: _updateText,
              //             enterPressed: widget.enterPressed,
              //           )
              //         : NumericInputKeyboard(
              //             textController: widget.controller,
              //             validator: validateNumber,
              //             errorText: _local.inputError,
              //             labelText: widget.labelText,
              //             isPriceField: false,
              //             isDecimal: widget.isDicemal,
              //             isCurrency: widget.isDicemal ? true : false,
              //             onChanged: _updateText,
              //           );
              //   },
              // );
            },
            //   textAlign: TextAlign.center,
            // decoration: InputDecoration(
            //   helperText: handleErrorText,
            //   helperStyle: const TextStyle(
            //       fontWeight: FontWeight.bold, color: Colors.red),
            //   floatingLabelAlignment: FloatingLabelAlignment.center,
            //   // labelText: widget.labelText,
            //   label: widget.labelText == ""
            //       ? SizedBox()
            //       : Center(
            //           child: Text(widget.labelText),
            //         ),
            //   prefixIcon: widget.fieldIcon,
            //   border: OutlineInputBorder(
            //     borderSide: const BorderSide(width: 3),
            //     borderRadius:
            //         BorderRadius.circular(10), //circular border for TextField.
            //   ),
            //   // constraints: BoxConstraints.tightFor(
            //   //     width: MediaQuery.of(context).size.width * 0.10),
            // ),
            controller: widget.controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              DecimalInputFormatter(),
              LengthLimitingTextInputFormatter(9)
            ],
            // onFieldSubmitted: (value) {
            //   widget.onSubmitted;
            // },
            onChanged: (value) {
              int newValue = int.parse(value);

              if (widget.maxValue != -1) {
                if (newValue > widget.maxValue!) {
                  _updateText('${"Value"} > ${widget.maxValue}');
                  widget.controller.text = "${widget.maxValue}";
                } else if (newValue < widget.maxValue!) {
                  _updateText('');
                }
              }
              if (widget.minValue != -1) {
                if (newValue < widget.minValue!) {
                  _updateText('${"Input Number is Smaller than"} ${widget.minValue}');
                  widget.controller.clear();
                }
              }
            },
            text: Text(widget.labelText),
          ),
          // child: TextFormField(
          //     onTap: () {
          //       showDialog(
          //         // barrierDismissible: false,
          //         barrierColor: Colors.transparent,
          //         context: context,
          //         builder: (context) {
          //           return widget.labelText.compareTo(_local.closeShift) == 0
          //               ? NumericInputKeyboard(
          //                   textController: widget.controller,
          //                   validator: validateNumber,
          //                   errorText: _local.inputError,
          //                   labelText: widget.labelText,
          //                   isPriceField: false,
          //                   isDecimal: widget.isDicemal,
          //                   isCurrency: widget.isDicemal ? true : false,
          //                   onChanged: _updateText,
          //                   enterPressed: widget.enterPressed,
          //                 )
          //               : NumericInputKeyboard(
          //                   textController: widget.controller,
          //                   validator: validateNumber,
          //                   errorText: _local.inputError,
          //                   labelText: widget.labelText,
          //                   isPriceField: false,
          //                   isDecimal: widget.isDicemal,
          //                   isCurrency: widget.isDicemal ? true : false,
          //                   onChanged: _updateText,
          //                 );
          //         },
          //       );
          //     },
          //     textAlign: TextAlign.center,
          //     decoration: InputDecoration(
          //       helperText: handleErrorText,
          //       helperStyle: const TextStyle(
          //           fontWeight: FontWeight.bold, color: Colors.red),
          //       floatingLabelAlignment: FloatingLabelAlignment.center,
          //       // labelText: widget.labelText,
          //       label: widget.labelText == ""
          //           ? SizedBox()
          //           : Center(
          //               child: Text(widget.labelText),
          //             ),
          //       prefixIcon: widget.fieldIcon,
          //       border: OutlineInputBorder(
          //         borderSide: const BorderSide(width: 3),
          //         borderRadius: BorderRadius.circular(
          //             10), //circular border for TextField.
          //       ),
          //       // constraints: BoxConstraints.tightFor(
          //       //     width: MediaQuery.of(context).size.width * 0.10),
          //     ),
          //     controller: widget.controller,
          //     keyboardType: TextInputType.number,
          //     inputFormatters: [
          //       LengthLimitingTextInputFormatter(widget.length),
          //       widget.isDicemal
          //           ? FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
          //           : FilteringTextInputFormatter.digitsOnly,
          //     ],
          //     onFieldSubmitted: (value) {
          //       widget.onSubmitted;
          //     },
          //     onChanged: (value) {
          //       int newValue = int.parse(value);

          //       if (widget.maxValue != -1) {
          //         if (newValue > widget.maxValue!) {
          //           _updateText('${_local.value} > ${widget.maxValue}');
          //           widget.controller.text = "${widget.maxValue}";
          //         } else if (newValue < widget.maxValue!) {
          //           _updateText('');
          //         }
          //       }
          //       if (widget.minValue != -1) {
          //         if (newValue < widget.minValue!) {
          //           _updateText('${_local.numSmaller} ${widget.minValue}');
          //           widget.controller.clear();
          //         }
          //       }
          //     }),
        ),
      ],
    );
  }

  Future<bool> validateNumber(String str) async {
    return str.length > 4;
  }
}
