import 'package:news/config/network/i_api_request_manager.dart';


class BaseRepository {
  final IHttpClient httpClient;

  BaseRepository(this.httpClient);
}