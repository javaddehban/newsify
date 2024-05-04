import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:news/features/home/data/datasource/home_local_datasource.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}
final getIt = GetIt.instance;

void main() {
  late HomeLocalDataSource dataSource;
  late MockSharedPreferences mockSharedPreferences;
  dotenv.testLoad(fileInput: File('test/.env').readAsStringSync());
  final newsKey =  dotenv.env['NEWS_KEY'] ?? "";

  setUp(() async {
    mockSharedPreferences = MockSharedPreferences();
    GetIt.I.registerLazySingleton<SharedPreferences>(() => mockSharedPreferences);
    dataSource = HomeLocalDataSourceIml();
  });
  tearDown(() {
    GetIt.I.unregister<SharedPreferences>();
  });

  group('getNews', () {
    test('should return a List<NewsModel> from SharedPreferences', () async {
      // Arrange
      final newsJsonList = [
        {"title": "Test Title 1", "description": "Test Description 1"},
        {"title": "Test Title 2", "description": "Test Description 2"}
      ];
      final newsList = newsJsonList.map((json) => NewsModel.fromJson(json)).toList();
      when(mockSharedPreferences.getStringList(newsKey))
          .thenReturn(newsJsonList.map((json) => jsonEncode(json)).toList());

      // Act
      final result = await dataSource.getNews();

      // Assert
      expect(result, newsList);
    });
  });

  group('addNews', () {
    test('should add news to SharedPreferences', () async {
      // Arrange
      final newsList = [
        const NewsModel(title: "Test Title 1", description: "Test Description 1"),
        const NewsModel(title: "Test Title 2", description: "Test Description 2")
      ];

      // Act
      final result = await dataSource.addNews(newsList);

      // Assert
      expect(result, true);
      verify(mockSharedPreferences.setStringList(newsKey, any!)).called(1);
    });
  });
}
