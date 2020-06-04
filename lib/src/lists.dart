import 'dart:math' as math;

extension ListSupport<T> on List<T> {
  /// return random element of list
  T get random {
    final rd = math.Random();
    return this[rd.nextInt(length)];
  }
}

extension IterableSupport<T extends num> on Iterable<T> {
  T get max => reduce(math.max);

  T get min => reduce(math.min);
}
