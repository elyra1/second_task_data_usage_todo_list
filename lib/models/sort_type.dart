enum SortType { alphabeticalSort, alphabeticalSortReversed, dateSort }

extension SortTypeExtension on SortType {
  String get type {
    switch (this) {
      case SortType.alphabeticalSort:
        return "AlphabeticalSort";
      case SortType.alphabeticalSortReversed:
        return "AlphabeticalSortReversed";
      case SortType.dateSort:
        return "DateSort";
    }
  }
}
