import 'package:cat_app/archive/cat_fact_description.dart';
import 'package:flutter/material.dart';

import '../Models/cat_model.dart';
import '../Models/meow_facts.dart';
import '../api/api_initialize.dart';



class CatScreen extends StatefulWidget {
  const CatScreen({super.key});

  @override
  State<CatScreen> createState() => _CatScreenState();
}
class _CatScreenState extends State<CatScreen> {
  late Future<List<CatModel>> futureCatImages;
  late Future<List<CatFactDescription>> futureCatFacts;
late Future<List<MeowFacts>> futureMeowFacts;

  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchData();
    // apiInitialize.fetchData();
    futureCatImages = apiInitialize.fetchData();
    futureCatFacts = fetchCatFacts();
    // fetchCatFacts();
    futureMeowFacts = fetchMeowFacts() as Future<List<MeowFacts>>;
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Column(
        children: [
          FutureBuilder(
              future: futureCatImages,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<CatModel> catImages = snapshot.data!;
                  print('Cat Images length:');
                  print(catImages.length);
                  return Column(
                    children: [
                    Container(height: screenHeight*0.2, width: screenWidth, color: Colors.blue),
                      Container(height: screenHeight*0.45, width: screenWidth*0.99, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.green),
                        child:
                        Row(
                          children: [
                            PageView(scrollDirection: Axis.horizontal,
                                controller: _pageController ,
                                children: [
                                SizedBox(width: screenWidth*0.1),
                                ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(catImages[0].photo, height: screenHeight*0.4, width: screenWidth*0.8, fit: BoxFit.cover,)),
                                SizedBox(width: 90),
                                ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(catImages[1].photo, height: screenHeight*0.4, width: screenWidth*0.8, fit: BoxFit.cover)),
                                SizedBox(width: 90),
                                ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(catImages[2].photo, height: screenHeight*0.4, width: screenWidth*0.8, fit: BoxFit.cover)),
                                SizedBox(width: 90),
                           ]
                            )
                            // ),
                          ],
                        ),
                ),
                // SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(
                //         SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(
                //           children: [
                //             SizedBox(width: screenWidth*0.1),
                //             ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(catImages[0].photo, height: screenHeight*0.4, width: screenWidth*0.8, fit: BoxFit.cover,)),
                //             SizedBox(width: 90),
                //             ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(catImages[1].photo, height: screenHeight*0.4, width: screenWidth*0.8, fit: BoxFit.cover)),
                //             SizedBox(width: 90),
                //             ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(catImages[2].photo, height: screenHeight*0.4, width: screenWidth*0.8, fit: BoxFit.cover)),
                //             SizedBox(width: 90),
                //           ],
                //         )
                //         ),
                //       ),
                      // Container(height: screenHeight*0.1, width: screenWidth, child: Text('Did You Know?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), color: Colors.red, alignment: Alignment.centerLeft, padding: EdgeInsets.only(left: 8),),
                      //
                      // Container(
                      //   height: screenHeight * 0.2,
                      //   width: screenWidth,
                      //   color: Colors.brown[200],
                      //   alignment: Alignment.bottomLeft,
                      //   child: FutureBuilder<List<MeowFacts>>(
                      //     future: fetchMeowFacts(),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.connectionState == ConnectionState.waiting) {
                      //         return CircularProgressIndicator();
                      //       } else if (snapshot.hasError) {
                      //         return Text('${snapshot.error}');
                      //       } else if (snapshot.hasData) {
                      //         List<MeowFacts> meowFacts = snapshot.data!;
                      //         return Text(meowFacts[0].meow_facts[0]);
                      //       } else {
                      //         return Text('No data available');
                      //       }
                      //     },
                      //   ),
                      // )



                    ],
                  );

                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // return const CircularProgressIndicator();
                //no CircularProgessIndicator:
                return Text('');

                // }
              },

            ),
          Container(height: screenHeight*0.1, width: screenWidth, child: Text('Did You Know?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), color: Colors.red, alignment: Alignment.centerLeft, padding: EdgeInsets.only(left: 3),),
          Container(
            height: screenHeight * 0.2,
            width: screenWidth,
            color: Colors.brown[200],
            alignment: Alignment.bottomLeft,
            child: FutureBuilder<List<MeowFacts>>(
              future: fetchMeowFacts(),
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return const CircularProgressIndicator();
                // } else
                //   if (snapshot.hasError) {
                //   return Text('${snapshot.error}');
                // } else
                  if (snapshot.hasData) {
                  List<MeowFacts> meowFacts = snapshot.data!;
                  return Container(child: Text(meowFacts[0].meow_facts[0],), alignment: Alignment.topLeft, padding: EdgeInsets.only(left: 3));
                }
                  else {
                    return Text('');
                    //no CircularProgessIndicator or can't gether data message to soften UI experience for Users.
                    // return Text('No data available');
                }
              },
            ),
          ),
        ],
      ),

    );
  }
}
