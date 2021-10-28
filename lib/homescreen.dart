import 'package:coviddemo/countries_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String? username, password;
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon-tng.jpg",
                scale: 2.1,
              ),
              TextFormField(
                decoration: InputDecoration(
                    label: Text(
                  "Username ",
                  style: TextStyle(color: Colors.cyanAccent),
                )),
                validator: (String? _) {
                  if (_ != null && _.isEmpty) return "Username cannot empty";
                  return null;
                },
                onSaved: (_) {
                  username = _;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: pwController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
                onSaved: (_) {
                  password = _;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                ),
                obscureText: true,
              ),
              Container(
                margin: EdgeInsets.only(top: height / 10.5),
                child: ElevatedButton(
                    onPressed: () => setState(() => _onSubmit()),
                    child: Text("LOGIN")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onSubmit() {
    if (_formKey.currentState?.validate() != true) return;

    //Success no error in input
    _formKey.currentState?.save();

    Navigator.pushNamed(context, CountriesScreen.routeName,
        arguments: {'username': username, 'password': password});
  }
}
