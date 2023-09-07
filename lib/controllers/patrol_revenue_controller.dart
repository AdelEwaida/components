import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/patrol_revenue_model.dart';

class PatrolRevenueController {
  static const serverURL = "Your Server URL";

  // ErrorController errorController = ErrorController();
  List<PatrolRevenueModel> patrolRevenueList = [];

  Future getAllPatrolRevenues() async {
    const api = 'patrol/getAll';
    var response = await http.get(Uri.parse("$serverURL/$api"));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    for (var patrol in jsonData) {
      patrolRevenueList.add(PatrolRevenueModel.fromJson(patrol));
    }
    // if (response.statusCode != 200) {
    //   ErrorController.openErrorDialog(response.statusCode, response.body);
    // }

    if (kDebugMode) {
      print("getAllPatrolRevenueResponse= ${response.statusCode}");
    }
    return patrolRevenueList;
  }

  Future getPatrolRevenueSubData(int page) async {
    var api = "patrol/page/$page";
    var response = await http.get(Uri.parse("$serverURL$api"));
    print("$serverURL/$api");
    print(response.statusCode);
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    for (var patrol in jsonData) {
      patrolRevenueList.add(PatrolRevenueModel.fromJson(patrol));
    }
    // if (response.statusCode != 200) {
    //   ErrorController.openErrorDialog(response.statusCode, response.body);
    // }

    if (kDebugMode) {
      print("getSublistPatrolRevenueResponse= ${response.statusCode}");
    }
    return patrolRevenueList;
  }

  // Future insertPatrolRevenue(PatrolRevenueModel patrolRevenueModel) async {
  //   const api = '$patrolAPI/$insert';
  //   var response = await http.post(Uri.parse("$serverURL/$api"),
  //       headers: {
  //         "Accept": "application/json",
  //         "content-type": "application/json"
  //       },
  //       body: jsonEncode(patrolRevenueModel.toJson()));

  //   // if (response.statusCode != 200) {
  //   //   ErrorController.openErrorDialog(response.statusCode, response.body);
  //   // }

  //   if (kDebugMode) {
  //     print("insertPatrolRevenueResponse= ${response.statusCode}");
  //   }
  //   return response.statusCode;
  // }

  // Future updatePatrolRevenue(PatrolRevenueModel patrolRevenueModel) async {
  //   const api = '$patrolAPI/$update';
  //   var response = await http.post(Uri.parse("$serverURL/$api"),
  //       headers: {
  //         "Accept": "application/json",
  //         "content-type": "application/json"
  //       },
  //       body: jsonEncode(patrolRevenueModel.toJson()));

  //   // if (response.statusCode != 200) {
  //   //   ErrorController.openErrorDialog(response.statusCode, response.body);
  //   // }

  //   if (kDebugMode) {
  //     print("updatePatrolRevenueResponse= ${response.statusCode}");
  //   }
  //   return response.statusCode;
  // }

  // Future deletePatrolRevenue(PatrolRevenueModel patrolRevenueModel) async {
  //   var api = "$patrolAPI/$delete";
  //   var response = await http.post(Uri.parse("$serverURL/$api"),
  //       headers: {
  //         "Accept": "application/json",
  //         "content-type": "application/json"
  //       },
  //       body: jsonEncode(patrolRevenueModel.toJson()));

  //   // if (response.statusCode != 200) {
  //   //   ErrorController.openErrorDialog(response.statusCode, response.body);
  //   // }

  //   if (kDebugMode) {
  //     print("deletePatrolRevenuesResponse= ${response.statusCode}");
  //   }
  //   print("Delete Response ${response.statusCode}");
  //   return response.statusCode;
  // }
}
