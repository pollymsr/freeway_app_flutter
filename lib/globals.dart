library my_firtapp_flutter.globals;

import 'dart:ui';

import 'package:flutter/cupertino.dart';

double topPolly = 610.0;
double leftPolly = 175.0;

const Offset leftToRightStart = Offset(-1, 0);
const Offset leftToRightEnd = Offset(1, 0);
const Offset RightToleftStart = Offset(1, 0);
const Offset RightToleftEnd = Offset(-1, 0);

int score = 0;

void setPoint() {
   score +=1;
}

 void pollyPosition(){
  if (topPolly == 0.0) {
    setPoint();
    topPolly = 610.0;
    leftPolly = 175.0;
  }
  //debugPrint('score: ${score}');
   return ;
}
void moveUp(){
  debugPrint("moveUP ${topPolly}");
  topPolly = topPolly - 50;
  debugPrint("moveUP after ${topPolly}");

}
