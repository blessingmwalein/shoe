import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shoe_order_app/screens/home_page.dart';
import 'package:shoe_order_app/screens/orders_screen.dart';
import 'package:shoe_order_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final LocalStorage storage;

  const HomeScreen({Key? key, required this.storage}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;
  LocalStorage storage = LocalStorage('orders');

  List screenList = [];

  @override
  void initState() {
    super.initState();
    storage = widget.storage;
    screenList = [
      // const HomeScreen(title: 'Home'),
      const HomePage(),
      OrdersScreen(storage: storage),
      const ProfileScreen(),
      const ProfileScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Container(
            padding: const EdgeInsets.only(top: 60, left: 10),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  // Text("Good Morning ", style: TextStyle(fontSize: 20)),
                  Text("Welcome 😊",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
              const Spacer(),
            ]),
          )),
      body: screenList[currentIndex],
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: DotNavigationBar(
            marginR: const EdgeInsets.symmetric(horizontal: 15),
            backgroundColor: Colors.black,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            currentIndex: currentIndex,
            dotIndicatorColor: Colors.transparent,
            unselectedItemColor: Colors.grey,
            borderRadius: 8,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              DotNavigationBarItem(
                icon: const Icon(Icons.home_rounded),
                selectedColor: Colors.white,
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.shopping_bag_outlined),
                selectedColor: Colors.white,
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.favorite_border),
                selectedColor: Colors.white,
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.person_outline_rounded),
                selectedColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
