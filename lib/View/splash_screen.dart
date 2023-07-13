import 'dart:async';

import 'package:covid_19/View/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const WorldStatesScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                    angle: _controller.value * 0.2 * math.pi, child: child);
              },
              // ignore: sized_box_for_whitespace
              child: Container(
                  height: 200,
                  width: 200,
                  child: const Center(
                    child: Image(image: AssetImage('images/virus.png')),
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            const Align(
                alignment: Alignment.center,
                child: Text(
                  'Covid-19 \n Tracking app',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
