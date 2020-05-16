import 'package:wikipediaapp/core/enums/viewstate.dart';
import 'package:wikipediaapp/core/models/PageListItemModel.dart';
import 'package:wikipediaapp/core/services/Apis/Api.dart';
import 'package:wikipediaapp/locator.dart';

import 'basemodel.dart';

class WikiPageModel extends BaseModel{
  String _htmlData;
  var _api = locator<Api>();
  String get htmlData => _htmlData;

  Future getHTMLDataPageId(int pageid) async {
    setState(ViewState.Busy);
    _htmlData = await _api.getPageHTML(pageid);
    setState(ViewState.Idle);
    return _htmlData;
  }
  Future getHTMLDataPageUniqueURL(String pageid) async {
    setState(ViewState.Busy);
    _htmlData = await _api.getPageHTMLFromURL(pageid);
    setState(ViewState.Idle);
    return _htmlData;
  }
}
