// ignore_for_file: unused_import, avoid_print

import 'dart:convert';

import 'package:assignment06/model/book_data.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  RxList<Book> listBook = <Book>[].obs;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('book.json');
    Map<String, dynamic> bookJSON = json.decode(response);
    List<dynamic> result = bookJSON["books"];
    listBook.assignAll(result.map((json) => Book.fromJson(json)).toList());
  }
}
