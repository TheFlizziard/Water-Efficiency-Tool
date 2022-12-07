import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import './home_pie_chart.dart';
import './main.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.duration});

  final Duration duration;

  @override
  _HomeState createState() => _HomeState();
}

//Display all the data in the allData variable.
class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<int> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    animation = IntTween(begin: 0, end: 25)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    controller.forward();
  }

  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: "You used ",
                    style: const TextStyle(fontSize: 40),
                    children: <TextSpan>[
                      TextSpan(
                          text: "${animation.value.toString()}%",
                          style: const TextStyle(fontSize: 52)),
                    ],
                  ),
                ),
                Text(
                  ' of your monthly limit',
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  "\n\nThis month's water consumption: 3,250 liters",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Actual water usage limit: 13,000 liters',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/*Column(
      children: appliancesList
          .map(
            (element) => Card(
              child: Column(
                children: [
                  Text(
                    element.name,
                    style: optionStyle,
                  ),
                  Text(
                    element.name,
                    style: optionStyle,
                  ),
                ],
              ),
            ),
          )
          .toList(),
      /*appliancesList
          .map(
            (element) => Card(
              child: Column(
                children: [
                  Text(
                    element.name,
                    style: optionStyle,
                  ),
                ],
              ),
            ),
          )
          .toList(),*/
    ));
  }
}*/
