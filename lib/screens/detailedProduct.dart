import 'package:flutter/material.dart';
import '../model/productModel.dart';

class DetailedProduct extends StatelessWidget {
  final Product product;
  const DetailedProduct({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Image.network(product.img),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                  product.title,
                  style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 20,fontFamily: "Open Sans",color: Color(0xff252837)),
                  textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                  product.description,
                  style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: "Open Sans",color: Color(0xff646E77)),
                textAlign: TextAlign.center,

              ),
            ),
            const SizedBox(height: 50,),
            Text(
                "\$${product.price}",
              style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,fontFamily: "Open Sans",color: Color(0xff252837)),
              textAlign: TextAlign.center,
            ),


          ],
        ),
      ),
    );
  }
}
