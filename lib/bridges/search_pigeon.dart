import 'dart:async';

import 'package:channel/pigeon.dart';

class FlutterPigeonPlugin {
  static final SearchApi _searchApi = SearchApi();

  static Future<SearchReply> sayHello() async {
    SearchRequest q = SearchRequest();
    q.query = RequsetType.sayhello;
    return await _searchApi.search(q);
  }

  static Future<SearchReply> getBattery() async {
    SearchRequest q = SearchRequest();
    q.query = RequsetType.getbattery;
    return await _searchApi.search(q);
  }
}
