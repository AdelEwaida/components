import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/city_controller.dart';
import '../models/city.dart';
import '../providers/dropdown_provider.dart';

/* This DropDown Component,
    Supports Lazy Loading,
    and takes any type of List (List<dynamic>).
    */

class DropdownComponent extends StatefulWidget {
  dynamic list;
  String objectType;
  DropdownComponent({super.key, required this.list, required this.objectType});

  @override
  State<DropdownComponent> createState() => _DropdownComponentState();
}

class _DropdownComponentState extends State<DropdownComponent> {
  String dropdownvalue = "";
  var _currentPage = 0;
  final ScrollController _scrollController = ScrollController();
  dynamic list = [];
  bool isListExpanded = false;

  // List of items in our dropdown menu
  @override
  void initState() {
    super.initState();
    // _loadData();
    list = widget.list;
    _scrollController.addListener(_scrollListener);
  }

// When Scroll load more data for (Lazy Loading)
  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DropDownProvider>(
      builder: (context, value, child) {
        return Scaffold(
            body:
                // context.read<DropDownProvider>().getList().isEmpty
                //     ? const CircularProgressIndicator()
                //     :
                SizedBox(
          width: MediaQuery.of(context).size.width < 800
              ? MediaQuery.of(context).size.width * 0.3
              : MediaQuery.of(context).size.width * 0.14,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isListExpanded = !isListExpanded;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(dropdownvalue),
                      Icon(isListExpanded
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isListExpanded,
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        /* if statement to know the model that we need to use.
                        Example:
                        if (widget.objectType == "City") {}
                                            */
                        CityModel model = CityModel();
                        model = list[index] as CityModel;
                        print(model.txtCode);

                        return ListTile(
                          title: Text("${model.txtName}"),
                          onTap: () {
                            setState(() {
                              dropdownvalue = "${model.txtName}";
                              isListExpanded = !isListExpanded;
                              print(dropdownvalue);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
      },
    );
  }

  void emptyTable() {
    _currentPage = 0;
    list = [];
    context.read<DropDownProvider>().setList([]);
  }

  void fetchData() {
    emptyTable();
    _loadData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

/* This function is for load data from api by paging (Lazy Loading)  */
  Future<void> _loadData() async {
    List<CityModel> newData =
        await CityController().getCityListSubData(_currentPage);
    if (newData.isEmpty) {
    } else if (newData.isNotEmpty) {
      setState(() {
        list.addAll(newData);
        _currentPage++;
      });
      context.read<DropDownProvider>().setList(list);
    }
  }
}
