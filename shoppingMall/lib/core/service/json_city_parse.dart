import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shoppingMall/core/model/city_model.dart';

class SHJsonCityParse {
  static Future<List<SHCityModel>> getCityData() async {
//   1.加载Json文件
  final jsonString = await rootBundle.loadString("assets/json/City.json");

//  2.将jsonString转成map/list
  final result = json.decode(jsonString);

  final resultList = result["city"];
  List<SHCityModel>  cityCode = [];
  for(var i in resultList){
    cityCode.add(SHCityModel.fromJson(i));
  }
  return cityCode;
  }
}