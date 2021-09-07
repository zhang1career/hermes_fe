import 'package:flutter/material.dart';
import '../vo/indicator_vo.dart';
import '../util/utils.dart';
import 'indicator_page.dart';

class IndicatorListPage extends StatelessWidget {
  IndicatorListPage(
      {Key? key, required this.title, required this.indicatorVoList})
      : super(key: key);

  final String title;
  final Future<List<IndicatorVo>> indicatorVoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: FutureBuilder<List<IndicatorVo>>(
                future: this.indicatorVoList,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    default:
                      if (snapshot.hasError) {
                        return new Text('Error: ${snapshot.error}');
                      }
                      return _buildListView(snapshot.data);
                  }
                })));
  }

  Widget _buildListView(List<IndicatorVo>? indicatorVoList) {
    return ListView.builder(
      itemCount: indicatorVoList!.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(indicatorVoList[index].name),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IndicatorPage(),
                settings: RouteSettings(
                  arguments: indicatorVoList[index],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildGridView(
      BuildContext context, List<IndicatorVo>? indicatorVoList) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(1.5),
      crossAxisCount: determineCrossAxisCount(context),
      childAspectRatio: 1.2,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: _prepareIndicatorInfoCards(indicatorVoList),
      //new Cards()
      shrinkWrap: true,
    );
  }

  List<Widget> _prepareIndicatorInfoCards(List<IndicatorVo>? indicatorVoList) {
    List<Widget> indicatorInfoCells = [];
    // we can call the rest service here?
    for (IndicatorVo indicatorVo in indicatorVoList!) {
      indicatorInfoCells.add(_getIndicatorInfoCard(indicatorVo));
    }

    return indicatorInfoCells;
  }

  Container _getIndicatorInfoCard(IndicatorVo indicatorVo) {
    return new Container(
        width: 200.0,
        height: 300.0,
        child: Card(
          elevation: 2.0,
          color: _getColorByAstLevel(indicatorVo),
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: _prepareStatusText(indicatorVo)),
        ));
  }

  List<Widget> _prepareStatusText(IndicatorVo indicatorVo) {
    final TextStyle textStyle =
        TextStyle(fontWeight: FontWeight.bold, height: 3);
    return <Widget>[
      new Center(
        child: new Text(indicatorVo.name.toUpperCase(), style: textStyle),
      ),
      new Center(
        child: _createAst(indicatorVo),
      ),
    ];
  }

  Widget? _createAst(IndicatorVo indicatorVo) {
    final TextStyle textStyle =
        TextStyle(fontWeight: FontWeight.bold, height: 3);
    return new Text(indicatorVo.expression, style: textStyle);
  }

  Color? _getColorByAstLevel(IndicatorVo indicatorVo) {
    if (indicatorVo.isLeaf()) {
      return Colors.teal[600];
    } else {
      return Colors.red[200];
    }
  }
}
