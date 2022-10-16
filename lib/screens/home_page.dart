import 'package:flutter/material.dart';
import 'package:shoe_order_app/data/dummy_list.dart';
import 'package:shoe_order_app/widgets/cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //create grid view
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20, crossAxisSpacing: 20, crossAxisCount: 2),
            itemCount: dummyData.length,
            itemBuilder: (BuildContext context, int index) {
              return productCard(
                  context: context,
                  id:dummyData[index].id,
                  image: dummyData[index].image,
                  name: dummyData[index].name,
                  price: dummyData[index].price.toString(),
                  rating: dummyData[index].totalRating);
            }),
      ),
    );
  }
}
