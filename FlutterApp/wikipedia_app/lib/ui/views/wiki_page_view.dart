import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wikipediaapp/core/enums/viewstate.dart';
import 'package:wikipediaapp/ui/viewmodels/wiki_page_model.dart';
import 'package:wikipediaapp/ui/views/base_view.dart';
import 'package:wikipediaapp/ui/widgets/SearchAppbar.dart';
import 'package:wikipediaapp/ui/widgets/html_to_flutter.dart';

class WikiPageView extends StatelessWidget {
  final int pageId;
  String title;
  final String pageUniqueURL;

  WikiPageView({Key key, this.pageId, this.title, this.pageUniqueURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<WikiPageModel>(
      onModelReady: (model){
        if(pageId == null && title==null){
          this.title = this.pageUniqueURL.split('_').join(' ');
          return model.getHTMLDataPageUniqueURL(pageUniqueURL);
        }else{
          return model.getHTMLDataPageId(pageId);
        }
        },
      builder: (context, model, child) => Scaffold(
        appBar: SearchAppbar(title: title,),
        body: model.state == ViewState.Idle
            ? SingleChildScrollView(
                child: HtmlWidget(
                  html: model.htmlData,
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
