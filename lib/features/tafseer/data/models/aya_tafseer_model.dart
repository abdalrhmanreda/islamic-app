class TafseerModel {
  List<Result>? result;

  TafseerModel({this.result});

  TafseerModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }
}

class Result {
  String? id;
  String? sura;
  String? aya;
  String? arabicText;
  String? translation;
  String? footnotes;

  Result(
      {this.id,
      this.sura,
      this.aya,
      this.arabicText,
      this.translation,
      this.footnotes});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sura = json['sura'];
    aya = json['aya'];
    arabicText = json['arabic_text'];
    translation = json['translation'];
    footnotes = json['footnotes'];
  }
}
