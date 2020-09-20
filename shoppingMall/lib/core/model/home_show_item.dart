class HomeShowItem{
  String image;
  String title;
  String price;
  String favor;
  int count = 0;
  bool isChecked = false;

  HomeShowItem({this.image,this.favor,this.price,this.title, this.count,this.isChecked});

  HomeShowItem.fromJson(Map<String, dynamic> json){
    this.image = json["show"]["img"];
    this.title = json["title"];
    this.price = json["price"];
    this.favor = json["cfav"].toString();
  }

}