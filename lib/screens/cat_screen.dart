import 'package:flutter/material.dart';
import '../Models/cat_model.dart';
import '../Models/meow_facts.dart';



class CatScreen extends StatefulWidget {
  const CatScreen({super.key});

  @override
  State<CatScreen> createState() => _CatScreenState();
}
class _CatScreenState extends State<CatScreen> {

  late Future<List<CatModel>> futureCatImages;
late Future<List<MeowFacts>> futureMeowFacts;

  // PageController _pageController = PageController();
  // int _currentPage = 0;
  var controller = PageController(initialPage: 0);
  var displayFact = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    futureCatImages = apiInitialize.fetchData();
    futureMeowFacts = apiFactsInitialize().fetchMeowFacts();
    // futureMeowFacts = fetchMeowFacts() as Future<List<MeowFacts>>;
    // _pageController.addListener(() {
    //   setState(() {
    //     _currentPage = _pageController.page!.round();
    //   });
    // });
    // WidgetsBinding.instance.addPostFrameCallback((_){
    //   controller.addListener(() {
    //     setState(() {
    //       if (controller.page == 0) {
    //         displayFact = 0;
    //
    //         // displayFact = 'Fact 1';
    //       } else if (controller.page == 1) {
    //         // displayFact = 'Fact 2';
    //         displayFact = 1;
    //
    //       }
    //       else if (controller.page == 2) {
    //         // displayFact = 'Fact 3';
    //         displayFact = 2;
    //
    //       }
    //       print(displayFact);
    //     });
    //   });


    // }
    // });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // void setFactDesc() {
  //   if (controller.page == 0) {
  //     Text('${controller.page} ' + meowFacts[0].meow_facts[0]);
  //   }
  // }



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
                        PageView(scrollDirection: Axis.horizontal,
                            controller: controller,
                            onPageChanged: (int page) {
                          setState(() {
                            displayFact = page;
                          });
                              print("Current page: $page");
                            },
                            children: [
                            // SizedBox(width: screenWidth*0.1),
                            ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(catImages[0].photo, height: screenHeight*0.4, width: screenWidth*0.8, fit: BoxFit.cover,)),
                            // SizedBox(width: 10),
                            ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(catImages[1].photo, height: screenHeight*0.4, width: screenWidth*0.8, fit: BoxFit.cover)),
                            // SizedBox(width: 90),
                            ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(catImages[2].photo, height: screenHeight*0.4, width: screenWidth*0.8, fit: BoxFit.cover)),
                            // SizedBox(width: 90),
                                                   ]
                        ),
                ),

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
              future: futureMeowFacts,
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return const CircularProgressIndicator();
                // } else
                //   if (snapshot.hasError) {
                //   return Text('${snapshot.error}');
                // } else
                  if (snapshot.hasData) {
                  List<MeowFacts> meowFacts = snapshot.data!;
                  // var displayFact;
                  // displayFact = 'xd';
                  // setState(() {
                  //   if (controller.page == 0) {
                  //     displayFact = 'hehehe';
                  //   } else if (controller.page == 1) {
                  //     displayFact = '11111';
                  //   }
                  //   else {
                  //     displayFact = '22222';
                  //   }
                  // });
                  // if (controller.page == 0) {
                return Container(
                    alignment: Alignment.topLeft,
                    // alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(left: 3),

                // child: Text(meowFacts.meow_facts[0]),
    // child: Text(meowFacts[0].meow_facts[0]),

    // child: Text(controller.page == 1 ? meowFacts[0].meow_facts[0] + '$controller' : meowFacts[1].meow_facts[0]) ,
    //                 child: Text('${controller.page} ' + meowFacts[0].meow_facts[0]
                    child:
                // Text(
                        // displayFact
                    Text(meowFacts[displayFact].meow_facts[0]
                    // Text('${controller.page} ' + meowFacts[displayFact].meow_facts[0]
    ))
    ;
                // }
                //   else if (controller.page == 1) {
                //     return Container(
                //       child: Text('${controller.page} ' + meowFacts[1].meow_facts[0]),
                //       // child: Text(meowFacts[0].meow_facts[1]),
                //         alignment: Alignment.topLeft,
                //         //   alignment: Alignment.center,
                //         padding: EdgeInsets.only(left: 3));
                //   }
                //   else if (controller.page == 2) {
                //     return Container(
                //         child: Text('${controller.page} ' + meowFacts[2].meow_facts[0]),
                //         alignment: Alignment.topLeft,
                //         padding: EdgeInsets.only(left: 3));
                //   }
                  // return Container(
                  //   child: Text(meowFacts[controller.initialPage].meow_facts[0]),
                  //     // child: Text(meowFacts[_currentPage].meow_facts[0],),
                  //
                  //     // child: Text(meowFacts[_currentPage].meow_facts[0],),
                  //     alignment: Alignment.center,
                  //     padding: EdgeInsets.only(left: 3));
                    // return Container(child: Text(meowFacts[0].meow_facts[0],), alignment: Alignment.topLeft, padding: EdgeInsets.only(left: 3));
                // }
                //   else {
                //     return Text('');
                //     //no CircularProgessIndicator or can't gether data message to soften UI experience for Users.
                //     // return Text('No data available');
                // }

              } else {
                    return Text('no snapshot');
                  }
    },
            ),
          ),
        ],
      ),

    );
  }
}
