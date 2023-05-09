import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prototype_0/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _visible = false;
  late Timer _timer;
  // final controller =
  //     AnimationController(vsync: this, duration: Duration(seconds: 3));
  // final animation = Tween(begin: 0.0, end: 1.0).animate(controller);

  @override
  void initState() {
    super.initState();
    _timer = Timer(
        const Duration(seconds: 3),
        () => {
              setState(() {
                _visible = !_visible;
              })
            });
    // Duration(seconds: 3),
    // () => Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: ((context) => const HomePage()))));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 47, 85, 151),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                  //padding: const EdgeInsets.only(top: 200.0),
                  child: const Image(
                      image: AssetImage('images/Friending_Logo/Blue_Back.png'))
                  //const Text(
                  //   "SplashPage\nInsert Image",
                  //   style: TextStyle(
                  //     fontSize: 32,
                  //     fontWeight: FontWeight.w800,
                  //   ),
                  //   textAlign: TextAlign.center,
                  // )
                  ),
              // FadeTransition(
              //   opacity: animation,
              // ),
              // SizedBox(
              //   height: 200.0,
              // ),
              AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black87,
                    primary: const Color.fromARGB(255, 255, 255, 255),
                    minimumSize: const Size(250, 50),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
