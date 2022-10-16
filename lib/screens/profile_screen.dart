import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_order_app/data/dummy_list.dart';
import 'package:shoe_order_app/widgets/cards.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //create grid view
      child: Padding(
        padding: const EdgeInsets.all(8.0),

        //create order list
        child:profileScreenWidget() ,
      ),
    );
  }

  //create profile screen widget
  Widget profileScreenWidget() {
    return Column(
      children: [
        //create user avatar
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(
            'assets/user.svg',
            width: 100,
            height: 100,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: const [
        //     // Text("Good Morning ", style: TextStyle(fontSize: 20)),
        //     Text("Welcome 😊",
        //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        //   ],
        // ),
      ],
    );
  }
}
