import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  const WeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(weather.city,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("${weather.temperature} °C",
                style: const TextStyle(fontSize: 20, color: Colors.blue)),
            const SizedBox(height: 8),
            Text(weather.description,
                style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
