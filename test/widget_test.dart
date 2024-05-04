// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/utlis/pars_date.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:news/features/home/presentation/widget/item_news_widget.dart';

import 'package:news/main.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  testWidgets('ItemNewsWidget renders correctly', (WidgetTester tester) async {
    // Create a NewsModel instance
    final newsModel = NewsModel(
      // Initialize with required properties
      title: 'Test Title',
      description: 'Test Description',
      publishedAt: DateTime.now(),
    );

    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: ItemNewsWidget(item: newsModel),
    ));

    // Verify that the title text is rendered correctly
    expect(find.text('Test Title'), findsOneWidget);

    // Verify that the description text is rendered correctly
    expect(find.text('Test Description'), findsOneWidget);

    // Verify that the published date text is rendered correctly
    expect(find.text(ParsDate.calculateRemandingDate(newsModel.publishedAt!)), findsOneWidget);

    // Verify that the image placeholder is rendered correctly
    expect(find.byType(Shimmer), findsOneWidget);
  });

}
