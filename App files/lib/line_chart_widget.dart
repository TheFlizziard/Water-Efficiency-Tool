//Create a line chart using the LineChart widget and pass the data to it.
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import './main.dart';

class LineChartWidget extends StatefulWidget {
  final d;

  LineChartWidget({this.d});

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState(d: d);
}

class _LineChartWidgetState extends State<LineChartWidget> {
  final d;

  _LineChartWidgetState({this.d});

  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title:
            ChartTitle(text: d['Dishwasher']['measurementsTotal'].toString()),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          LineSeries<ChartData, String>(
              dataSource: MonthlyConsumption(d['Dishwasher']['measurementsByMonth']),
              xValueMapper: (ChartData sales, _) => sales.month,
              yValueMapper: (ChartData sales, _) => sales.waterUsage,
              name: 'Water Usage',
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.month, this.waterUsage);

  final String month;
  final double waterUsage;
}

List<ChartData> MonthlyConsumption(List<dynamic> ConsumptionValues) {
  List<ChartData> cData = [];
  ConsumptionValues.asMap().forEach(
      (index, value) => {cData.add(ChartData(index.toString(), value.toDouble()))});

  return cData;
}
