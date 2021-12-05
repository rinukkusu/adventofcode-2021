import 'dart:core';

class FloorMap {
  List<List<int>> _map;
  bool _withDiagonal = false;

  FloorMap(int size, bool withDiagonal) {
    _map = List.generate(size, (index) => new List.filled(size, 0));
    _withDiagonal = withDiagonal;
  }

  void addLine(String line) {
    final lineParts = line
        .split(" -> ")
        .map((part) => part.split(",").map((e) => int.parse(e)).toList())
        .toList();

    final x1 = lineParts[0][0];
    final y1 = lineParts[0][1];
    final x2 = lineParts[1][0];
    final y2 = lineParts[1][1];

    final xRaising = x2 >= x1;
    final yRaising = y2 >= y1;

    final isDiagonal = x1 != x2 && y1 != y2;

    if (isDiagonal && !_withDiagonal) return;

    for (int x = x1; xRaising ? x <= x2 : x >= x2; xRaising ? x++ : x--) {
      if (isDiagonal) {
        final xChange = (x - x1).abs();
        final y = y1 + (yRaising ? xChange : -xChange);
        _map[y][x]++;
      } else {
        for (int y = y1; yRaising ? y <= y2 : y >= y2; yRaising ? y++ : y--) {
          _map[y][x]++;
        }
      }
    }
  }

  int getOverlapCount(int threshold) {
    return _map
        .map((row) => row.where((cell) => cell >= threshold).length)
        .reduce((a, b) => a + b);
  }

  @override
  String toString() {
    return _map
        .map((row) =>
            row.map((cell) => cell == 0 ? "." : cell.toString()).join())
        .join("\n");
  }
}
