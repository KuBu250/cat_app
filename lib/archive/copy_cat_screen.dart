import 'package:cat_app/screens/getting_started.dart';
import 'package:flutter/material.dart';

import '../Models/cat_model.dart';
import '../api/api_initialize.dart';



class CatScreen extends StatefulWidget {
  const CatScreen({super.key});

  @override
  State<CatScreen> createState() => _CatScreenState();
}
class _CatScreenState extends State<CatScreen> {
  late Future<List<CatModel>> futureCatImages;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchData();
    // apiInitialize.fetchData();
    futureCatImages = apiInitialize.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: FutureBuilder(
          future: futureCatImages,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CatModel> catImages = snapshot.data!;
              print('Cat Images length:');
              print(catImages.length);
              return Column(
                children: [
                Container(height: screenHeight*0.15, width: screenWidth, color: Colors.blue),
                // Container(height: 200, width: 200, color: Colors.red,),
                  Container(height: screenHeight*0.6, width: screenWidth*0.9, color: Colors.green,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: catImages.length,
                      itemBuilder: (context, index) {
                        return Column(mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            // Column(mainAxisAlignment: MainAxisAlignment.start, mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.center,),
                            // Container(height: 150, width: 220, color: Colors.black38, alignment: Alignment.bottomLeft,),
                            SizedBox(
                              child: SingleChildScrollView(scrollDirection: Axis.vertical ,
                                child: Row(children: [
                                  // Container(height: 100, width: 20, color: Colors.grey,),
                                  // Container(alignment: Alignment.center , decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),), child: FittedBox(child: Image.network(catImages[0].photo, height: 340, width: 480, fit: BoxFit.none,))),
                                  Image.network(catImages[0].photo, height: 340, width: 480,),
                                  Image.network(catImages[1].photo, height: 340, width: 480,),
                                  Image.network(catImages[2].photo, height: 340, width: 480,),
                                  // SizedBox(height: 20,),
                                  // Container(height: 200, width: 200, color: Colors.red,),
                                  // Container(height: 375, width: 400, color: Colors.blue,child: Image.network(catImages[1].photo, height: 340, width: 480,)),
                                  // Container(height: 375, width: 400, color: Colors.blue,child: Image.network(catImages[2].photo, height: 340, width: 480,)),

                                  // Container(height: 375, width: 500, color: Colors.blue,child: Image.network(catImages[index].photo, height: 340, width: 480,)),
                                  // Image.network(catImages[index].photo),
                                ],
                                ),
                              ),
                            ),
                            // Container(height: 50, width: 220, color: Colors.black38, alignment: Alignment.bottomLeft,),

                            // Column()
                          ],
                        );
                        // return Image.network(catImages[index].photo);
                      },
                    ),
                  ),
                  Container(height: screenHeight*0.1, width: 300, child: Text('Did You Know?'), color: Colors.red, alignment: Alignment.bottomLeft,),
                  Container(height: screenHeight*0.15, width: 300, color: Colors.pinkAccent, alignment: Alignment.bottomLeft,)


                ],
              );

            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();

                // }
    },

  ),

    );
  }
}
