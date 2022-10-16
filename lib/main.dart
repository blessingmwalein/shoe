import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shoe_order_app/data/product_model.dart';
import 'package:shoe_order_app/screens/home_screen.dart';
import 'package:shoe_order_app/screens/orders_screen.dart';
import 'package:shoe_order_app/screens/profile_screen.dart';
import 'package:shoe_order_app/screens/single_product.dart';
import 'package:shoe_order_app/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = LocalStorage('orders');
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/home': (context) => HomeScreen(
          storage:storage
        ),
        '/profile': (context) => const ProfileScreen(),
        '/orders': (context) =>  OrdersScreen(
          storage: storage,
        ),
        '/product': (context) => SingleProduct(
            storage:storage,
            product:
                ModalRoute.of(context)?.settings.arguments as Product),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
