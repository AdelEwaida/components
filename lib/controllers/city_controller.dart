import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/city.dart';

class CityController {
  static const serverURL = "Your Server URL";

  List<CityModel> cityList = [];

  Future getAllChargingList() async {
    const api = 'city/getAll';
    var response = await http.get(Uri.parse("$serverURL/$api"));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    for (var city in jsonData) {
      cityList.add(CityModel.fromJson(city));
    }
    if (response.statusCode != 200) {}

    if (kDebugMode) {
      print("getAllCityListResponse= ${response.statusCode}");
    }
    return cityList;
  }

  Future getCityListSubData(int page) async {
    var api = 'city/page/$page';
    var response = await http.get(Uri.parse("$serverURL/$api"));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    for (var city in jsonData) {
      cityList.add(CityModel.fromJson(city));
    }
    // if (response.statusCode != 200) {
    //   ErrorController.openErrorDialog(response.statusCode, response.body);
    // }

    if (kDebugMode) {
      print("getSublistCityListResponse= ${response.statusCode}");
    }
    return cityList;
  }

  // Future insertCity(CityModel cityModel) async {
  //   const api = '$cityAPI/$insert';
  //   var response = await http.post(Uri.parse("$serverURL/$api"),
  //       headers: {
  //         "Accept": "application/json",
  //         "content-type": "application/json"
  //       },
  //       body: jsonEncode(cityModel.toJson()));

  //   // if (response.statusCode != 200) {
  //   //   ErrorController.openErrorDialog(response.statusCode, response.body);
  //   // }

  //   if (kDebugMode) {
  //     print("insertCityResponse= ${response.statusCode}");
  //   }
  //   return response.statusCode;
  // }

  // Future updateCity(CityModel cityModel) async {
  //   const api = '$cityAPI/$update';
  //   print("$serverURL/$api");
  //   print("----------------");
  //   print(cityModel.toJson());
  //   print(jsonEncode(cityModel.toJson()));
  //   var response = await http.post(Uri.parse("$serverURL/$api"),
  //       headers: {
  //         "Accept": "application/json",
  //         "content-type": "application/json"
  //       },
  //       body: jsonEncode(cityModel.toJson()));

  //   // if (response.statusCode != 200) {
  //   //   ErrorController.openErrorDialog(response.statusCode, response.body);
  //   // }

  //   if (kDebugMode) {
  //     print("updateCityResponse= ${response.statusCode}");
  //   }
  //   return response.statusCode;
  // }

  // Future deleteCity(CityModel cityModel) async {
  //   var api = '$cityAPI/$delete';
  //   var response = await http.post(Uri.parse("$serverURL/$api"),
  //       headers: {
  //         "Accept": "application/json",
  //         "content-type": "application/json"
  //       },
  //       body: jsonEncode(cityModel.toJson()));

  //   // if (response.statusCode != 200) {
  //   //   ErrorController.openErrorDialog(response.statusCode, response.body);
  //   // }

  //   if (kDebugMode) {
  //     print("deleteCityResponse= ${response.statusCode}");
  //   }
  //   return response.statusCode;
  // }
}
