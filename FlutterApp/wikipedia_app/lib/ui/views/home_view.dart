import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wikipediaapp/core/enums/viewstate.dart';
import 'package:wikipediaapp/core/models/PageListItemModel.dart';
import 'file:///C:/Users/harsh/Documents/WorkFiles/GithubProjects/WikipediaApp/FlutterApp/wikipedia_app/lib/ui/widgets/search_widget.dart';
import 'package:wikipediaapp/ui/viewmodels/home_model.dart';
import 'package:wikipediaapp/ui/widgets/PageListUI.dart';
import 'package:wikipediaapp/ui/widgets/SearchAppbar.dart';
import 'package:wikipediaapp/ui/widgets/page_list_view_card.dart';
import 'package:wikipediaapp/ui/widgets/search_icon_button_widget.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getPageListRandom(),
      builder: (context, model, child) => Scaffold(
        appBar: SearchAppbar(title: 'Home'),
        body: model.state == ViewState.Idle
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: PagesListUI(model.pageList),
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

