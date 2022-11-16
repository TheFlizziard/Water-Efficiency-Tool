import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'home_page.dart';
import 'main.dart';

class ChartManager extends StatefulWidget {
  const ChartManager({super.key});

  @override
  _ChartManagerState createState() => _ChartManagerState();
}

class _ChartManagerState extends State<ChartManager> {
  List<_ConsumptionData> data = [
    _ConsumptionData('Jan', 35),
    _ConsumptionData('Feb', 28),
    _ConsumptionData('Mar', 34),
    _ConsumptionData('Apr', 32),
    _ConsumptionData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            series: <ChartSeries<_ConsumptionData, String>>[
              LineSeries<_ConsumptionData, String>(
                  dataSource: data,
                  xValueMapper: (_ConsumptionData consumption, _) => consumption.year,
                  yValueMapper: (_ConsumptionData consumption, _) => consumption.consumption,
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
  _ConsumptionData(this.year, this.consumption);

  final String year;
  final double consumption;
}
