import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
  TextEditingController controller;
  bool isFromTrans;
  DateField({Key? key, required this.controller, required this.isFromTrans})
      : super(key: key);

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (dayController.text.length == 1) {
      dayController.text = "0${dayController.text}";
    }
    if (monthController.text.length == 1) {
      monthController.text = "0${monthController.text}";
    }
    if (dayController.text.length == 2 &&
        monthController.text.length == 2 &&
        yearController.text.length == 4) {
      widget.controller.text =
          '${yearController.text}-${monthController.text}-${dayController.text}';
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    dayController.addListener(dayTextChanged);
    monthController.addListener(monthTextChanged);
    yearController.addListener(yearTextChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.text.isNotEmpty) {
      DateTime formattedDate =
          DateFormat('yyyy-MM-dd').parse(widget.controller.text);
      dayController.text = DateFormat('dd').format(formattedDate);
      monthController.text = DateFormat('MM').format(formattedDate);
      yearController.text = DateFormat('yyyy').format(formattedDate);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.05,
            maxHeight: MediaQuery.of(context).size.height * 0.07,
          ),
          child: TextFormField(
            onTap: () {
              // showDialog(
              //   barrierColor: Colors.transparent,
              //   context: context,
              //   builder: (context) {
              //     return DateInputKeyboard(
              //       textController: dayController,
              //       errorText: _local.inputError,
              //       labelText: _local.dayLabel,
              //       maxLength: 2,
              //     );
              //   },
              // );
            },
            textInputAction: TextInputAction.next,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.015),
            decoration: InputDecoration(
              floatingLabelAlignment: FloatingLabelAlignment.center,
              labelText: "D",
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 3),
                borderRadius:
                    BorderRadius.circular(10), //circular border for TextField.
              ),
            ),
            controller: dayController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],
            onChanged: (value) {},
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        Text(
          "/",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.015,
              fontWeight: FontWeight.bold,
              color: Colors.grey),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.05,
            maxHeight: MediaQuery.of(context).size.height * 0.07,
          ),
          child: TextFormField(
            onTap: () {
              // showDialog(
              //   barrierColor: Colors.transparent,
              //   context: context,
              //   builder: (context) {
              //     return DateInputKeyboard(
              //       textController: monthController,
              //       errorText: _local.inputError,
              //       labelText: _local.monthLabel,
              //       maxLength: 2,
              //     );
              //   },
              // );
            },
            textInputAction: TextInputAction.next,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.015),
            decoration: InputDecoration(
              floatingLabelAlignment: FloatingLabelAlignment.center,
              labelText: "M",
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            controller: monthController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],
            onChanged: (value) {},
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        Text(
          "/",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.015,
              fontWeight: FontWeight.bold,
              color: Colors.grey),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.05,
            maxHeight: MediaQuery.of(context).size.height * 0.07,
          ),
          child: TextFormField(
              onTap: () {
                // showDialog(
                //   barrierColor: Colors.transparent,
                //   context: context,
                //   builder: (context) {
                //     return DateInputKeyboard(
                //       textController: yearController,
                //       // validator: validateNumber,
                //       errorText: _local.inputError,
                //       labelText: _local.yearLabel,
                //       maxLength: 4,
                //     );
                //   },
                // );
              },
              textInputAction: TextInputAction.next,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.015),
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelText: "Y",
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: yearController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
              onEditingComplete: () {}),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.001),
        IconButton(
          iconSize: MediaQuery.of(context).size.width * 0.01,
          icon: const Icon(Icons.calendar_month_outlined),
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                context: context,
                initialDate: DateTime.now(),
                firstDate: widget.isFromTrans ? DateTime(1950) : DateTime.now(),
                lastDate: DateTime(2101));

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              widget.controller.text = formattedDate;
              setState(() {
                dayController.text = DateFormat('dd').format(pickedDate);
                monthController.text = DateFormat('MM').format(pickedDate);
                yearController.text = DateFormat('yyyy').format(pickedDate);
              });
            }
          },
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.001),
        IconButton(
          onPressed: () {
            dayController.clear();
            monthController.clear();
            yearController.clear();
          },
          icon: const Icon(Icons.clear_rounded),
          iconSize: MediaQuery.of(context).size.width * 0.01,
        )
      ],
    );
  }

  void dayTextChanged() {
    final value = dayController.text;
    if (int.parse(value) > 31) {
      showDialogError("The maximum number of days in a month is 31");
      dayController.text = '31';
    }
    if (value.length == 2) {
      if (int.parse(value) == 0) {
        showDialogError("Please enter a valid day");
        dayController.text = "01";
      }
    }
  }

  // void monthTextChanged() {
  //   final value = monthController.text;
  //   if (int.parse(value) > 12) {
  //     showDialogError(_local.monthsError);
  //     monthController.text = '12';
  //   }
  //   if (value.length == 2) {
  //     if (int.parse(value) == 0) {
  //       showDialogError(_local.validMonth);
  //       monthController.text = "01";
  //     }
  //     if ((int.parse(value) == 4 ||
  //             int.parse(value) == 6 ||
  //             int.parse(value) == 8 ||
  //             int.parse(value) == 10 ||
  //             int.parse(value) == 12) &&
  //         int.parse(dayController.text) > 30) {
  //       showDialogError(_local.validDate);
  //       dayController.text = "30";
  //     }
  //     if ((int.parse(monthController.text) == 2) &&
  //         (int.parse(dayController.text) > 28)) {
  //       if ((int.parse(value) % 4) == 0) {
  //         showDialogError(_local.leapError);
  //         dayController.text = "28";
  //       } else {
  //         showDialogError(_local.febError);
  //         dayController.text = "29";
  //       }
  //     }
  //   }
  // }

  void monthTextChanged() {
    final value = monthController.text;
    if (int.tryParse(value) != null) {
      int month = int.parse(value);
      if (month > 12) {
        showDialogError("The maximum number of months in a year is 12");
        monthController.text = '12';
      } else if (value.length == 2) {
        if (month == 0) {
          showDialogError("Please enter a valid month");
          monthController.text = '01';
        } else {
          int day = int.parse(dayController.text);
          if ((month == 2) && (day > 28)) {
            bool isLeap = (int.parse(yearController.text) % 4) == 0;
            showDialogError(isLeap
                ? "The entered year is not a leap year. February cannot have 29 days."
                : "The maximum number of days in February are 29");
            dayController.text = isLeap ? '28' : '29';
          } else if (((month == 4) ||
                  (month == 6) ||
                  (month == 9) ||
                  (month == 11)) &&
              (day > 30)) {
            showDialogError("Please enter a valid date");
            dayController.text = '30';
          }
        }
      }
    }
  }

  void yearTextChanged() {
    final value = yearController.text;
    String year = DateFormat('yyyy').format(DateTime.now());
    if (value.length == 4) {
      // FocusScope.of(context).nextFocus();
      if (int.parse(value) > 2100) {
        showDialogError("The maximum number of years is 2100");
        yearController.text = year;
      }
      if (int.parse(value) < 1950) {
        showDialogError("The minimum number of years is 1950");
        yearController.text = "1950";
      }
    }
  }

  void showDialogError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.red,
          title: Text(
            "Error Message",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            errorMessage,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                "Ok",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
