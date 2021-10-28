import 'package:coviddemo/country_detail_screen.dart';
import 'package:flutter/material.dart';

class CountriesScreen extends StatefulWidget {
  final String username;
  final String? password;

  const CountriesScreen({Key? key, required this.username, this.password})
      : super(key: key);

  static const routeName = '/countries';

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<String> countries = ['Malaysia', 'Singapore', 'Thailand'];
  List<String> imageArray = ['Malaysia.jpg', 'Singapore.jpg', 'Thailand.jpg'];
  List<MyCountry> myCountries = [];
  @override
  void initState() {
    super.initState();
    countries.add('Indonesia');
    countries.add('Brunei');

    for (String name in countries) {
      myCountries.add(MyCountry(name, name + ".jpg", "qisijun", "MY"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.username)),
        body: ListView.separated(
            separatorBuilder: (c, i) => Divider(
                  thickness: 2.0,
                ),
            itemCount: myCountries.length,
            itemBuilder: (context, int index) {
              return ListTile(
                  leading:
                      Image.asset('assets/${myCountries[index].imageName}'),
                  title: Text(myCountries[index].name),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  subtitle: Text(myCountries[index].subtitle),
                  onTap: () => Navigator.of(context).pushNamed(
                      CountryDetailScreen.routeName,
                      arguments: {'myCountry': myCountries[index]}));
            }));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MyCountry {
  String name;
  String imageName;
  String subtitle;
  String countryCode;

  MyCountry(this.name, this.imageName, this.subtitle, this.countryCode);
}
