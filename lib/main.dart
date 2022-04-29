import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Kitten{
   Kitten({required this.name, required this.description, required this.age, required this.imageUrl});
  
  final String name;
  final String description;
  final int age;
  final String imageUrl;



}


final String server = 
    defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";

final List<Kitten> _kittens= <Kitten>[
  Kitten(
     name: "Mittens",
    description: 'The pinnacle of cats. When Mittens sits in your lap',
    age: 11,
    imageUrl : 'http://$server:8000/kitten1.jpg',
  ),
   Kitten(
     name: "fluutty",
    description: 'The pinnacle of cats. When Mittens sits in your lap',
    age: 11,
    imageUrl : 'http://$server:8000/kitten1.jpg',
  ),
   Kitten(
     name: "Rohugy",
    description: 'The pinnacle of cats. When Mittens sits in your lap',
    age: 11,
    imageUrl : 'http://$server:8000/kitten1.jpg',
  ),
];
class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key, required String title }) : super(key: key);

Widget _dailogBuilder(BuildContext context,Kitten kitten){
  return SimpleDialog(children: [Container(width: 80.0,height: 80.0,)],);
}
  Widget _listItemBuilder(BuildContext context, int index){
    return GestureDetector(
      onTap: () => showDialog(context: context, builder: (context) => _dailogBuilder(context,_kittens[index])
      ),
      child: new Container(
        padding:  EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(_kittens[index].name,
         style: Theme.of(context).textTheme.bodyText1, ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Kittens'),
      ),
      body: ListView.builder(itemCount: _kittens.length,
      // itemExtent: 40.0,
      itemBuilder: _listItemBuilder),
    );
  }
}