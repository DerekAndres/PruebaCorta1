import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: WeatherScreen(),
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'Arial',
      ),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  final Map<String, dynamic> weatherData = {
    'date': 'Jun 2',
    'city': 'London',
    'temperature': '21°C',
    'description': 'Overcast Clouds',
    'temperatureDetails': {
      '8 PM': '21°C',
      '11 PM': '22°C',
    },
    'otherDetails': {
      'min': '21°C',
      'max': '22°C',
      'pressure': '1020 Pa',
      'humidity': '41%'
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${weatherData['date']}', style: TextStyle(color: Colors.black)),
            Text('${weatherData['city']}', style: TextStyle(color: Colors.black, fontSize: 16))
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${weatherData['temperature']}',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color.fromARGB(210, 255, 217, 2)),
            ),
            Text(
              weatherData['description'],
              style: TextStyle(fontSize: 24, color: Colors.black54),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Today', style: TextStyle(fontSize: 16, color: Colors.black)),
                Text('This Week', style: TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
            SizedBox(height: 20),
            Text('Temperatures', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.wb_cloudy, color: Colors.blue),
                    Text('${weatherData['temperatureDetails']['8 PM']}'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.wb_cloudy, color: Colors.blue),
                    Text('${weatherData['temperatureDetails']['11 PM']}'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Minimum', style: TextStyle(fontSize: 16)),
                    Text('${weatherData['otherDetails']['min']}'),
                  ],
                ),
                Column(
                  children: [
                    Text('Maximum', style: TextStyle(fontSize: 16)),
                    Text('${weatherData['otherDetails']['max']}'),
                  ],
                ),
                Column(
                  children: [
                    Text('Pressure', style: TextStyle(fontSize: 16)),
                    Text('${weatherData['otherDetails']['pressure']}'),
                  ],
                ),
                Column(
                  children: [
                    Text('Humidity', style: TextStyle(fontSize: 16)),
                    Text('${weatherData['otherDetails']['humidity']}%'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
