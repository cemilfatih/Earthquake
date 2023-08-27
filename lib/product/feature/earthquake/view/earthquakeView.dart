import 'package:earthquake/core/init/notifier/theme_notifier.dart';
import 'package:earthquake/product/feature/earthquake/model/earthquakeModel.dart';
import 'package:earthquake/product/widget/button/themeButton.dart';
import 'package:earthquake/product/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/earthquakeService.dart';
import 'package:earthquake/product/feature/earthquake/model/earthquakeModel.dart';



class earthquakesDisplay extends StatefulWidget {
  const earthquakesDisplay({Key? key}) : super(key: key);

  @override
  State<earthquakesDisplay> createState() => _earthquakesDisplayState();
}

class _earthquakesDisplayState extends State<earthquakesDisplay> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Earthquake App"),
        actions: [
          iconButton(
            icon: const Icon(Icons.refresh),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  earthquakesDisplay()));
            },
          ),],
        leading: iconButton(
          icon: const Icon(Icons.change_circle_outlined),
          onPressed: (){
            context.read<ThemeNotifier>().changeTheme();
          },
        )),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text("Recent Earthquakes", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            
            Expanded(
              child: FutureBuilder(
              future: earthquakeService().getEarthquakeData(),
              builder: (context, AsyncSnapshot<List<Earthquake>> snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text(snapshot.data![index].title.toString()),
                                content: Text("Magnitude: ${snapshot.data![index].mag.toString()}\n"
                                    "Date: ${snapshot.data![index].date.toString()}\n"
                                    "Depth: ${snapshot.data![index].depth.toString()}\n"
                                    "Provider: ${snapshot.data![index].provider.toString()}"),
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

                      },
                      child: SizedBox(
                        child: earthquakeCard(
                            snapshot.data![index].title.toString(),
                            snapshot.data![index].mag.toString(),
                            snapshot.data![index].date.toString())
                      ),

                    );
                  },
                );
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
          },
        ),
            )
          ]
        ),
      ));
  }
}
