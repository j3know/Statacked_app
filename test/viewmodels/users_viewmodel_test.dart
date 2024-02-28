import 'package:flutter_test/flutter_test.dart';
import 'package:stacked_2/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('UsersViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
