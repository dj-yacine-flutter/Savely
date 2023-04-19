import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:savely/savely.dart';

void main() {
  test('test', () async {
    final Savely savely = Savely();
    await savely.down('https://www.youtube.com/watch?v=J_hQpNWA-Z8');
    if (kDebugMode) {
      print(savely.source);
      print(savely.title);
      print(savely.duration);
      print(savely.thumbnail);
      print(savely.website);
      print(savely.data);
    }
  });
}
