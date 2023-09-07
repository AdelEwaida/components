import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/city_controller.dart';
import '../controllers/patrol_revenue_controller.dart';
import '../models/city.dart';
import '../models/patrol_revenue_model.dart';
import '../providers/table_provider.dart';

/* This Table Component used for data with edit, delete, and view data.
    This table is Support Responsive, Lazy Loading, Auto-Refresh, (edit, delete, and view data),
    and takes any type of List (List<dynamic>)
    */

class DataTableWidget extends StatefulWidget {
  dynamic list;
  String objectType;
  DataTableWidget({
    super.key,
    required this.list,
    required this.objectType,
  });

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  /* The controllers that we need to use for edit,add,delete, and view the data
   PatrolRevenueController patrolController = PatrolRevenueController();
   CityController cityController = CityController();
  */
  final ScrollController controller = ScrollController();
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;
  dynamic list = [];
  @override
  void initState() {
    super.initState();
    list = widget.list;
    _loadData();
    _scrollController.addListener(_scrollListener);
  }

/* Listener for load more data with scrolling (Lazy Loading) */
  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return SizedBox(
          // height: MediaQuery.of(context).size.height * 0.55,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: Scrollbar(
              thickness: 20,
              controller: controller,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child:
                    // context.read<TableProvider>().getList().isEmpty
                    //     ? const Center(child: const CircularProgressIndicator())
                    //     :
                    DataTable(
                  columns: [
                    ...list.isNotEmpty
                        ? list.first.toJson().keys.map<DataColumn>(
                            (String key) {
                              return DataColumn(
                                label: Text(
                                  key,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ).toList()
                        : [],
                    DataColumn(
                        label: Row(
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                            color: Color(0xff4448AE),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                            color: Color(0xff4448AE),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                            color: Color(0xff4448AE),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                    // const DataColumn(
                    //   label: Text(
                    //     '',
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    // const DataColumn(
                    //   label: Text(
                    //     '',
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                  ],
                  rows: List<DataRow>.generate(list.length, (index) {
                    final backgroundColor = index % 2 == 0
                        ? Color.fromARGB(255, 226, 224, 237)
                        : Colors.white;
                    var model = list[index];
                    print("");
                    return DataRow(
                      color: MaterialStateColor.resolveWith(
                          (states) => backgroundColor),
                      cells: [
                        ...model.toJson().values.map<DataCell>((dynamic value) {
                          return DataCell(Text("$value"));
                        }).toList(),
                        DataCell(Row(
                          children: [
                            IconButton(
                              // Adding the IconButton for viewing
                              onPressed: () {
                                // Implement your logic for viewing here
                                /* if statement to know the model that we need to use.
                                        Show dialog and delete the item
                                        we use fetchData() function for auto-refresh
                                            */
                              },
                              icon: const Icon(Icons
                                  .visibility), // You can change the icon as needed
                            ),
                            IconButton(
                              onPressed: () {
                                // Adding the IconButton for edit
                                /* if statement to know the model that we need to use.
                                        Show dialog and after fill the form to edit data
                                        we use fetchData() function for auto-refresh
                                            */
                              },
                              icon: const Icon(
                                Icons.edit,
                              ),
                            ),
                            IconButton(
                              // Adding the IconButton for delete
                              onPressed: () {
                                /* if statement to know the model that we need to use.
                                        Show dialog and delete the item
                                        we use fetchData() function for auto-refresh
                                            */
                              },
                              color: Colors.red,
                              icon: const Icon(
                                Icons.delete,
                              ),
                            )
                          ],
                        )),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );

    // dynamicTable(_patrolList),
  }

  void emptyTable() {
    _currentPage = 0;
    list = [];
    context.read<TableProvider>().setList([]);
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

  Future<void> _loadData() async {
    /* if statement to know the model that we need to use.
          for fetch data
    */

    // Example :

    /*  if (widget.objectType == "Patrol") {
    List<PatrolRevenueModel> newData =
          await PatrolRevenueController().getPatrolRevenueSubData(_currentPage);
      if (newData.isEmpty) {
      } else if (newData.isNotEmpty) {
        list.addAll(newData);
        _currentPage++;
        context.read<TableProvider>().setList(list);
      } 
     } */
  }
}
