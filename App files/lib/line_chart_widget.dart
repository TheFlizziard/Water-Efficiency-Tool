import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import './main.dart';

class LineChartWidget extends StatefulWidget {
  final d;

  LineChartWidget({super.key, required this.d});

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 500,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title:
            ChartTitle(text: "Water consumption over the last 12 months"),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          LineSeries<ChartData, String>(
              dataSource: MonthlyConsumption(widget.d),
              xValueMapper: (ChartData sales, _) => sales.month,
              yValueMapper: (ChartData sales, _) => sales.waterUsage,
              name: 'Water Usage (' + MyApp.volumeMetric +')',
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


//A function that calculates the total consumption of all the appliances by month
List<ChartData> MonthlyConsumption(var data) {
  print('Monthly:');
  print(data.toString());
  List<ChartData> monthlyConsumption = [];
  List<String> keys = data.keys.toList();
  for (int i = 0; i <= 11; i++) {
    double monthlySum = 0.0;
    if (keys.contains('_id')) {
      monthlySum += data["measurementsByMonth"][i];
    } else {
      for (int j = 0; j < data.length; j++) {
        monthlySum += data[keys[j]]["measurementsByMonth"][i];
      }
    }
    ChartData point = ChartData((i+1).toString(), monthlySum);
    monthlyConsumption.add(point);
  }
  return monthlyConsumption;
}