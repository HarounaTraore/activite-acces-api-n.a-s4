import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherController {
  final String apiKey = "bf9e46e015f24e2952164aea378a196f"; 

  Future<Weather?> fetchWeather(String city) async {
    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric&lang=fr",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Weather.fromJson(data);
    } else {
      return null; // erreur
    }
  }
}
