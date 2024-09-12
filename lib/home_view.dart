import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeView"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  List<ChartData> bcgData = [
                    ChartData(
                        DateTime(2023, 01, 01, 00, 00), Random().nextInt(150)),
                    ChartData(
                        DateTime(2023, 01, 01, 00, 05), Random().nextInt(150)),
                    ChartData(
                        DateTime(2023, 01, 01, 00, 10), Random().nextInt(150)),
                    ChartData(
                        DateTime(2023, 01, 01, 00, 15), Random().nextInt(150)),
                    ChartData(
                        DateTime(2023, 01, 01, 00, 20), Random().nextInt(150)),
                    ChartData(
                        DateTime(2023, 01, 01, 00, 25), Random().nextInt(150)),
                    ChartData(
                        DateTime(2023, 01, 01, 00, 30), Random().nextInt(150)),
                    ChartData(
                        DateTime(2023, 01, 01, 00, 35), Random().nextInt(150)),
                    ChartData(
                        DateTime(2023, 01, 01, 00, 40), Random().nextInt(150)),
                    ChartData(
                        DateTime(2023, 01, 01, 00, 45), Random().nextInt(150)),
                    ChartData(
                        DateTime(2023, 01, 01, 00, 50), Random().nextInt(150)),
                    ChartData(
                        DateTime(2023, 01, 01, 00, 55), Random().nextInt(150)),
                    ChartData(
                        DateTime(2023, 01, 01, 01, 00), Random().nextInt(150)),
                  ];

                  List<ChartData> insulinData = [
                    ChartData(DateTime(2023, 01, 01, 00, 00), 0),
                    ChartData(DateTime(2023, 01, 01, 00, 05), 1),
                    ChartData(DateTime(2023, 01, 01, 00, 10), 2),
                    ChartData(DateTime(2023, 01, 01, 00, 15), 2),
                    ChartData(DateTime(2023, 01, 01, 00, 20), 2),
                    ChartData(DateTime(2023, 01, 01, 00, 25), 1),
                    ChartData(DateTime(2023, 01, 01, 00, 30), 2),
                    ChartData(DateTime(2023, 01, 01, 00, 35), 4),
                    ChartData(DateTime(2023, 01, 01, 00, 40), 3),
                    ChartData(DateTime(2023, 01, 01, 00, 45), 2),
                    ChartData(DateTime(2023, 01, 01, 00, 50), 1),
                    ChartData(DateTime(2023, 01, 01, 00, 55), 2),
                    ChartData(DateTime(2023, 01, 01, 01, 00), 1),
                  ];
                  return SfCartesianChart(
                    primaryXAxis: DateTimeAxis(
                      dateFormat: DateFormat('HH:mm'),
                      interval: 5,
                      majorGridLines: const MajorGridLines(width: 1),
                      majorTickLines: const MajorTickLines(width: 1),
                    ),
                    primaryYAxis: const NumericAxis(
                      minimum: 0,
                      maximum: 150,
                      interval: 10,
                      majorGridLines: MajorGridLines(width: 0),
                    ),
                    axes: const <ChartAxis>[
                      NumericAxis(
                        name: 'yAxisInsulin',
                        minimum: 0,
                        maximum: 24,
                        interval: 1,
                        opposedPosition: true,
                        isInversed: true,
                        majorGridLines: MajorGridLines(width: 0),
                      ),
                      //xAxisInsulin?
                    ],
                    series: <CartesianSeries<dynamic, dynamic>>[
                      LineSeries<ChartData, DateTime>(
                        dataSource: bcgData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                      ),
                      BarSeries<ChartData, DateTime>(
                        dataSource: insulinData,
                        color: Colors.grey[600],
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        yAxisName: 'yAxisInsulin',
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final int y;
}
