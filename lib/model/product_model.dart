class ProductsModel {
  String? title;
  String? body;

  ProductsModel({
    this.title,
    this.body,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        title: json['title'] as String?,
        body: json['body'] as String?,
      );
}
