import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '6f1281eab00e998fe57eafa7cdad225e';
const url = 'https://api.openweathermap.org/data/2.5/weather';

// https://api.openweathermap.org/data/2.5/weather?q=London&appid=6f1281eab00e998fe57eafa7cdad225e&units=metric

class WeatherModel {

  Future<dynamic> getCityweather(String newCityName) async {

    NetworkingHealper networkingHealper = NetworkingHealper(url:
    '$url?q=$newCityName&appid=$apiKey&units=metric');

    var weatherData = await networkingHealper.getdata();
    return weatherData;

  }

  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkingHealper networkingHealper = NetworkingHealper(url:
    '$url?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkingHealper.getdata();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
