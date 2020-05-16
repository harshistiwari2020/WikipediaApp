import 'package:flutter/cupertino.dart';
import 'package:wikipediaapp/core/models/PageListItemModel.dart';
import 'package:wikipediaapp/ui/widgets/page_list_view_card.dart';

class PagesListUI extends StatelessWidget {
  List<PageListItemModel> pagesList;

  PagesListUI(List<PageListItemModel> pageList): this.pagesList = pageList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pagesList.length,
      itemBuilder: (context, index) => PageListViewCard(
        post: pagesList[index],
        onTap: () {
          Navigator.pushNamed(context, 'page', arguments: [pagesList[index].pageId, pagesList[index].title]);
          //TODO: Add on Top from this.
        },
      ),
    );
  }
}
