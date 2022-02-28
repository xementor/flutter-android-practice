import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double maxSlide = 225.0;
    double slide = maxSlide + animationController.value;
    double scale = 1 - (animationController.value * 0.3);
    var blueC = Container(
      color: Colors.blue,
    );
    var yellowC = Container(
      color: Colors.yellow,
    );
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Stack'),
        // ),
        body: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, _) {
            return Stack(
              children: [
                blueC,
                Transform(
                  transform: Matrix4.identity()
                    ..scale(scale)
                    ..translate(slide),
                  alignment: Alignment.centerRight,
                  child: yellowC,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
