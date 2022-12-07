import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import './home_pie_chart.dart';
import './main.dart';
import 'my_api.dart';

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
  late var currentConsumption;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    currentConsumption = CallApi().getCurrentConsumption();
    print(currentConsumption.toString());
    animation = IntTween(
            begin: 0, end: 100)
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
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: FutureBuilder<dynamic>(
                future: currentConsumption,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    animation = IntTween(
                        begin: 0, end: (snapshot.data.toDouble()*100/13000).toInt())
                        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
                    return Text.rich(
                      TextSpan(
                        text: "You used ",
                        style: const TextStyle(fontSize: 40),
                        children: <TextSpan>[
                          TextSpan(
                              text: "${animation.value.toString()}%",
                              style: const TextStyle(fontSize: 52)),
                          TextSpan(
                              text:' of your monthly limit',
                              style: TextStyle(fontSize: 40)
                          ),
                          TextSpan(
                            text:"\n\nThis month's water consumption: ${snapshot.data} liters",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextSpan(
                            text:'\nActual water usage limit: 13,000 liters',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
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
