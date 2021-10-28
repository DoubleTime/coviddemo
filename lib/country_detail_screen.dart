import 'package:coviddemo/api/api.dart';
import 'package:coviddemo/api/api_client.dart';
import 'package:coviddemo/api/models/statistic_response.dart';
import 'package:coviddemo/countries_screen.dart';
import 'package:flutter/material.dart';

class CountryDetailScreen extends StatefulWidget {
  final MyCountry myCountry;
  const CountryDetailScreen({Key? key, required this.myCountry})
      : super(key: key);

  static const routeName = '/countries/detail';

  @override
  _CountryDetailScreenState createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  Statistic? statistic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Api().getStatistic(widget.myCountry.name).then((StatisticResponse _) {
      if (_.response.length > 0) {
        setState(() => statistic = _.response[0]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.myCountry.name)),
        body: statistic == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cases",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      height: 200,
                      child: Row(
                        children: [
                          Expanded(
                              child: CardComponent(
                            title: "New Cases",
                            value: statistic?.cases?.newCase ?? "0",
                            title_color: Colors.black45,
                            value_color: Colors.red,
                            background_color: Colors.white,
                          )),
                          Expanded(
                              child: CardComponent(
                            title: "Active Cases",
                            value: statistic?.cases?.active.toString() ?? "0",
                            title_color: Colors.white,
                            value_color: Colors.white,
                            background_color: Colors.black,
                          ))
                        ],
                      )),
                ],
              )));
  }
}

class CardComponent extends StatelessWidget {
  final String title, value;
  final Color title_color, background_color, value_color;

  const CardComponent(
      {Key? key,
      required this.title,
      required this.value,
      required this.title_color,
      required this.background_color,
      required this.value_color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: background_color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(color: title_color)),
            Text(
              value,
              style: TextStyle(fontSize: 50, color: value_color),
            )
          ],
        ));
  }
}
