import 'package:flutter/material.dart';
import 'package:wikipediaapp/ui/viewmodels/suggestions_list.dart';
import 'package:wikipediaapp/ui/views/ResultsPageView.dart';
import 'package:wikipediaapp/ui/views/base_view.dart';
import 'package:wikipediaapp/core/enums/viewstate.dart';

class DataSearch extends SearchDelegate<String> {
  final temp = ['1', '2', '3', '4', '5'];
  final recentTemp = ['3', '2', '4'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      MaterialButton(
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ResultsPageView(subWords: query,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentTemp
        : temp.where((element) => element.startsWith(query)).toList();
    print('Function Called1');
    return BaseView<SuggestionsList>(
        onModelReload: (model) => model.getSuggestionList(query, 5),
        builder: (context, model, child) {
          print('Function Called2');
//        model.getSuggestionList(query);
          return Container(
            child: model.state == ViewState.Busy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: model.listSuggestions.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, 'page', arguments: [
                          model.listSuggestions[index].pageId,
                          model.listSuggestions[index].title
                        ]);
                      },
                      leading: Icon(Icons.pageview),
                      title: RichText(
                        text: TextSpan(
                            text: model.listSuggestions[index].title,
                            style: TextStyle(color: Colors.black)
//                            .substring(0, model.listSuggestions[index].title.length >query.length ? query.length : model.listSuggestions[index].title.length),
//                        style: TextStyle(
//                            color: Colors.black, fontWeight: FontWeight.bold),
//                        children: [
//                          TextSpan(
//                              text: model.listSuggestions[index].title
//                                  .substring(model.listSuggestions[index].title.length >query.length ? query.length : model.listSuggestions[index].title.length),
//                              style: TextStyle(color: Colors.grey))
//                        ]
                            ),
                      ),
                    ),
                  ),
          );
        }

//      => Container(
//        child: model.state == ViewState.Busy
//            ? Center(
//                child: CircularProgressIndicator(),
//              )
//            : ListView.builder(
//                itemBuilder: (context, index) => ListTile(
//                  onTap: () {
//
//                    showResults(context);
//                  },
//                  leading: Icon(Icons.local_activity),
//                  title: RichText(
//                    text: TextSpan(
//                        text: model.listSuggestions[index]
//                            .substring(0, query.length),
//                        style: TextStyle(
//                            color: Colors.black, fontWeight: FontWeight.bold),
//                        children: [
//                          TextSpan(
//                              text: model.listSuggestions[index]
//                                  .substring(query.length),
//                              style: TextStyle(color: Colors.grey))
//                        ]),
//                  ),
//                ),
//              ),
//      ),
        );
//    return ListView.builder(
//      itemBuilder: (context, index) => ListTile(
//        onTap: (){
//          showResults(context);
//        },
//        leading: Icon(Icons.local_activity),
//        title: RichText(
//          text: TextSpan(
//            text: suggestionList[index].substring(0, query.length),
//            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//              children: [TextSpan(
//                text: suggestionList[index].substring(query.length),
//                style: TextStyle(color: Colors.grey)
//              )]
//          ),
//        )
//      ),
//      itemCount: suggestionList.length,
//    );
  }
}
