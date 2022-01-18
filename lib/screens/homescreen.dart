import 'package:flutter/material.dart';
import 'package:weather/util/weatherdata.dart';
import 'package:string_extensions/string_extensions.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.weatherData}) : super(key: key);

  final WeatherData weatherData;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int temperature;
  late int ftemperature;
  late int humidity;
  late String location;
  late String cond;
  late Icon weatherDisplayIcon;

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature.round();
      ftemperature = weatherData.currentFTemperature.round();
      location = weatherData.location;
      cond = weatherData.cond;
      humidity = weatherData.humidity;
      WeatherDisplayData weatherDisplayData =
          weatherData.getWeatherDisplayData();
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

  @override
  void initState() {
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.cached),
        backgroundColor: Colors.transparent,
        title: Text('Weather'),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              child: weatherDisplayIcon,
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                ' $temperature°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 75.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -5,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                cond.toTitleCase!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                'Feels Like $ftemperature°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                'Humidity $humidity%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                'City : $location',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
