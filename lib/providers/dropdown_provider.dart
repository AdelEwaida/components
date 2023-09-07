import 'package:flutter/material.dart';

class DropDownProvider with ChangeNotifier{
  dynamic list = [];

  setList(dynamic newList) {
    list.addAll(newList);
    notifyListeners();
  }

  getList() {
    return list;
  }
}
