import 'dart:convert';
import 'dart:math';

import 'components/car.dart';
import 'components/polly.dart';
import 'globals.dart' as globals;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String text = "" ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Row(
              children: [
                const Text('Pontos:'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(globals.score.toString()),
                ),
              ],
            ),
          ),
          body: Stack(children: [
            Container(
              height: 692,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/material/estrada.png'),
                  // image: AssetImage("assets/images/material/estrada.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Car(
                paddingTop: 80,
                startPosition: 312,
                url: 'assets/images/material/carro-6.png',
                directionBegin: globals.RightToleftStart,
                directionEnd: globals.RightToleftEnd,
                 timeTransition:1
            ),
            const Car(
                paddingTop: 165,
                startPosition:312,
                url: 'assets/images/material/carro-5.png',
                directionBegin: globals.RightToleftStart,
                directionEnd: globals.RightToleftEnd,
                timeTransition:2
            ),
            const Car(
                paddingTop: 253,
                startPosition:312,
                url: 'assets/images/material/carro-4.png',
                directionBegin: globals.RightToleftStart,
                directionEnd: globals.RightToleftEnd,
                timeTransition:3
            ),
            const Car(
                paddingTop: 445,
                startPosition:0,
                url: 'assets/images/material/carro-2.png',
                directionBegin: globals.leftToRightStart,
                directionEnd: globals.leftToRightEnd,
                timeTransition:4
            ),
            const Car(
                paddingTop: 534,
                startPosition:0,
                url: 'assets/images/material/carro-1.png',
                directionBegin: globals.leftToRightStart,
                directionEnd: globals.leftToRightEnd,
                timeTransition:5
            ),
            const Car(
                paddingTop: 358,
                startPosition:0,
                url: 'assets/images/material/carro-3.png',
                directionBegin: globals.leftToRightStart,
                directionEnd: globals.leftToRightEnd,
                timeTransition:6
            ),

            Container(
              height: 690,
              child: Stack(
                  children: <Widget>[
                      Center(
                      child: Text(
                        text,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Positioned(
                        top: globals.topPolly,
                        left: globals.leftPolly,
                        child: GestureDetector(
                          onPanUpdate: (details){
                            globals.topPolly = max(0, globals.topPolly + details.delta.dy);
                            globals.leftPolly = max(0, globals.leftPolly + details.delta.dx);
                            //debugPrint('globals.topPolly: ${globals.topPolly}');
                            globals.pollyPosition();
                            setState(() {});
                          },
                          onPanDown: (details){
                            if (details.localPosition == const Offset(12.0 , 12.2)){
                              globals.topPolly = max(0, globals.topPolly * 2);
                              globals.pollyPosition();
                            }
                          },
                          child: const Polly(),
                        )
                    ),
                  ]),
            ),
            //  SizedBox(
            //     child: Stack(
            //   children: <Widget> [
            //     Positioned(
            //       top: 604.0,
            //       left: 320.0,
            //       child: ElevatedButton(
            //       style: const ButtonStyle(
            //           foregroundColor: MaterialStatePropertyAll(Colors.white),
            //           backgroundColor: MaterialStatePropertyAll(Colors.green),
            //           textStyle: MaterialStatePropertyAll(TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
            //     ),
            //         onPressed: (){
            //
            //         },
            //       child:  Text('TAP'),
            //       ),
            //     )],
            // ),
            // ),
          ]),
        ));
  }
}

