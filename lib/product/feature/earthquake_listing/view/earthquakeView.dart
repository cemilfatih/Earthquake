import 'package:earthquake_listing/product/feature/earthquake_listing/mixin/earthquakeViewMixin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../../../widget/button/themeButton.dart';
import '../../../widget/card/card.dart';
import '../../../widget/search_bar/customSearchBar.dart';
import '../model/earthquakeModel.dart';
import '../service/earthquakeService.dart';


Future<List<Earthquake>> fetchData(){

  return earthquakeService().getEarthquakeData();
}

class earthquakesDisplay extends StatefulWidget with earthquakeViewMixin{
  const earthquakesDisplay({Key? key}) : super(key: key);

  @override
  State<earthquakesDisplay> createState() => _earthquakesDisplayState();

}



class _earthquakesDisplayState extends State<earthquakesDisplay> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customSearchBar(list: snapshot.data!),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: (){
                              earthquakesDisplay().buildShowDialog(context, snapshot.data!, index);
                              },
                            child: SizedBox(
                              child: earthquakeCard(
                                  snapshot.data![index].title.toString(),
                                  snapshot.data![index].mag.toString(),
                                  snapshot.data![index].date.toString())
                            ),

                          );
                        },
                      ),
                    ),
                  ],
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
