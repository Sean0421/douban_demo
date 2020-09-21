
import 'package:douban/model/home_model.dart';
import 'package:douban/service/http_request.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async {
    //1.构建URL
    final movieURL = "/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&start=$start&count=10";

//    2.发送网络请求获取结果
    final result = await HttpRequest.request(movieURL);
    final subjects = result["subjects"];

//    3.将map转换成model
    List<MovieItem> movies = [];
    for (var sub in subjects) {
//      print(sub);
      movies.add(MovieItem.fromMap(sub));
    }
    return movies;
  }
}