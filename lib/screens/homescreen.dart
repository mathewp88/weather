import 'package:flutter/material.dart';
import 'package:weather/util/weatherdata.dart';

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
  late Icon weatherDisplayIcon;

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature.round();
      ftemperature = weatherData.currentFTemperature.round();
      location = weatherData.location;
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: weatherDisplayIcon,
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                ' $temperature°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -5,
                ),
              ),
            ),
            Center(
              child: Text(
                ' $ftemperature°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1,
                ),
              ),
            ),
            Center(
              child: Text(
                'Feels Like $ftemperature°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1,
                ),
              ),
            ),
            Center(
              child: Text(
                'Humidity $humidity%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'City : $location',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
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
