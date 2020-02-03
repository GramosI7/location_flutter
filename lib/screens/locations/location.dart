import 'package:flutter/material.dart';
import '../../main.dart';
import '../../models/location.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: ListView(
        children: locations
            .map((location) => GestureDetector(
                  child: Text(location.name),
                  onTap: () => _onLocationTap(context, location.id),
                ))
            .toList(),
      ),
    );
  }

  void _onLocationTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, LocationDetailRoute,
        arguments: {"id": locationID});
  }
}
