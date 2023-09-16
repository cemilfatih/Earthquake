import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget earthquakeCard(String title, String mag, String date) => Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: ListTile(
    title: Text(title),
    subtitle: Text("Magnitude: $mag"),
    leading: Icon(Icons.data_exploration_sharp),
    trailing: Text(date),
  ),
);