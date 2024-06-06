
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class Car extends StatefulWidget {
  final double paddingTop;
  final String url;
  final double startPosition;
  final Offset directionBegin;
  final Offset directionEnd;
  final int timeTransition;

  const Car({Key? key,
    required this.paddingTop,
    required this.startPosition,
    required this.url, required this.directionBegin,
    required this.directionEnd,
    required this.timeTransition })
      : super(key: key);

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: widget.timeTransition ),
    vsync: this,
  )..repeat (reverse: false);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: widget.directionBegin,
    end:  widget.directionEnd,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _offsetAnimation,
        transformHitTests: true,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: widget.paddingTop, left:widget.startPosition),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.url)),
                ),
                alignment: Alignment.center,
                width: 80,
                height: 50,
              ),
            )
          ],
        ));
  }
}