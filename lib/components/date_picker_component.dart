import 'package:flutter/material.dart';
import 'package:login_example/components/text_field_custom.dart';

class DatePickerComponent extends StatefulWidget {
  final String hint;
  Function? onSaved;

  final TextEditingController controller;
  final Function(DateTime picked)? onDatePicked;
  Function(String)? onValidator;

  DatePickerComponent(
      {Key? key,
      required this.hint,
      this.onSaved,
      required this.controller,
      required this.onDatePicked,
      this.onValidator})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DatePickerComponentState createState() => _DatePickerComponentState();
}

class _DatePickerComponentState extends State<DatePickerComponent> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2015, 8),
              lastDate: DateTime(2101),
            );
            if (picked != null && widget.onDatePicked != null) {
              widget.onDatePicked!(picked);
            }
          },
          child: TextFieldCustom(
            controller: widget.controller,
            onValidator: (text) =>
                widget.onValidator == null ? null : widget.onValidator!(text!),
            onSaved: (value) => widget.onSaved,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015, 8),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && widget.onDatePicked != null) {
                    widget.onDatePicked!(picked);
                  }
                },
                icon: const Icon(Icons.date_range),
                color: const Color(0xff4448AE),
              ),
              filled: true,
              fillColor: const Color(0xffF8F7FD),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: const Color(0xff4448AE),
                fontSize: height * 0.018,
              ),
            ),
            enabled: false,
          ),
        ),
      ),
    );
  }
}
