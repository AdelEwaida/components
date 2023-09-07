import 'package:flutter/material.dart';

class TableProvider extends ChangeNotifier {
  dynamic list = [];
  int currentPage = 0;

  setList(dynamic newList) {
    list.addAll(newList);
    notifyListeners();
  }
  getList() {
    return list;
  }
  setCurrentPage(int count){
    currentPage = count;
    notifyListeners();
  }
  getCurrentPage(){
    return currentPage;
  }
}
