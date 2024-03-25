extension StringListEx on List<String> {
  List<String> addedLfAtLast([int count = 1]) {
    return [
      for (final (i, e) in indexed)
        if (i == length - 1) e + ('\n' * count) else e,
    ];
  }
}
