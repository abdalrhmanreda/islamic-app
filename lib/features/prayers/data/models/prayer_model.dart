class PrayerModel {
  int? id;
  String? title;
  String? engTitle;
  String? slug;
  bool? isFavorite;
  String? category;
  String? audioUrl;
  List<PrayerContentModel>? text;

  PrayerModel({
    this.id,
    this.title,
    this.engTitle,
    this.slug,
    this.isFavorite,
    this.category,
    this.audioUrl,
    this.text,
  });

  PrayerModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    title = json['TITLE'];
    engTitle = json['eng_title'];
    slug = json['slug'];
    isFavorite = json['isFavorite'];
    category = json['CATEGORY'];
    audioUrl = json['AUDIO_URL'];
    if (json['TEXT'] != null) {
      text = <PrayerContentModel>[];
      json['TEXT'].forEach((v) {
        text!.add(PrayerContentModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['TITLE'] = title;
    data['eng_title'] = engTitle;
    data['slug'] = slug;
    data['isFavorite'] = isFavorite;
    data['CATEGORY'] = category;
    data['AUDIO_URL'] = audioUrl;
    if (text != null) {
      data['TEXT'] = text!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrayerContentModel {
  int? id;
  String? arabicText;
  String? languageArabicTranslatedText;
  String? translatedText;
  int? repeat;
  String? audio;

  PrayerContentModel({
    this.id,
    this.arabicText,
    this.languageArabicTranslatedText,
    this.translatedText,
    this.repeat,
    this.audio,
  });

  PrayerContentModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    arabicText = json['ARABIC_TEXT'];
    languageArabicTranslatedText = json['LANGUAGE_ARABIC_TRANSLATED_TEXT'];
    translatedText = json['TRANSLATED_TEXT'];
    repeat = json['REPEAT'];
    audio = json['AUDIO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['ARABIC_TEXT'] = arabicText;
    data['LANGUAGE_ARABIC_TRANSLATED_TEXT'] = languageArabicTranslatedText;
    data['TRANSLATED_TEXT'] = translatedText;
    data['REPEAT'] = repeat;
    data['AUDIO'] = audio;
    return data;
  }
}
