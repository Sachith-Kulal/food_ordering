import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
  final String? id;
  final String image;
  final String name;
  final int price;
  const Product({
    this.id,
    required this.image,
    required this.name,
    required this.price
});
  toJson(){
    return {
      "id": id,
      "image": image,
      "name": name,
      "price": price
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();
    return Product(
      id: document.id,
      image: data!["image"],
      name:  data["name"],
      price:  data["price"]
    );

  }

}