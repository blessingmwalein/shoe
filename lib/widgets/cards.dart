//create product card with image, name, price and rating
import 'package:flutter/material.dart';
import 'package:shoe_order_app/data/product_model.dart';

Widget productCard(
    {required BuildContext context,
    required int id,
    required String image,
    required String name,
    required String price,
    required double rating}) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, '/product',
          arguments: Product(
              id: id,
              name: name,
              price: double.parse(price),
              totalRating: rating,
              image: image));
    },
    child: Container(
        width: 150,
        height: 250,
        decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(children: [
          //create product image
          Container(
            width: 140,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //create product name
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          //create product price
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Text(
              '\$ $price',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ])),
  );
}

//create order list tile  with image, name, price and rating

Widget orderListTile(
    {required BuildContext context,
    required int id,
    required String image,
    required String name,
    required String price,
    required double rating}) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, '/product',
          arguments: Product(
              id: id,
              name: name,
              price: double.parse(price),
              totalRating: rating,
              image: image));
    },
    child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(children: [
          //create product image
          Container(
            width: 100,
            height: 100,
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              image: DecorationImage(
                image: AssetImage("assets/shoe2.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //create product name
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          //create product price
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Text(
              '\$ $price',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ])),
  );
}
