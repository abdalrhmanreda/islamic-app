class Reciter {
  final int id;
  final String name;
  final String letter;
  final DateTime date;
  final List<Moshaf> moshaf;

  Reciter({
    required this.id,
    required this.name,
    required this.letter,
    required this.date,
    required this.moshaf,
  });

  factory Reciter.fromJson(Map<String, dynamic> json) {
    List<Moshaf> moshafList = [];
    if (json['moshaf'] != null) {
      moshafList = (json['moshaf'] as List)
          .map((moshafJson) => Moshaf.fromJson(moshafJson))
          .toList();
    }
    return Reciter(
      id: json['id'],
      name: json['name'],
      letter: json['letter'],
      date: DateTime.parse(json['date']),
      moshaf: moshafList,
    );
  }
}

class Moshaf {
  final int id;
  final String name;
  final String server;
  final int surahTotal;
  final int moshafType;
  final List<int> surahList;

  Moshaf({
    required this.id,
    required this.name,
    required this.server,
    required this.surahTotal,
    required this.moshafType,
    required this.surahList,
  });

  factory Moshaf.fromJson(Map<String, dynamic> json) {
    List<int> surahList = [];
    if (json['surah_list'] != null) {
      if (json['surah_list'] is String) {
        // If surah_list is a string, split it by ',' and convert each element to int
        surahList =
            (json['surah_list'] as String).split(',').map(int.parse).toList();
      } else {
        // If surah_list is already a list, directly cast it to List<int>
        surahList =
            (json['surah_list'] as List<dynamic>).map((e) => e as int).toList();
      }
    }
    return Moshaf(
      id: json['id'],
      name: json['name'],
      server: json['server'],
      surahTotal: json['surah_total'],
      moshafType: json['moshaf_type'],
      surahList: surahList,
    );
  }
}
