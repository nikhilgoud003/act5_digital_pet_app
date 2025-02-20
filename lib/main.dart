import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: DigitalPetApp(),
  ));
}

class DigitalPetApp extends StatefulWidget {
  const DigitalPetApp({super.key});

  @override
  _DigitalPetAppState createState() => _DigitalPetAppState();
}

class _DigitalPetAppState extends State<DigitalPetApp> {
  String petName = "";
  int happinessLevel = 50;
  int hungerLevel = 50;
  int energyLevel = 50;
  String moodIndicator = "Neutral";
  IconData moodIcon = Icons.sentiment_satisfied_alt;
  bool isNameSet = false;
  bool gameOver = false;
  bool gameWon = false;
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Digital Pet App')),
      body: Center(
        child: isNameSet ? _buildGameUI() : _buildNameInputScreen(),
      ),
    );
  }

  Widget _buildNameInputScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Enter your pet's name:",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: _nameController,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Pet's Name",
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            setState(() {
              petName = _nameController.text.trim();
              isNameSet = true;
            });
          },
          child: const Text("Set Name"),
        ),
      ],
    );
  }

  Widget _buildGameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Your pet Name: $petName', style: const TextStyle(fontSize: 20.0)),
        const SizedBox(height: 16.0),
        Text('$moodIndicator',
            style: TextStyle(fontSize: 30, color: _getPetColor())),
        Icon(moodIcon, color: _getPetColor(), size: 30),
        const SizedBox(height: 16.0),
        Text('Happiness Level: $happinessLevel',
            style: const TextStyle(fontSize: 20.0)),
        Text('Hunger Level: $hungerLevel',
            style: const TextStyle(fontSize: 20.0)),
        Text('Energy Level: $energyLevel',
            style: const TextStyle(fontSize: 20.0)),
      ],
    );
  }

  Color _getPetColor() {
    if (happinessLevel > 70) {
      return Colors.green;
    } else if (happinessLevel >= 30) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  void _updateMood() {
    setState(() {
      if (happinessLevel > 70) {
        moodIndicator = "Happy";
        moodIcon = Icons.sentiment_satisfied_alt;
      } else if (happinessLevel >= 30) {
        moodIndicator = "Neutral";
        moodIcon = Icons.sentiment_satisfied;
      } else {
        moodIndicator = "Unhappy";
        moodIcon = Icons.sentiment_very_dissatisfied;
      }
    });
  }
}
