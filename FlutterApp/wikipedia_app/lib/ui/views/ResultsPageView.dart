import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wikipediaapp/core/enums/viewstate.dart';
import 'package:wikipediaapp/core/models/PageListItemModel.dart';
import 'file:///C:/Users/harsh/Documents/WorkFiles/GithubProjects/WikipediaApp/FlutterApp/wikipedia_app/lib/ui/widgets/search_widget.dart';
import 'package:wikipediaapp/ui/viewmodels/home_model.dart';
import 'package:wikipediaapp/ui/viewmodels/suggestions_list.dart';
import 'package:wikipediaapp/ui/widgets/PageListUI.dart';
import 'package:wikipediaapp/ui/widgets/SearchAppbar.dart';
import 'package:wikipediaapp/ui/widgets/page_list_view_card.dart';
import 'package:wikipediaapp/ui/widgets/search_icon_button_widget.dart';

import 'base_view.dart';

class ResultsPageView extends StatelessWidget {
  String subWords;

  ResultsPageView({this.subWords});

  @override
  Widget build(BuildContext context) {
    return BaseView<SuggestionsList>(
      onModelReady: (model) => model.getSuggestionList(subWords, 10),
      builder: (context, model, child) => Scaffold(
        body: model.state == ViewState.Idle
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: PagesListUI(model.listSuggestions),
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
