import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataHarga {
  final String kategori;
  final int harga;
  const DataHarga(this.kategori, this.harga);
}

class PiechartSeries extends StatefulWidget {
  const PiechartSeries({Key key}) : super(key: key);

  @override
  _PiechartSeriesState createState() => _PiechartSeriesState();
}

class _PiechartSeriesState extends State<PiechartSeries> {
  bool _animasi = true;
  double _arcRatio = 0.8;
  charts.ArcLabelPosition _arcLabelPosition = charts.ArcLabelPosition.auto;
  charts.BehaviorPosition _titlePostion = charts.BehaviorPosition.bottom;
  charts.BehaviorPosition _legendPosition = charts.BehaviorPosition.bottom;

  List<DataHarga> _data = [
    DataHarga('voucher', 15000),
    DataHarga('temp.glass', 10000),
    DataHarga('earphone', 25000),
    DataHarga('casing', 10000),
  ];

  @override
  Widget build(BuildContext context) {
    final _colorPalett =
        charts.MaterialPalette.getOrderedPalettes(this._data.length);

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
            height: 300,
            child: charts.PieChart(
              [
                charts.Series<DataHarga, String>(
                  id: 'Sales-1',
                  colorFn: (_, idx) => _colorPalett[idx].shadeDefault,
                  domainFn: (DataHarga sales, _) => sales.kategori,
                  measureFn: (DataHarga sales, _) => sales.harga,
                  data: this._data,
                  labelAccessorFn: (DataHarga row, _) =>
                      '${row.kategori}: ${row.harga}',
                ),
              ],
              animate: this._animasi,
              defaultRenderer: new charts.ArcRendererConfig(
                  arcRatio: this._arcRatio,
                  arcRendererDecorators: [
                    charts.ArcLabelDecorator(
                        labelPosition: this._arcLabelPosition)
                  ]),
              behaviors: [
                charts.ChartTitle(
                  'Contoh Chart Harga',
                  behaviorPosition: this._titlePostion,
                ),
                charts.DatumLegend(
                  position: this._legendPosition,
                  desiredMaxColumns: 2,
                )
              ],
            ))
      ],
    );
  }
}
