
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'DecimalInputFormatter.dart';

class PriceField extends StatefulWidget {
  TextEditingController controller;
  String label;
  Function(String value)? onChanged;

  PriceField({
    super.key,
    required this.controller,
    required this.label,
    this.onChanged,
  });

  @override
  State<PriceField> createState() => _PriceFieldState();
}

class _PriceFieldState extends State<PriceField> {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.controller.text.isEmpty) {
    //   String textInput = CurrencyTextInputFormatter(
    //     locale: 'en',
    //     decimalDigits: 0,
    //     symbol: '₪',
    //   ).format('0');
    //   widget.controller.text = textInput;
    // }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.12,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TextFormField(
          textInputAction: TextInputAction.none,
          keyboardType: TextInputType.none,
          autofocus: true,
          controller: widget.controller,
          onTap: () {
            // showDialog(
            //   // barrierDismissible: false,
            //   barrierColor: Colors.transparent,
            //   context: context,
            //   builder: (context) {
            //     return NumericInputKeyboard(
            //       textController: widget.controller,
            //       // validator: validateNumber,
            //       errorText: _local.inputError,
            //       labelText: widget.label,
            //       isPriceField: true,
            //       onChanged: (value) {
            //         if (widget.onChanged != null) {
            //           widget.onChanged!(value);
            //         }
            //       },
            //     );
            //   },
            // );
          },
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: MediaQuery.of(context).size.height * 0.015),
          decoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            labelText: widget.label,
            hintText: "₪0",
            labelStyle:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.015),
            prefixIcon: const Icon(Icons.monetization_on_rounded),
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 3),
              borderRadius:
                  BorderRadius.circular(10), //circular border for TextField.
            ),
            constraints: BoxConstraints.tightFor(
                width: MediaQuery.of(context).size.width * 0.15),
          ),
          // Remove CurrencyTextInputFormatter from inputFormatters
          inputFormatters: [
            DecimalInputFormatter(),
            LengthLimitingTextInputFormatter(9)
          ],
          // Use TextInputType.numberWithOptions(decimal: true) to allow decimal input
          // keyboardType: TextInputType.numberWithOptions(decimal: true),
        ),
      ),
    );
  }
}
