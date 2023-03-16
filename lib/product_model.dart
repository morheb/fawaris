class Product {
  String name;
  String price;
  int count;
  String image;
  Product(
      {required this.name,
      required this.price,
      this.count = 0,
      required this.image});
}
