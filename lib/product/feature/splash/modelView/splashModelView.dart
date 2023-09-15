import 'package:earthquake_listing/product/feature/earthquake_listing/view/earthquakeView.dart';
import 'package:earthquake_listing/product/feature/splash/mixin/splashViewMixin.dart';
import 'package:flutter/material.dart';
import 'package:earthquake_listing/utility/enum/splashScreenEnum.dart';

import '../view/splashView.dart';


class splashView extends StatefulWidget with splashLogic{
   splashView({Key? key}) : super(key: key);

  @override
  State<splashView> createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: splashView().checkAppVersion(),
        builder: (BuildContext context,
            AsyncSnapshot<int> snapshot ){

          switch (snapshot.connectionState){
            case ConnectionState.none:
              return splashScreen();
            case ConnectionState.waiting:
              return splashScreen();
            case ConnectionState.done:

              return routerWidget(snapshot.data!);

          }
          throw Exception("Can not receive connection state info while getting version state");

        }
    );}
}



// Front ekibi buraya bakacak
Widget routerWidget(int data){

  if(data == splashScreenEnum.forceUpdate.screenCode) {
    return splashScreen();
  }else if(data == splashScreenEnum.home.screenCode){
    return earthquakesDisplay();
  }
  else if(data == splashScreenEnum.keeping.screenCode){
    return Container(
      child: Text("Keeping"),
    );
  }else if(data == splashScreenEnum.specialTheme.screenCode){
    return Container(
      child: Text("Special Theme"),
    );
  }

  throw Exception("Router Widget-Splash View// Screen Code Error code: $data");
}