import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp>_initialize = Firebase.initializeApp();
  Future sentData()async{
    final database = await FirebaseFirestore.instance.collection("Student_info").add({
      'name': "Sayem",
      'city': "Cumilla",
      'age': 21.toString(),
    });
  }
  @override
  void initState() {
    _initialize;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FireBase"),
          centerTitle: true,
        ),
        body: Center(child: ElevatedButton(
          onPressed: sentData,
          child: Text("Add"),
        ),)

    );
  }
}