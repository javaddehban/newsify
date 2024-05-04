import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static String baseUrl = dotenv.env['BASE_URL'] ?? "";
  static String apiKey = dotenv.env['API_KEY'] ?? "";
  static String newsKey =  dotenv.env['NEWS_KEY'] ?? "";
}
