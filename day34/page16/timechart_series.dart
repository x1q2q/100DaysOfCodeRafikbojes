import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataSales {
  final int tahun;
  final int sales;
  DataSales(this.tahun, this.sales);
  DateTime get date => DateTime(this.tahun, 1, 1);
}

List<DataSales> _getRandData() {
  final random = Random();
  return [
    for (int i = 2005; i < 2020; i++)
      DataSales(i, (i - 2000) * 40 + random.nextInt(100)),
  ];
}

class TimechartSeries extends StatefulWidget {
  @override
  _TimechartSeriesState createState() => _TimechartSeriesState();
}

class _TimechartSeriesState extends State<TimechartSeries> {
  bool _animasi = true;
  // bool _defInteraksi = true;
  // bool _incPoints = true;
  // bool _stacked = true;
  charts.BehaviorPosition _ttlPosition = charts.BehaviorPosition.bottom;
  charts.BehaviorPosition _lgnPosition = charts.BehaviorPosition.bottom;

  List<DataSales> _series1, _series2;

  void initState() {
    super.initState();
    this._series1 = _getRandData();
    this._series2 = _getRandData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 300,
          child: charts.TimeSeriesChart(
            [
              charts.Series<DataSales, DateTime>(
                  id: 'Sales-1',
                  colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                  domainFn: (DataSales sales, _) => sales.date,
                  measureFn: (DataSales sales, _) => sales.sales,
                  data: this._series1),
              charts.Series<DataSales, DateTime>(
                  id: 'Sales-2',
                  colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                  domainFn: (DataSales sales, _) => sales.date,
                  measureFn: (DataSales sales, _) => sales.sales,
                  data: this._series2),
            ],
            animate: this._animasi,
            behaviors: [
              charts.ChartTitle('Contoh sales timeseries',
                  behaviorPosition: _ttlPosition),
              charts.SeriesLegend(position: _lgnPosition),
              charts.LinePointHighlighter(
                showHorizontalFollowLine:
                    charts.LinePointHighlighterFollowLineType.all,
                showVerticalFollowLine:
                    charts.LinePointHighlighterFollowLineType.nearest,
              ),
            ],
          ),
        )
      ],
    );
  }
}
