import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Polly extends StatefulWidget {
  const Polly({Key? key}) : super(key: key);

  @override
  State<Polly> createState() => _PollyState();
}

class _PollyState extends State<Polly>  {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
          width: 70,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/material/ator-1.png'),
            ),
          ),
        child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
      );
  }
}
