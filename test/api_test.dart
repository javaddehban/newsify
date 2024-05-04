import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news/config/contans/constants.dart';
import 'package:news/features/home/data/model/news_model.dart';

void main() {
  group('News API Test', () {
    Dio dio = Dio();
    dotenv.testLoad(fileInput: File('test/.env').readAsStringSync());

    final baseUrl =  dotenv.env['BASE_URL'] ?? "";
    final  apiKey = dotenv.env['API_KEY'] ?? "" ; // Replace with your actual API key

    test('Fetch top headlines', () async {
      // Make the API call
      final response = await dio.get("$baseUrl/top-headlines", queryParameters: {
        'country': 'us',
        'apiKey': apiKey,
      });

      // Check if the response is successful
      expect(response.statusCode, 200);

      // Parse the response into a list of NewsModel
      final List<dynamic> newsJson = response.data['articles'];
      final List<NewsModel> newsList =
      newsJson.map((json) => NewsModel.fromJson(json)).toList();

      // Ensure that we have some news articles
      expect(newsList.isNotEmpty, true);

      // You can add more specific assertions here based on your API response and data model
    });
  });
}
