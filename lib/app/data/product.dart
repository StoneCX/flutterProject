class ProductModel {
  late int id;
  String? titleShort;
  String? titleLong;
  int? soldNum;
  bool? beingCollectedByUser;

  ProductModel({required this.id, this.titleShort, this.titleLong, this.soldNum, this.beingCollectedByUser = false});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleShort = json['short'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['titleShort'] = titleShort;
    return data;
  }
}
