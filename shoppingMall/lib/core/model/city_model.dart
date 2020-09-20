class SHCityModel {
  String title;
  List<String> lists;

  SHCityModel({this.title, this.lists});

  SHCityModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    lists = json['lists'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['lists'] = this.lists;
    return data;
  }
}
