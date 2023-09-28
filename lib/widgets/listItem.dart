

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/productModel.dart';

class ListItem extends StatelessWidget {
  final Product product;
  const ListItem({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: MediaQuery.sizeOf(context).height *0.2,
        margin: const EdgeInsets.all(5),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double height = constraints.maxHeight * 0.5;
            double width = constraints.maxWidth *0.7;
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(product.img,width: width,height: height,),
                    SvgPicture.asset("vectors/heart.svg",width: width*0.2,),
                  ],
                ),
                Text(
                  product.description,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff646E77),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text("\$${product.price.toString()}"),
              ],
            );
          }
        ),
      ),
    );
  }
}
