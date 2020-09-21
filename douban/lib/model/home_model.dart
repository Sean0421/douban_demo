//class Person {
//  String name;
//  dynamic avatarURL;
//
//  Person.fromMap(Map<String, dynamic> json) {
//    this.name = json["name"];
//    this.avatarURL = json["avatars"]["medium"];
//  }
//}

//class Actor extends Person {
//  Actor.fromMap(Map<String, dynamic> json): super.fromMap(json);
//
//}

//class Director extends Person {
//  Director.fromMap(Map<String, dynamic> json): super.fromMap(json);
//}

int counter = 1;

class MovieItem {
  int rank;
  String imageURL;
  String title;
  String playDate;
  double rating;
  List<String> genres;
  List casts;
  dynamic director;
  String originalTitle;

  MovieItem.fromMap(Map<String, dynamic> json) {
    this.rank = counter++;
    this.imageURL = json["images"]["medium"];
    this.title = json["title"];
    this.playDate = json["year"];
//    this.rating = json["rating"]["average"];
    if(json["rating"]["average"] != 0) {
      this.rating = json["rating"]["average"];
    }else {
      this.rating = 6.0;
    }
    this.genres = json["genres"].cast<String>();
    this.casts = json["casts"].map((item) {
      return item["name"];
    }).toList();
//    print(casts);
    this.director = json["directors"].map((item) {
      return item["name"];
    }).toList();
//    print(director);
    this.originalTitle = json["original_title"];

  }

  @override
  String toString() {
    return 'MovieItem{rank: $rank, imageURL: $imageURL, title: $title, playDate: $playDate, rating: $rating, genres: $genres, casts: $casts, director: $director, originalTitle: $originalTitle}';
  }
}