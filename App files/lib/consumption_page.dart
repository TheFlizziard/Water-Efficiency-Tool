import 'dart:convert';
import 'package:flutter/material.dart';

import 'line_chart_widget.dart';
import 'my_api.dart';

class ChartManager extends StatefulWidget {
  const ChartManager({super.key});

  @override
  _ChartManagerState createState() => _ChartManagerState();
}

class _ChartManagerState extends State<ChartManager> {
  late var dataChart;
  late var dataListTile;
  late var dataOne;
  late var appliancesName;

  @override
  void initState() {
    super.initState();
    dataChart = CallApi().getData('getall');
    dataListTile = CallApi().getData('getall');
    dataOne = CallApi().getOne('getone');
    appliancesName = CallApi().getAppliancesName('getappliances');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: FutureBuilder<dynamic>(
                  future: dataChart,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("DATAAAAAAAAAAAAAAAAAAAAA");
                      print(snapshot.data);
                      LineChartWidget chart = LineChartWidget(d: snapshot.data);
                      print('Print d in chart:');
                      print(chart.d);
                      return chart;
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: FutureBuilder<dynamic>(
                  future: dataListTile,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data);
                      List<String> appliancesNameList = snapshot.data.keys
                          .map<String>((e) => e.toString())
                          .toList();
                      return ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: appliancesNameList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: ThumbnailsManager(appliancesNameList[index]),//Image.asset("./asset/images/hanyang.png"),
                            title: Text(appliancesNameList[index]),
                            subtitle: Text("More information about the ${appliancesNameList[index]}"),
                            onTap: () =>setState(() {
                              String id = snapshot.data[appliancesNameList[index]]["_id"].toString();
                              //var x = snapshot.data[appliancesNameList[index]]['measurementsTotal'].toString();
                              dataChart = CallApi().getOne(id);
                            }),
                            trailing: Text(snapshot.data[appliancesNameList[index]]["measurementsTotal"].toString() + "L used")
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

ThumbnailsManager(var applianceType) {
  switch(applianceType) {
    case "Shower":{
        return Icon(Icons.question_mark);
      }
      break;
    case "Dishwasher":{
      return Icon(Icons.question_mark);//Image.asset("./asset/images/DishWasher.png");
    }
    break;
    case "Kitchen Sink":{
      return Icon(Icons.question_mark);//Image.asset("./asset/images/KitchenSink.png");
    }
    break;
    default:{
      return Icon(Icons.question_mark);
    }
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
