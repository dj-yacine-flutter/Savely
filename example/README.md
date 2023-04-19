# Example

```dart
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:savely/savely.dart';

void main() {
  test('test', () async {
    final Savely savely = Savely();
    await savely.down('https://www.youtube.com/watch?v=J_hQpNWA-Z8');
    if (kDebugMode) {
      print('source : ${savely.source}');
      print('title : ${savely.title}');
      print('duration : ${savely.duration}');
      print('thumbnail : ${savely.thumbnail}');
      print('website : ${savely.website}');
      print('data : ${savely.data}');
    }
  });
}
```