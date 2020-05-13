import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wikipediaapp/core/enums/viewstate.dart';
import 'package:wikipediaapp/core/models/PageListItemModel.dart';
import 'package:wikipediaapp/search_widget.dart';
import 'package:wikipediaapp/ui/viewmodels/home_model.dart';
import 'package:wikipediaapp/ui/widgets/page_list_view_card.dart';
import 'package:wikipediaapp/ui/widgets/search_icon_button_widget.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getPageListRandom(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Home',
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: SearchIconButton(),
            )
          ],
        ),
        body: model.state == ViewState.Idle
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: getPageListUI(model.pageList),
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

Widget getPageListUI(List<PageListItemModel> posts) => ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => PageListViewCard(
        post: posts[index],
        onTap: () {
          //TODO: Add on Top from this.
        },
      ),
    );
