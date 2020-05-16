import 'package:wikipediaapp/core/enums/viewstate.dart';
import 'package:wikipediaapp/core/models/PageListItemModel.dart';
import 'package:wikipediaapp/core/services/Apis/Api.dart';
import 'package:wikipediaapp/locator.dart';

import 'package:wikipediaapp/core/models/PageSearchItemModel.dart';
import 'basemodel.dart';

class SuggestionsList extends BaseModel{
  List<PageListItemModel> _listSuggestions;
  var _api = locator<Api>();
  List<PageListItemModel> get listSuggestions => _listSuggestions;

  Future getSuggestionList(String subwords,int limit) async {
    setState(ViewState.Busy);
    _listSuggestions = await _api.getSuggestedPages(subwords, limit);
    setState(ViewState.Idle);
    return _listSuggestions;
  }
}
