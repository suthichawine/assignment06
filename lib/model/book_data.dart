import 'package:flutter/widgets.dart';

// To parse this JSON data, do
//
//     final books = booksFromJson(jsonString);

import 'dart:convert';

Books booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books data) => json.encode(data.toJson());

class Books {
    List<Book> books;

    Books({
        required this.books,
    });

    factory Books.fromJson(Map<String, dynamic> json) => Books(
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
    };
}

class Book {
    String isbn;
    String title;
    String subtitle;
    String author;
    DateTime published;
    String publisher;
    int pages;
    String description;
    String website;

    Book({
        required this.isbn,
        required this.title,
        required this.subtitle,
        required this.author,
        required this.published,
        required this.publisher,
        required this.pages,
        required this.description,
        required this.website,
    });

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        isbn: json["isbn"],
        title: json["title"],
        subtitle: json["subtitle"],
        author: json["author"],
        published: DateTime.parse(json["published"]),
        publisher: json["publisher"],
        pages: json["pages"],
        description: json["description"],
        website: json["website"],
    );

    Map<String, dynamic> toJson() => {
        "isbn": isbn,
        "title": title,
        "subtitle": subtitle,
        "author": author,
        "published": published.toIso8601String(),
        "publisher": publisher,
        "pages": pages,
        "description": description,
        "website": website,
    };
}
