import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class MeowFacts {
  final List<String> meow_facts;

  MeowFacts({required this.meow_facts});

  factory MeowFacts.fromJson(Map<String, dynamic> json) {
    return MeowFacts(
      meow_facts:
      List<String>.from(json['data']),
    );
  }
}

late List<MeowFacts> meowFactsList = [];
late List<MeowFacts> meowFactsListFuture = [];

late String name;
List<String> stringList = meowFactsListFuture.cast<String>();
List<String> stringList2 = meowFactsListFuture.cast<String>();
List<String> stringList3 = [];

apiFactsInitialize factsInitialized = apiFactsInitialize();

class apiFactsInitialize {

  Future<List<MeowFacts>>fetchMeowFacts() async {
    var url = Uri.parse('https://meowfacts.herokuapp.com/?count=3');
    final response = await http.get(url);
    print('Printing: response status code: ${response.statusCode}');
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> decodedJson = jsonDecode(response.body)['data'];
      List<MeowFacts> meowFactsList = decodedJson.map((fact) => MeowFacts(meow_facts: [fact.toString()])).toList();
      return meowFactsList;
    } else {
      throw Exception('Could not receive successfully jsonResponse. Status code: ${response.statusCode}');  }
  }

}

// MeowFacts meowFacts = MeowFacts.fromJson(jsonMap);
// var xd = meowFacts.meow_facts[0];
//powino w init uruchomic sie raz i nie wiecej i nie wczytywac nowych ciekawostek