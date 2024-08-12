class RadioModel {
  int? id;
  String? name;
  String? url;
  String? recentDate;

  RadioModel({this.id, this.name, this.url, this.recentDate});

  RadioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['recent_date'] = this.recentDate;
    return data;
  }
}
