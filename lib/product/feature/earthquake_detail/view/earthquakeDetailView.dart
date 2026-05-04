import 'dart:ffi';

import 'package:earthquake_listing/core/init/theme/theme.dart';
import 'package:earthquake_listing/utility/enum/earthquakeVariablesEnum.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

import '../../earthquake_listing/model/earthquakeModel.dart';
import '../mixin/earthquakeDetailMixin.dart';

class earhtquakeDetailView extends StatefulWidget with earthquakeDetailMixin{

   earhtquakeDetailView({Key? key, required this.earthquake}) : super(key: key);

  final Earthquake earthquake;


  @override
  State<earhtquakeDetailView> createState() => _earhtquakeDetailViewState();

}

class _earhtquakeDetailViewState extends State<earhtquakeDetailView> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.earthquake.title!),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: _customRadarChart(widget: widget)),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.5,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding:  EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Magnitude"),
                              Text(widget.earthquake.mag.toString(),  style: themes().magnitude),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            width: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              color: Colors.red,
                              child: Center(child: Text('DANGER', style: themes().danger))
                            ),
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      title: Text(
                          "Depth: ${widget.earthquake.depth.toString()} \n\n"
                          "Date: ${widget.earthquake.date.toString()} \n\n"
                          "Provider: ${widget.earthquake.provider.toString()}\n"
                              ""),
                      leading: Icon(Icons.info_outline),

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _customRadarChart extends StatelessWidget {
  const _customRadarChart({
    super.key,
    required this.widget,

  });

  final earhtquakeDetailView widget;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: RadarChart(
        maxValue: double.parse(widget.earthquake.depth!)>10 ? 100:10,
        maxLinesForLabels: 1,
        labelWidth: 100,
        strokeColor: Colors.red,
        fillColor: Colors.blue,
        labelColor: Colors.white70,
        values: [
          double.parse(widget.earthquake.mag!),
          double.parse(widget.earthquake.depth!),
          double.parse(widget.earthquake.depth!),
        ],
        labels: [
          earthquakeVariablesEnum.mag.name,
          earthquakeVariablesEnum.depth.name,
          earthquakeVariablesEnum.depth.name,

        ],

      ),
    );
  }
}
