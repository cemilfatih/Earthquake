import 'package:earthquake_listing/product/constants/colors.dart';
import 'package:earthquake_listing/product/feature/earthquake_listing/mixin/earthquakeViewMixin.dart';
import 'package:earthquake_listing/product/widget/card/card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../feature/earthquake_listing/model/earthquakeModel.dart';

class customSearchDelegate extends SearchDelegate with earthquakeViewMixin{


  customSearchDelegate({required this.list});

  late List<Earthquake> list;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: (){
      this.close(context, false);
    }, icon: Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {

    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Earthquake> matchedList = [];

    for (var model in list){
      if(model.title!.toLowerCase().contains(query.toLowerCase())){
        matchedList.add(model);
      }
    }

    return _buildListView(matchedList, matchedList.length);
  }

  ListView _buildListView(List<Earthquake> list, int count) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index){
        return GestureDetector(
          onTap: (){
            
            customSearchDelegate(list: list ).buildShowDialog(context, list , index);
          },
          child: SizedBox(
            child: earthquakeCard(
              
              list[index].title!,
              list[index].mag!,
              list[index].date!,
              
            ),
          ),
        );
      });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildListView(list, 3);
  }

}

class customSearchBar extends StatelessWidget {
  const customSearchBar({Key? key, required this.list}) : super(key: key);

  final List<Earthquake> list;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onTap: (){
        showSearch(context: context, delegate: customSearchDelegate(list: list));
      },
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: IconButton(
          onPressed: (){
            showSearch(context: context, delegate: customSearchDelegate(list: list));
          },
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
