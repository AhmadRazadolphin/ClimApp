import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final newCityNameController = TextEditingController();

  String newCityName = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/2e0304f7f887881ec53ff3b2cb47f2cb.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  controller: newCityNameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: const Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    hintText: "Enter city name",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  // onChanged: (value){
                  //   newCityName = value;
                  //   print(newCityName);
                  // },
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(
                        context, newCityName = newCityNameController.text);
                  });
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
