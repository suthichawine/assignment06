
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'Controller/Book_Controller.dart';

void main() {
  runApp(GetMaterialApp(
    home: MainPage(),
  ));
}
class MainPage extends StatelessWidget {
  MainPage({super.key});
  final BookController myController=Get.put(BookController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Ionicons.book),
        title: Text("Book JSON data"),
        backgroundColor: Colors.pink,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap:(value){
          if(value==1) {
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Ionicons.bookmark_sharp),label:"Book"),
          BottomNavigationBarItem(icon: Icon(Ionicons.analytics_sharp),label:"Product"),
        ],
      ),
      body: Column(
        children: [
          Text("Books data"),
          ElevatedButton(onPressed: () {
            myController.readJson();
          }, child: Text("View Book")),
          Expanded(child:
          Obx(()=> ListView.builder(
            itemCount: myController.listBook.length,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(15),
                color: (index%2==0)?Colors.purpleAccent:Colors.pinkAccent,
                child: Column(
                  children: [
                    Text("Author :: ${myController.listBook[index].author}",
                      style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    Text("BookTitle :: ${myController.listBook[index].title}",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text("Website :: ${myController.listBook[index].website}",
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                    Text("Subtitle :: ${myController.listBook[index].subtitle}",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                ),
              );
            },
          )))
        ],
      ),
    );
  }
}