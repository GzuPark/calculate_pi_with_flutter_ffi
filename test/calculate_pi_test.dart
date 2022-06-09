import 'package:flutter_test/flutter_test.dart';

import 'package:calculate_pi_with_flutter_ffi/calculate_pi.dart';

void main() {
  test('[Dart] Calculate Pi with 1 iteration', () {
    const int nIter = 1;
    final double pi = calculatePi(nIter);
    expect(pi, 4);
  });

  test('[Dart] Calculate Pi with 2 iteration', () {
    const int nIter = 2;
    final double pi = calculatePi(nIter);
    expect(pi, greaterThan(2.66));
    expect(pi, lessThan(2.67));
  });

  test('[Dart] Calculate Pi with 3 iteration', () {
    const int nIter = 3;
    final double pi = calculatePi(nIter);
    expect(pi, greaterThan(3.46));
    expect(pi, lessThan(3.47));
  });

  test('[Dart] Calculate Pi with 4 iteration', () {
    const int nIter = 4;
    final double pi = calculatePi(nIter);
    expect(pi, greaterThan(2.895));
    expect(pi, lessThan(2.896));
  });

  test('[Dart] Calculate Pi with 5 iteration', () {
    const int nIter = 5;
    final double pi = calculatePi(nIter);
    expect(pi, greaterThan(3.3396));
    expect(pi, lessThan(3.3397));
  });

  test('[Dart] Calculate Pi with 1000 iteration', () {
    const int nIter = 1000;
    final double pi = calculatePi(nIter);
    expect(pi, greaterThan(3.14));
    expect(pi, lessThan(3.15));
  });

  test('[Dart] Calculate Pi with 100_000 iteration', () {
    const int nIter = 100000;
    final double pi = calculatePi(nIter);
    expect(pi, greaterThan(3.1415));
    expect(pi, lessThan(3.1416));
  });
}
