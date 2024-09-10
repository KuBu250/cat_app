import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cat_screen.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({super.key});

  @override
  State<GettingStarted> createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // fetchData();
  //   // apiInitialize.fetchData();
  //   futureCatImages = apiInitialize.fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[100],
body: Center(
  child: GestureDetector(
    // onTap: navigateToCatScreen,
    onTap: () => navigateToCatScreen(context),
    child: Container(padding: EdgeInsets.all(1),
      height: 100,
      width: 300,
      decoration: BoxDecoration(color: Colors.pinkAccent, borderRadius: BorderRadius.circular(15),),
    child: Center(child: Text("Let's get started!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white70),)),
    ),
  ),


  ),
);
  }
}

void navigateToCatScreen(BuildContext context) {
  final route = MaterialPageRoute(builder: (context) => const CatScreen());
  Navigator.push(context, route);
}
