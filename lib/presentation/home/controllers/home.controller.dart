import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../domain/core/models/product.dart';
import '../../../infrastructure/navigation/routes.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void>  logoOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.AUTHENTICATION);
  }

  Future<List<Product>> getProducts() async{
    final snapshot = await FirebaseFirestore.instance.collection("products").get();
    final productData = snapshot.docs.map((e) => Product.fromSnapshot(e)).toList();
    return productData;

  }
}
