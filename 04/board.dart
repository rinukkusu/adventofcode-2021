class Board {
  static const int boardSize = 5;

  int id;
  List<List<int>> data;

  static Board FromLines(Iterable<String> lines, int id) {
    return new Board()
      ..data = lines
          .map((x) => x
              .split(' ')
              .where((e) => e != null && e.isNotEmpty)
              .map((e) => int.parse(e))
              .toList())
          .toList()
      ..id = id;
  }

  bool isWinning(List<int> drawnNumbers) {
    // rows
    var winningRow = data
        .where((row) => row.every((cell) => drawnNumbers.contains(cell)))
        .toList();

    if (winningRow.length > 0) {
      return true;
    }

    // cols
    for (int i = 0; i < boardSize; i++) {
      var isWinningColumn = data
          .map((row) => row[i])
          .every((cell) => drawnNumbers.contains(cell));

      if (isWinningColumn) {
        return true;
      }
    }

    return false;
  }

  int sumOfUnmarkedNumbers(List<int> drawnNumbers) {
    return data
        .map((row) => row
            .map((cell) => drawnNumbers.contains(cell) ? 0 : cell)
            .reduce((a, b) => a + b))
        .reduce((a, b) => a + b);
  }

  String toString() {
    return data.toString();
  }
}
