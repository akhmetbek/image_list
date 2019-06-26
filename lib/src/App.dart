import 'package:flutter/material.dart';
import 'package:http/http.dart' show get, post;
import 'package:sample_app/src/Widgets/ImageList.dart';
import 'Models/ImageModel.dart';
import 'dart:convert';
class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
} 
class AppState extends State<App>{
  int counter = 1;
  List<ImageModel> images = new List();

  void fetchImage() async{
    var response = await get('http://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = new ImageModel.fromJson(json.decode(response.body));
    print('${imageModel.url}');
    counter++;
    setState(() {
     images.add(imageModel); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      body: ImageList(images),
      appBar: AppBar(
        title: Text("Let's see images!"),
      )
    ,floatingActionButton: FloatingActionButton(
      onPressed: fetchImage,
      child: Icon(Icons.clear),
    )
    ,)
  );
  }
}
