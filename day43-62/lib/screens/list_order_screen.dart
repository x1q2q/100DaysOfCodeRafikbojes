import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:konterapps/config/configs.dart';
import 'package:konterapps/data/detail_order.dart';
import 'package:konterapps/widgets/widgets.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:konterapps/data/data_chart.dart';

class ListOrderScreen extends StatefulWidget {
  @override
  _ListOrderScreenState createState() => _ListOrderScreenState();
}

class _ListOrderScreenState extends State<ListOrderScreen> {
  List<Map<String, dynamic>> listOrderContainer1;
  String titleTabBar = 'Statistik Informasi';
  double devHeight;

  List<DataSales> _dtTimeChart1, _dtTimeChart2;
  List<DataHarga> _dtPieChart;
  @override
  void initState() {
    super.initState();
    this._dtTimeChart1 = dataSales1;
    this._dtTimeChart2 = dataSales2;
    this._dtPieChart = dataHarga;
    listOrderContainer1 = [
      {'title': '', 'boxWidget': _tabListOrder()},
      {'title': titleTabBar, 'boxWidget': _boxStatistik()}
    ];
  }

  Widget _tabListOrder() {
    void _ubahNilai(index) {
      this.titleTabBar = index == 1 ? 'Timeline Order' : 'Statistik Informasi';
      this.listOrderContainer1 = [
        {'title': '', 'boxWidget': _tabListOrder()},
        {
          'title': this.titleTabBar,
          'boxWidget': index == 1 ? _boxTimeline() : _boxStatistik()
        },
      ];
    }

    return DefaultTabController(
        length: 2,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.orange[100],
            borderRadius: BorderRadius.circular(25),
          ),
          child: TabBar(
            tabs: <Widget>[Text('Statistik & Chart'), Text('Timeline')],
            onTap: (index) {
              setState(() {
                _ubahNilai(index);
              });
            },
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: AppColors.orange2,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.orange,
          ),
        ));
  }

  Widget _cardTimeLine(Map<String, dynamic> dataTL, int id) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.orange1, width: 2)),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Row(
        children: <Widget>[
          Opacity(
            child: dataTL['icon'],
            opacity: 0.5,
          ),
          SizedBox(width: 16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                dataTL['jenis'],
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 6),
              Text(
                dataTL['detail'] + '- ' + dataTL['tgl'],
                style: TextStyle(fontSize: 14),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget _boxTimeline() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: detailOrders.length,
        itemBuilder: (BuildContext context, int id) {
          Map<String, dynamic> dataTL = {
            'icon': detailOrders[id].icon,
            'jenis': detailOrders[id].jenis,
            'detail': detailOrders[id].detail,
            'tgl': detailOrders[id].tgl
          };
          return TimelineTile(
            alignment: TimelineAlign.left,
            isFirst: id == 0 ? true : false,
            isLast: id + 1 == detailOrders.length ? true : false,
            topLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
            rightChild: _cardTimeLine(dataTL, id),
            bottomLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
          );
        },
      ),
    );
  }

  Widget _cardStats(String judul, String jml, Color warna) {
    _boxStatsTxtStyle(Color warna, double size) {
      return TextStyle(
          fontFamily: 'FormulaCond',
          color: warna,
          fontSize: size,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w500);
    }

    return Expanded(
        child: Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(6),
      decoration:
          BoxDecoration(color: warna, borderRadius: BorderRadius.circular(4)),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Text(judul,
                          style: _boxStatsTxtStyle(Colors.white70, 16))),
                  Icon(Icons.show_chart, size: 16, color: Colors.white70)
                ]),
            Text(jml, style: _boxStatsTxtStyle(Colors.white, 20))
          ]),
    ));
  }

  Widget _boxStats() {
    return Container(
      height: 220,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _cardStats('Total Barang', '125 lusin', Colors.red[700]),
                _cardStats('Penjualan', 'Rp.15jt', Colors.amber),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _cardStats('Keuntungan', 'Rp.4jt', Colors.green[500]),
                _cardStats('Modal', 'Rp.20jt', Colors.blue),
                _cardStats('Modal2', 'Rp.20jt', Colors.indigo[700]),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _boxTimeSeries() {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 5.0),
            Text(
              'Chart Penjualan',
              style: Styles.boxColTextStyle,
            ),
            Container(
              height: 300,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  boxShadow: [Styles.boxCardShdStyle],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: charts.TimeSeriesChart(
                [
                  charts.Series<DataSales, DateTime>(
                      id: 'Sales-1',
                      colorFn: (_, __) =>
                          charts.MaterialPalette.blue.shadeDefault,
                      domainFn: (DataSales sales, _) => sales.date,
                      measureFn: (DataSales sales, _) => sales.sales,
                      data: this._dtTimeChart1),
                  charts.Series<DataSales, DateTime>(
                      id: 'Sales-2',
                      colorFn: (_, __) =>
                          charts.MaterialPalette.red.shadeDefault,
                      domainFn: (DataSales sales, _) => sales.date,
                      measureFn: (DataSales sales, _) => sales.sales,
                      data: this._dtTimeChart2),
                ],
                animate: true,
                behaviors: [
                  charts.ChartTitle('Penjualan All Time',
                      behaviorPosition: charts.BehaviorPosition.bottom),
                  charts.SeriesLegend(position: charts.BehaviorPosition.bottom),
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
        ));
  }

  Widget _boxPieSeries() {
    final _colorPalett =
        charts.MaterialPalette.getOrderedPalettes(this._dtPieChart.length);

    return Container(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 5.0),
              Text(
                'Chart Barang',
                style: Styles.boxColTextStyle,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: [Styles.boxCardShdStyle],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 300,
                child: charts.PieChart(
                  [
                    charts.Series<DataHarga, String>(
                      id: 'Sales-1',
                      colorFn: (_, idx) => _colorPalett[idx].shadeDefault,
                      domainFn: (DataHarga sales, _) => sales.kategori,
                      measureFn: (DataHarga sales, _) => sales.harga,
                      data: this._dtPieChart,
                      labelAccessorFn: (DataHarga row, _) =>
                          '${row.kategori}: ${row.harga}',
                    ),
                  ],
                  animate: true,
                  defaultRenderer: new charts.ArcRendererConfig(
                      arcRatio: 0.5,
                      arcRendererDecorators: [
                        charts.ArcLabelDecorator(
                            labelPosition: charts.ArcLabelPosition.auto)
                      ]),
                  behaviors: [
                    charts.ChartTitle(
                      'Semua Barang',
                      behaviorPosition: charts.BehaviorPosition.bottom,
                    ),
                    charts.DatumLegend(
                      position: charts.BehaviorPosition.bottom,
                      desiredMaxColumns: 2,
                    )
                  ],
                ),
              )
            ]));
  }

  Widget _boxStatistik() {
    return Column(children: <Widget>[
      _boxStats(),
      _boxTimeSeries(),
      _boxPieSeries(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TabAppBar(
        title: 'List Order',
        tipe: 'ListOrder',
      ),
      body: SingleChildScrollView(
          child: ContainerBoxRadius(containerPage: listOrderContainer1)),
    );
  }
}
