import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wikipediaapp/core/models/PageListItemModel.dart';

class Api {
  static const endpoint = 'https://en.wikipedia.org/w/api.php';

  var client = new http.Client();

  Future getSuggestionTopics(List<String> topics, int element_each_topic) async {
    List<dynamic> topics_json = new List<dynamic>();

    var _pageListItemModel = List<PageListItemModel>();

    for (var topic in topics) {
      var response = await client.get(
          '$endpoint?action=query&list=categorymembers&cmtitle=Category:$topic&cmlimit=$element_each_topic&cmsort=timestamp&cmdir=desc&format=json');
      var json_data = json.decode(response.body);
      topics_json.addAll(json_data['query']['categorymembers']);

      for (var jsonSubData in json_data['query']['categorymembers']){
        var pageid = jsonSubData['pageid'];
        var title  = jsonSubData['title'];
        var page_summary = await getPageSummary(pageid);

        _pageListItemModel.add(PageListItemModel(title: title, summary: page_summary));
      }
      // print(response);
    }

    return _pageListItemModel;
  }

  Future<String> getPageSummary(int pageid) async {
    var response = await client.get(
        '$endpoint?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&pageids=$pageid');
    var json_data = json.decode(response.body);
    return json_data['query']['pages']['$pageid']['extract'];
  }
}
