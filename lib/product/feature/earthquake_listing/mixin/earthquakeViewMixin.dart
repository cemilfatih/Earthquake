import 'package:earthquake_listing/product/feature/earthquake_listing/view/earthquakeView.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../model/earthquakeModel.dart';

mixin earthquakeViewMixin {
   buildShowDialog(BuildContext context, List<Earthquake> snapshot, int index) {
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(snapshot![index].title.toString()),
            content: Text("Magnitude: ${snapshot[index].mag.toString()}\n"
                "Date: ${snapshot![index].date.toString()}\n"
                "Depth: ${snapshot[index].depth.toString()}\n"
                "Provider: ${snapshot[index].provider.toString()}"),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("Close"))
            ],
          );
        }
    );
  }

  void refreshPage(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const earthquakesDisplay()));
  }

  Widget loading(){
     return Lottie.network(
         'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json');
  }
}