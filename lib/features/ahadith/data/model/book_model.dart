// class ImamBooksModel {
//   final int bookNumber;
//   final List<Book> book;
//   final int hadithStartNumber;
//   final int hadithEndNumber;
//   final int numberOfHadith;
//
//   ImamBooksModel({
//     required this.bookNumber,
//     required this.book,
//     required this.hadithStartNumber,
//     required this.hadithEndNumber,
//     required this.numberOfHadith,
//   });
//
//   factory ImamBooksModel.fromJson(Map<String, dynamic> json) {
//     var bookList = json['book'] as List;
//     List<Book> books = bookList.map((book) => Book.fromJson(book)).toList();
//
//     return ImamBooksModel(
//       bookNumber: json['bookNumber'],
//       book: books,
//       hadithStartNumber: json['hadithStartNumber'],
//       hadithEndNumber: json['hadithEndNumber'],
//       numberOfHadith: json['numberOfHadith'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'bookNumber': bookNumber,
//       'book': book.map((b) => b.toJson()).toList(),
//       'hadithStartNumber': hadithStartNumber,
//       'hadithEndNumber': hadithEndNumber,
//       'numberOfHadith': numberOfHadith,
//     };
//   }
// }
//
// class Book {
//   final String lang;
//   final String name;
//
//   Book({
//     required this.lang,
//     required this.name,
//   });
//
//   factory Book.fromJson(Map<String, dynamic> json) {
//     return Book(
//       lang: json['lang'],
//       name: json['name'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'lang': lang,
//       'name': name,
//     };
//   }
// }
