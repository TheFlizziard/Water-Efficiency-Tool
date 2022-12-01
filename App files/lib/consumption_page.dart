import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'TestWidget.dart';
import 'home_page.dart';
import 'line_chart_widget.dart';
import 'main.dart';
import 'my_api.dart';

class ChartManager extends StatefulWidget {
  const ChartManager({super.key});

  @override
  _ChartManagerState createState() => _ChartManagerState();
}

class _ChartManagerState extends State<ChartManager> {
  late var data;

  @override
  void initState() {
    super.initState();
    data = CallApi().getData('getall');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<dynamic>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot);
              return LineChartWidget(d: snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}




/*
        body: Column(children: [
          //Initialize the chart widget
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Water consumption over the last months'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<Appliance, String>>[
                LineSeries<Appliance, String>(
                  dataSource: appliancesList,
                  xValueMapper: (Appliance a, _) =>
                  a.totalConsumption,
                  yValueMapper: (Appliance a, _) =>
                  a.totalConsumption,
                  name: 'Consumption',
                  // Enable data label
                  //dataLabelSettings: DataLabelSettings(isVisible: true)
                )
              ]),
          /*Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            //Initialize the spark charts widget
            child: SfSparkLineChart.custom(
              //Enable the trackball
              trackball: SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap),
              //Enable marker
              marker: SparkChartMarker(
                  displayMode: SparkChartMarkerDisplayMode.all),
              //Enable data label
              labelDisplayMode: SparkChartLabelDisplayMode.all,
              xValueMapper: (int index) => data[index].year,
              yValueMapper: (int index) => data[index].sales,
              dataCount: 5,
            ),
          ),
        )*/
        ])
    );
  }
}

class _ConsumptionData {
  _ConsumptionData(this.date, this.consumption, this.applianceName);

  final String date;
  final double consumption;
  final String applianceName;

  Future<void> plotUpdate() async {
    var appliancesName = [];
    var consumptionDate = [];
    var consumptionAmount = [];
  }
}


*/
