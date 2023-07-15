import 'package:clima/screen/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});
  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel _weatherModel = WeatherModel();

  int temperature = 0;
  String weatherIcon = " ";
  String cityName = " ";
  String weatherMessage = " ";

  @override
  void initState() {
    super.initState();
    upDataUi(widget.locationWeather);
    // print('widget');
  }

  void upDataUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = ' ';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      temperature = temperature;
      var weather = weatherData['weather'][0]['id'];
      weatherIcon = _weatherModel.getWeatherIcon(weather);
      weatherMessage = _weatherModel.getMessage(temperature);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/pexels-tahir-shaw-186980.jpg'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData =
                          await _weatherModel.getLocationWeather();
                      upDataUi(weatherData);
                      // print('weatherData');
                      // print(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const CityScreen();
                      }));

                      if (typedName != null) {
                        var weatherData =
                            await _weatherModel.getCityweather(typedName);
                        upDataUi(weatherData);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $cityName!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: [
          //     Row(
          //       children: [
          //         FlatButton(
          //             onPressed: (){},
          //             child: Icon(
          //               Icons.near_me,
          //               size: 50,
          //             )),
          //         FlatButton(
          //             onPressed: (){},
          //             child: Icon(
          //               Icons.location_city,
          //               size: 50,
          //             )),
          //       ],
          //     ),
          //     Padding(padding: EdgeInsets.only(left: 15),
          //     child: Row(
          //       children: [
          //         Text('32'),
          //         Text('32'),
          //       ],
          //     ),
          //     ),
          //     Padding(padding: EdgeInsets.only(left: 14),
          //     child: Text("It's time to Islamabad",textAlign: TextAlign.right,),
          //     )
          //
          //   ],
          // ),
        ),
      ),
    );
  }
}
