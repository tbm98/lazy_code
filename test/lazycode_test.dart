import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lazy_code/lazy_code.dart';


void main() {
  group('test case of number', () {
    test('test number convert to SizedBox', () {
      expect(1.height.height, 1);
      expect(1.0.height.height, 1);
      expect(1.1.height.height, 1.1);
      expect(1.width.width, 1);
      expect(1.0.width.width, 1);
      expect(1.1.width.width, 1.1);
    });
  });

  group('test case of text', () {
    test('test create TextStyle', () {
      final ts = styleOf();
      expect(ts == const TextStyle(), true);

      final ts2 = styleOf([Colors.yellow, FontWeight.bold, 16]);
      final ts22 = TextStyle(
          color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 16);
      expect(ts2, ts22);
      expect(ts2.color, Colors.yellow);
      expect(ts2.fontWeight, FontWeight.bold);
      expect(ts2.fontSize, 16);
    });
  });
  group('test case of Lists', () {
    test('test min/max', () {
      expect([1, 2, 3, 4].max, 4);
      expect([1, 2, 3, -4].min, -4);
      expect([1, 2, 3, 4.1].max, 4.1);
      expect([1, 2, -3.3, 4.1].min, -3.3);
    });
  });
}
