import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/list_items.dart';
import 'package:flutter_application_1/models/shopping_list.dart';
import 'package:flutter_application_1/util/dbhelper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DbHelper helper=DbHelper();
    // helper.testDb();
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const ShList(),
      ),
    );
  }
}

class ShList extends StatefulWidget {
  const ShList({Key? key}) : super(key: key);

  @override
  State<ShList> createState() => _ShListState();
}

class _ShListState extends State<ShList> {
  List<ShoppingList>? shoppingList;
  DbHelper helper = DbHelper();
  @override
  Widget build(BuildContext context) {
    showData();
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(
              shoppingList![index].priority.toString(),
            ),
          ),
          title: Text(shoppingList![index].name),
        );
      },
      itemCount: (shoppingList != null) ? shoppingList!.length : 0,
    );
  }

  Future showData() async {
    await helper.openDb();
    shoppingList = await helper.getLists();
    setState(() {
      shoppingList = shoppingList;
    });
    // ShoppingList list = ShoppingList(0, "Bakert", 2);
    // int listId = await helper.insertList(list);
    // ListItem item = ListItem(0, listId, "Bread", "1Kg", "note");
    // int itemId = await helper.insertItem(item);
    // print(listId.toString());
    // print(itemId.toString());
  }
}
