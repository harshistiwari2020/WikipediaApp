import 'package:wikipediaapp/core/enums/viewstate.dart';
import 'package:wikipediaapp/core/models/PageListItemModel.dart';
import 'package:wikipediaapp/core/services/Apis/Api.dart';
import 'package:wikipediaapp/locator.dart';

import 'basemodel.dart';

class HomeModel extends BaseModel{
  List<PageListItemModel> _pageListItemModel;
  var _api = locator<Api>();
  List<String> basicTopic = ['Mathematics', 'Physics', 'Chemistry', 'History', 'Technology'];
  List<PageListItemModel> get pageList => _pageListItemModel;
  Future getPageListRandom() async {
    setState(ViewState.Busy);
    _pageListItemModel = await _api.getSuggestionTopics(basicTopic, 2);
    setState(ViewState.Idle);
    return _pageListItemModel;
  }
}