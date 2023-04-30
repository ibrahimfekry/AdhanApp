class AzkarElsabahModel {
  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  AzkarElsabahModel(
      {this.category,
        this.count,
        this.description,
        this.reference,
        this.content});

  AzkarElsabahModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['count'] = this.count;
    data['description'] = this.description;
    data['reference'] = this.reference;
    data['content'] = this.content;
    return data;
  }
}