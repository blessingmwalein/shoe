//create single product page
import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shoe_order_app/constants.dart';
import 'package:shoe_order_app/data/dummy_list.dart';
import 'package:shoe_order_app/data/product_model.dart';
import 'package:shoe_order_app/widgets/buttons.dart';
import 'package:shoe_order_app/widgets/cards.dart';

class SingleProduct extends StatefulWidget {
  final Product product;
  final LocalStorage storage;

  const SingleProduct({Key? key, required this.product, required this.storage})
      : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  final List<String> imgList = [];
  LocalStorage storage = LocalStorage('orders');
  String message = '';
  OrderList orderList = OrderList();
  var data = [];
  @override
  void initState() {
    super.initState();
    storage = widget.storage;
    if(storage.getItem('orders') != null){
      data = jsonDecode(storage.getItem('orders') ?? []);
    }
    // print(data[0]['id']);
    imgList.add(widget.product.image);
    imgList.add(widget.product.image);
    imgList.add(widget.product.image);
    imgList.add(widget.product.image);
  }
  

  //create function to add item to cart wityh local storage

  _addItem(Product product) {
    setState(() {
      //check if product is already in orderList

      data.add(product);

      _saveToStorage();
    });
  }

  _saveToStorage() {
    storage.setItem('orders', jsonEncode(data));

    print(storage.getItem('orders'));
  }

  _clearStorage() async {
    await storage.clear();

    setState(() {
      orderList.items = storage.getItem('orders') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Single Product',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        //create grid view
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xffF3F3F3),
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1,
                  ),
                  items: imgList
                      .map((item) => Container(
                            child: Center(
                                child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                              height: 50,
                            )),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //create nice text
              Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${widget.product.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.product.totalRating}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  //create nice row for total price and rounded button
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 60,
              ),
              //create nice row for order counter button and row

              Align(
                alignment: Alignment.bottomCenter,
                child: roundedButton(
                    text: 'Order \$${widget.product.price}',
                    color: kPrimaryBackColor,
                    textColor: Colors.white,
                    onPressed: () {
                      _addItem(widget.product);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
