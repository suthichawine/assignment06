// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assignment06/controller/book_controller.dart';
import 'package:assignment06/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';



class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BookController myController = Get.put(BookController());
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Ionicons.book),
        title: Text("BooK JSON Data"),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            myController.readJson();
          }, child: Text("View Book"))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (value) {
          if (value == 0) {
            // Get.to(MainPage());
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Ionicons.book_sharp), label: "BooK"),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.grid_outline), label: "Product"),
        ],
      ),
    );
  }
}