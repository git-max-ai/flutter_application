import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'dart:convert';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Coding";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson); //decode json from string to map(key value)
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
      .map<Item>((item) => Item.fromMap(item))
      .toList();
    setState(() {});
    print(productsData);
  }

  @override
  Widget build(BuildContext context) {

    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);


    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty) 
            ? ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) => ItemWidget(
                item:CatalogModel.items[index],
              ),
            )
          : Center(
            child: CircularProgressIndicator(),
          ),
        ),
        drawer: MyDrawer(),
      );
  }
}