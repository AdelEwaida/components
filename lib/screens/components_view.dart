import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:login_example/components/app_utils.dart';
import 'package:login_example/models/city.dart';

import '../components/NumberField.dart';
import '../components/custom_drop_down.dart';
import '../components/datatable_component.dart';
import '../components/date_picker_component.dart';
import '../components/date_text_field.dart';
import '../components/dropdown_component.dart';
import '../components/lite_rolling_switch.dart';
import '../components/price_field.dart';
import '../components/text_field_custom.dart';

class ComponentsView extends StatefulWidget {
  const ComponentsView({super.key});

  @override
  State<ComponentsView> createState() => _ComponentsViewState();
}

class _ComponentsViewState extends State<ComponentsView> {
  Components components = Components();
  final List<CityModel> jsonData = [
    CityModel(txtCode: "001", txtName: "Mostafa"),
    CityModel(txtCode: "002", txtName: "Ahmad"),
    CityModel(txtCode: "003", txtName: "Mahmoud"),
    CityModel(txtCode: "004", txtName: "Mohammad"),
  ];
  TextEditingController discount = TextEditingController();

  bool obscure1 = true;
  TextEditingController textController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController addDateController = TextEditingController();
  TextEditingController chequeDate = TextEditingController();

  String city = "";
  TextEditingController sController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Componets View"),
        automaticallyImplyLeading: false,
      ),
      body: Row(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                  height: height * 0.3,
                  child: DataTableWidget(
                    objectType: "Your Model Type",
                    list: jsonData,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextFieldCustom(
                  text: const Text("Text"),
                  controller: textController,
                  // decoration: InputDecoration(
                  //   labelText: _local.email,
                  // ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextFieldCustom(
                  text: const Text("Email"),
                  controller: emailController,
                  // decoration: InputDecoration(
                  //   labelText: _local.email,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextFieldCustom(
                  text: const Text("Password"),
                  obscureText: obscure1,
                  controller: passController,
                  customIconSuffix: GestureDetector(
                    onTap: () {
                      obscure1 = !obscure1;
                      setState(() {});
                    },
                    child: Icon(
                      obscure1
                          ? CupertinoIcons.eye_slash_fill
                          : CupertinoIcons.eye,
                      color: const Color.fromARGB(255, 31, 29, 29),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            NumberField(
              controller: discount,
              labelText: "Discount *",
              isDicemal: false,
              maxValue: 99,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            PriceField(
              controller: sController,
              label: "Price",
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child:
                      // dynamicTable(_patrolList)
                      DropdownComponent(
                          list: jsonData, objectType: "objectType")),
            ),
            CustomDropDown(
              items: jsonData,
              onValidator: (value) {
                if (city.isEmpty) {
                  return "reqField";
                }
                return null;
              },
              onChanged: (value) async {
                setState(() {
                  city = value;
                });
              },
              hint: "City Name",
            ),
            SizedBox(
              height: height * 0.02,
            ),
            components.bigButton(
              width: 150,
              onPressed: () {},
              text: "Login",
              borderRadius: 30.0,
              fontSize: 16.0,
              textColor: Colors.white,
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: width * 0.2,
              child: DatePickerComponent(
                onValidator: (text) {
                  if (text.isEmpty) {
                    return "Required Field";
                  }
                  return null;
                },
                hint: "Add Date",
                controller: addDateController,
                onDatePicked: (DateTime picked) {
                  String day = "${picked.day}",
                      month = "${picked.month}",
                      year = "${picked.year}";
                  if (picked.day < 10) {
                    day = "0$day";
                  }
                  if (picked.month < 10) {
                    month = "0$month";
                  }
                  addDateController.text = "$year-$month-$day";
                },
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            DateField(controller: chequeDate, isFromTrans: false),
            SizedBox(
              height: height * 0.02,
            ),
            LightRollingSwitch(onS: "Validate age", offS: "No Age"),
          ],
        )
      ]),
    );
  }
}
