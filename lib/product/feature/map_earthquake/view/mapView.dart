import 'package:flutter/material.dart';


class EarthquakeMap extends StatefulWidget {
  const EarthquakeMap({Key? key}) : super(key: key);

  @override
  State<EarthquakeMap> createState() => _EarthquakeMapState();
}

class _EarthquakeMapState extends State<EarthquakeMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Earthquake Map"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Earthquake Map", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text("Map will be here"),
          ],
        ),
      ),
    );
  }
}
