import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wikipediaapp/core/models/PageListItemModel.dart';
import 'package:wikipediaapp/core/models/PageSearchItemModel.dart';
class Api {
  static const endpoint = 'https://en.wikipedia.org/w/api.php';

  var client = new http.Client();

  Future getSuggestionTopics(
      List<String> topics, int elementEachTopic) async {
    List<dynamic> topicsJson = new List<dynamic>();

    var _pageListItemModel = List<PageListItemModel>();

    for (var topic in topics) {
      var response = await client.get(
          '$endpoint?action=query&list=categorymembers&cmtitle=Category:$topic&cmlimit=$elementEachTopic&cmsort=timestamp&cmdir=desc&format=json');
      var jsonData = json.decode(response.body);
      topicsJson.addAll(jsonData['query']['categorymembers']);

      for (var jsonSubData in jsonData['query']['categorymembers']) {
        var pageid = jsonSubData['pageid'];
        var title = jsonSubData['title'];
        var pageSummary = await getPageSummary(pageid);
        if (pageSummary != '') {
          _pageListItemModel.add(PageListItemModel(
              title: title, summary: pageSummary, pageId: pageid));
        }

        print('$topic : $title');
        // print(page_summary.substring(0, 10));
      }
      // print(response);
    }

    return _pageListItemModel;
  }

  Future<String> getPageSummary(int pageid) async {
    var response = await client.get(
        '$endpoint?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&pageids=$pageid');
    var jsonData = json.decode(response.body);
    return jsonData['query']['pages']['$pageid']['extract'];
  }

  Future<String> getPageHTML(int pageid) async {
    var response = await client.get(
        "https://en.wikipedia.org/w/api.php?action=parse&pageid=$pageid&prop=text&format=json");
    var jsonData = json.decode(response.body);
    var textData = jsonData['parse']['text']['*'];

    return textData;
  }


  Future<String> getPageHTMLFromURL(String pageURL) async {
    var response = await client.get(
        "https://en.wikipedia.org/w/api.php?action=parse&page=$pageURL&prop=text&format=json");
    var jsonData = json.decode(response.body);
    var textData = jsonData['parse']['text']['*'];

    return textData;
  }
  Future<List<PageListItemModel>> getSuggestedPages(String substring, int limit) async {
    var sepString = substring.trim().split(' ');
    var searchString = sepString.join('_');
    var response = await client.get('https://en.wikipedia.org/w/api.php?action=query&format=json&list=allpages&apfrom=$searchString&aplimit=$limit');
    var jsonData = json.decode(response.body);
    var suggestions = List<PageListItemModel>();
    var allCategory = jsonData['query']['allpages'];

    for(var cat in allCategory){
      suggestions.add(PageListItemModel(pageId: cat['pageid'],title: cat['title'] as String, summary: ""));
    }
    return suggestions;
  }}
