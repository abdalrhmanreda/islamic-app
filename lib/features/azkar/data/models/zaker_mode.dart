class ZakerModel {
  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  ZakerModel(
      {this.category,
      this.count,
      this.description,
      this.reference,
      this.content});

  ZakerModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    content = json['content'];
  }
}
