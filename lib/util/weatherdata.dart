import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_icons/weather_icons.dart';

import 'locationfinder.dart';

const apiKey = '7b26c92417fd3678d52eac12dc870222';

class WeatherDisplayData {
  Icon weatherIcon;

  WeatherDisplayData({required this.weatherIcon});
}

class WeatherData {
  WeatherData({required this.locationData});

  LocationHelper locationData;
  late double currentTemperature;
  late double currentFTemperature;
  late int currentCondition;
  late String location;
  late int humidity;

  Future<void> getCurrentTemperature() async {
    Response response = await get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric'));

    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'];
        currentFTemperature = currentWeather['main']['feels_like'];
        currentCondition = currentWeather['weather'][0]['id'];
        location = currentWeather['name'];
        humidity = currentWeather['main']['humidity'];
      } catch (e) {
        print(e);
      }
    } else {
      print('Could not fetch temperature!');
    }
  }

  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondition < 300) {
      return WeatherDisplayData(
        weatherIcon: Icon(
          WeatherIcons.thunderstorm,
          size: 75.0,
        ),
      );
    } else if (currentCondition < 400) {
      return WeatherDisplayData(
        weatherIcon: Icon(
          WeatherIcons.rain,
          size: 75.0,
        ),
      );
    } else if (currentCondition < 600) {
      return WeatherDisplayData(
        weatherIcon: Icon(
          WeatherIcons.showers,
          size: 75.0,
        ),
      );
    } else if (currentCondition < 700) {
      return WeatherDisplayData(
        weatherIcon: Icon(
          WeatherIcons.snow,
          size: 75.0,
        ),
      );
    } else if (currentCondition > 800) {
      return WeatherDisplayData(
        weatherIcon: Icon(
          WeatherIcons.cloud,
          size: 75.0,
        ),
      );
    } else if (currentCondition < 770) {
      return WeatherDisplayData(
        weatherIcon: Icon(
          WeatherIcons.fog,
          size: 75.0,
        ),
      );
    } else if (currentCondition == 771 || currentCondition == 781) {
      return WeatherDisplayData(
        weatherIcon: Icon(
          WeatherIcons.tornado,
          size: 75.0,
        ),
      );
    } else {
      var now = new DateTime.now();
      if (now.hour >= 15) {
        return WeatherDisplayData(
          weatherIcon: Icon(
            FontAwesomeIcons.moon,
            size: 75.0,
            color: Colors.white,
          ),
        );
      } else {
        return WeatherDisplayData(
          weatherIcon: Icon(
            FontAwesomeIcons.solidSun,
            size: 75.0,
            color: Colors.white,
          ),
        );
      }
    }
  }
}
