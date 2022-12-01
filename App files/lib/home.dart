import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import './home_pie_chart.dart';
import './main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

//Display all the data in the allData variable.
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Display the data in the allData variable.
            //Text(allData),
            //Display the pie chart.
            //HomePieChart(),
          ],
        ),
      ),
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
