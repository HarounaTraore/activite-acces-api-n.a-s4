import 'package:flutter/material.dart';
import '../controllers/weather_controller.dart';
import '../models/weather_model.dart';
import 'weather_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final WeatherController _controller = WeatherController();
  final TextEditingController _cityController = TextEditingController();

  Weather? _weather;
  bool _isLoading = false;

  Future<void> _getWeather() async {
    setState(() => _isLoading = true);

    final weather = await _controller.fetchWeather(_cityController.text);

    setState(() {
      _isLoading = false;
      _weather = weather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Application Météo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: "Entrez le nom de la ville",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getWeather,
              child: const Text("Obtenir la météo"),
            ),
            const SizedBox(height: 20),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_weather != null)
              WeatherWidget(weather: _weather!)
            else
              const Text("Aucune donnée"),
          ],
        ),
      ),
    );
  }
}
