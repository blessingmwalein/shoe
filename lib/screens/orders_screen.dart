import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shoe_order_app/data/dummy_list.dart';
import 'package:shoe_order_app/data/product_model.dart';
import 'package:shoe_order_app/widgets/cards.dart';

class OrdersScreen extends StatefulWidget {
  final LocalStorage storage;

  const OrdersScreen({Key? key, required this.storage}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  LocalStorage storage = LocalStorage('orders');
  String message = '';
  OrderList orderList = OrderList();

  var orderData = [];
  @override
  void initState() {
    super.initState();
    storage = widget.storage;
    // Map<String, Product> data = storage.getItem('key')
    orderData = jsonDecode(storage.getItem('orders') ?? []);

    //map order data to product model

    // log(orderSplit.toString());
    // print(data[0]['id']);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //create grid view
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        //create order list
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: orderData.length,
            itemBuilder: (BuildContext context, int index) {
              var orderSplit = orderData[index].toString().split(':');
              log(orderSplit.toString());
              log(orderSplit[0]);
              log(orderSplit[1]);
              log(orderSplit[2]);
              log(orderSplit[3]);
              log(orderSplit[4]);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: orderListTile(
                    context: context,
                    id: 0,
                    image: orderSplit[2].split(",")[0],
                    name: orderSplit[1].split(",")[0],
                    price: orderSplit[3].split(",")[0],
                    rating: 5.0
                    ),
              );
            }),
      ),
    );
  }
}
