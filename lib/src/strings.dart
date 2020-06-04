extension StringSupport on String {
  /// Call to int.parse
  int parseInt() {
    return int.parse(this);
  }

  /// Call to int.tryParse
  int tryParseInt() {
    return int.tryParse(this);
  }

  /// Call to double.parse
  double parseDouble() {
    return double.parse(this);
  }

  /// Call to double.tryParse
  double tryParseDouble() {
    return double.tryParse(this);
  }
}
