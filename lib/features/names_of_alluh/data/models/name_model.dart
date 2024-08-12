class NameModel {
  String? nameOfAllah;
  String? en;
  String? meaning;

  NameModel({this.nameOfAllah, this.en, this.meaning});

  NameModel.fromJson(Map<String, dynamic> json) {
    nameOfAllah = json['nameOfAllah'];
    en = json['en'];
    meaning = json['meaning '];
  }
}
