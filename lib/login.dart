import 'package:flutter/material.dart';
import 'package:prototype_0/home.dart';
import 'package:prototype_0/login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Image(
                image: AssetImage('images/Friending_Logo/White_Back.png')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                LoginButton(
                    image: const Image(
                        image: AssetImage('images/Google_Logo.png')),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    }),
                LoginButton(
                    image: const Image(
                        image: AssetImage('images/Facebook_Logo.png')),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    }),
                LoginButton(
                    image:
                        const Image(image: AssetImage('images/Kakao_Logo.png')),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    }),
                LoginButton(
                    image:
                        const Image(image: AssetImage('images/Naver_Logo.png')),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    }),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            const Text(
              "소셜로그인",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
