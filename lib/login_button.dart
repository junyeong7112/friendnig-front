import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key,
      required this.image,
      //required this.text,
      //required this.color,
      //required this.radius,
      required this.onPressed})
      : super(key: key);

  final Widget image;
  //final Widget text;
  //final Color color;
  //final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(child: IconButton(onPressed: onPressed, icon: image));
  }
}

// ElevatedButton(
//         child: Row(
//           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             image,
//             //text,
//             // Opacity(
//             //   opacity: 0.0,
//             //   child: image,
//             // ),
//           ],
//         ),
//         //style: ElevatedButton.styleFrom(primary: color),
//         onPressed: onPressed,
//       ),
//       // shape: RoundedRectangleBorder(
//       //   borderRadius: BorderRadius.all(
//       //     Radius.circular(radius),
//       //  ),
//       //),