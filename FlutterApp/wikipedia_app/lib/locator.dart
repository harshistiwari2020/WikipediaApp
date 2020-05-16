
import 'package:get_it/get_it.dart';
import 'package:wikipediaapp/core/services/Apis/Api.dart';
import 'package:wikipediaapp/ui/viewmodels/home_model.dart';
import 'package:wikipediaapp/ui/viewmodels/wiki_page_model.dart';
import 'package:wikipediaapp/ui/viewmodels/suggestions_list.dart';

GetIt locator = GetIt.instance;

void setUpLocator(){
  locator.registerLazySingleton(() => Api());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => WikiPageModel());
  locator.registerFactory(() => SuggestionsList());
}