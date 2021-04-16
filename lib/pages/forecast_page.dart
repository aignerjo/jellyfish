import 'package:flutter/material.dart';

class ForecastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/images/background.png",
            fit: BoxFit.cover,
          ),
          Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.blue.withOpacity(.2)),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Image.asset(
              "assets/images/jellyfish.png",
              height: 150,
              width: 150,
            ),
          )),
        ],
      ),
    );
  }
}
