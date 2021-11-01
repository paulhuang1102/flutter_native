import 'package:pigeon/pigeon.dart';

enum RequsetType {
  sayhello,
  getbattery
}

class SearchRequest {
  RequsetType? query;

}

class SearchReply {
  String? result;
}

@HostApi()
abstract class SearchApi {
  SearchReply search(SearchRequest request);
}
