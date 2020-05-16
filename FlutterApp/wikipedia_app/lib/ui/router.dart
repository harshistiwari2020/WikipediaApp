import 'package:flutter/material.dart';
import 'package:wikipediaapp/ui/views/home_view.dart';
import 'package:wikipediaapp/ui/views/wiki_page_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'page':
        if(settings.arguments.runtimeType == String){
          var pageUniqueURL = settings.arguments as String;

          return MaterialPageRoute(builder: (_) =>
              WikiPageView(pageUniqueURL: pageUniqueURL));
        }else{
          var pageDataList = settings.arguments as List<dynamic>;
          return MaterialPageRoute(builder: (_) =>
              WikiPageView(pageId: pageDataList[0], title: pageDataList[1]));
        }
    }
  }
}