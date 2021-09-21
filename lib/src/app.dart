import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:pics/src/widgets/image_list.dart';
import 'models/image_model.dart';


class App extends StatefulWidget{
 AppState createState(){
   return AppState();
 }
}

class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> imageList=[];


  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image App"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImages,
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
