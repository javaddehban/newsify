import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/utlis/pars_date.dart';

void main() {
  group('ParsDate Tests', () {
    test('Calculate remaining date for now', () {
      final now = DateTime.now();
      final result = ParsDate.calculateRemandingDate(now);
      expect(result, 'now');
    });

    test('Calculate remaining date for few minutes ago', () {
      final current = DateTime.now().subtract(const Duration(minutes: 5));
      final result = ParsDate.calculateRemandingDate(current);
      expect(result, 'few minutes ago');
    });

    test('Calculate remaining date for hours ago', () {
      final current = DateTime.now().subtract(const Duration(hours: 3));
      final result = ParsDate.calculateRemandingDate(current);
      expect(result, '3 hours');
    });

    test('Calculate remaining date for 1 day ago', () {
      final current = DateTime.now().subtract(const Duration(days: 1));
      final result = ParsDate.calculateRemandingDate(current);
      expect(result, '1 day ago');
    });

    test('Calculate remaining date for days ago', () {
      final current = DateTime.now().subtract(const Duration(days: 5));
      final result = ParsDate.calculateRemandingDate(current);
      expect(result, '5 days ago');
    });
  });
}
