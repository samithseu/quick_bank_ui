import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Map',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
