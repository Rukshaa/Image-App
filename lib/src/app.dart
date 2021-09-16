import 'dart:convert';

/// 1.import the material standard library
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pics/src/widgets/image_list.dart';
import 'models/image_model.dart';


class App extends StatefulWidget{
 AppState createState(){
   return AppState();
 }
}
/// 2. Define App class that extends *StatelessWidget*
class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> imageList=[];

  /// 3. Define a *build* method inside the App class
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image App"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton
          (onPressed: () {
          fetchImages();
        },
          child: Icon(Icons.add),
        ),
          body: ImageList(imageList),
      ),
    );
  }
 void fetchImages() async
 {
   counter++;
   var url =Uri.parse("https://jsonplaceholder.typicode.com/photos/$counter");
   var response =await get(url);
   Map<String,dynamic> body = jsonDecode(response.body);

   var imageModel= ImageModel.fromJson(body);
   setState(() {
     imageList.add(imageModel);
   });
 }
}
