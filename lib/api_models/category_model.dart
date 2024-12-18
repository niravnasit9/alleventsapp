class AllCategory {
  String? category;
  String? data;

  AllCategory({this.category, this.data});

  AllCategory.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['data'] = this.data;
    return data;
  }
}