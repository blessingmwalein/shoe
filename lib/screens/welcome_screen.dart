import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_order_app/constants.dart';
import 'package:shoe_order_app/widgets/buttons.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.white, elevation: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    "Welcome to shoe order",
                    style: kTitleStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/welcome.svg',
                  ),
                ),
                roundedButton(
                    text: "Next",
                    color: kPrimaryBackColor,
                    textColor: Colors.white,
                    onPressed: () {
                      // Navigator.pop(context);
                      Navigator.pushNamed(context, '/home');
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
