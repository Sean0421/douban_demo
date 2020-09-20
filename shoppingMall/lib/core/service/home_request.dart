
import 'package:shoppingMall/core/model/home_show_item.dart';
import 'package:shoppingMall/core/service/config.dart';
import 'package:shoppingMall/core/service/http_request.dart';

class HomeRequest {
  static Future<List<HomeShowItem>> requireHomeShowItem(String type, int page) async{
    final String homeShowItemUrl = HttpConfig.baseURL+ HomeConfig.homeUrl + "?type=$type&page=$page";

    final result = await HttpRequest.request(homeShowItemUrl);

    final list = result["data"]["list"];

    List<HomeShowItem> items = [];

    for(var i in list){
      items.add(HomeShowItem.fromJson(i));
    }

    return items;
  }
}