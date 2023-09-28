class Product{
  final String title;
  final String description;
  final int price;
  final String img;

  Product({required this.img,required this.title, required this.description, required this.price});

  factory Product.fromJson(Map<String,dynamic> json){
    return Product(img: json["images"][0],title: json["title"],description: json["description"],price: json["price"]);
  }

}