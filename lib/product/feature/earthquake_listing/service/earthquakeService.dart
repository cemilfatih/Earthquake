
import 'package:earthquake_listing/utility/enum/statusCodes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../constants/urls.dart';
import '../model/earthquakeModel.dart';

class earthquakeService{

  Future<List<Earthquake>> getEarthquakeData() async{
    final response = await http.get(Uri.parse(urls().apiURL));

    if(response.statusCode == statusEnum.success.statusCode){

      final jsonList = jsonDecode(response.body);

      List<Earthquake> earthquakeList = [];
      int _count = jsonList['metadata']['total'];


      for (int i = 0; i < _count; i++){
        String provider = jsonList['result'][i]['provider'];

        String title = jsonList['result'][i]['title'];

        String date = jsonList['result'][i]['date'];

        String mag = jsonList['result'][i]['mag'].toString();


        String depth = jsonList['result'][i]['depth'].toString();


        Earthquake model = Earthquake(provider: provider, title: title, date: date, mag: mag, depth: depth);
        earthquakeList.add(model);
      }

      return earthquakeList;


  }else{

      throw Exception("/ERROR: Could not load data");
    }
    }
}