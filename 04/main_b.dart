import 'dart:io';
import 'board.dart';

main() {
  var input = new File('data').readAsLinesSync();

  var allDrawnNumbers =
      input.first.split(',').map((x) => int.parse(x)).toList();

  input = input.skip(2).toList();

  var boards = new List<Board>();

  var id = 1;
  while (input.isNotEmpty) {
    var boardLines = input.take(Board.boardSize);
    input = input.skip(Board.boardSize + 1).toList();
    boards.add(Board.FromLines(boardLines, id++));
  }

  Map<Board, List<int>> winningBoardsMap = new Map();

  for (int i = 0; i < allDrawnNumbers.length; i++) {
    var drawnNumbers = allDrawnNumbers.take(i).toList();

    var winningBoards =
        boards.where((board) => board.isWinning(drawnNumbers)).toList();

    if (winningBoards.isNotEmpty) {
      for (var board in winningBoards) {
        winningBoardsMap.putIfAbsent(board, () => drawnNumbers);
      }
    }
  }

  var lastWinningBoard = winningBoardsMap.entries.last.key;
  var lastDrawnNumbers = winningBoardsMap.entries.last.value;

  var unmarkedNumberSum =
      lastWinningBoard.sumOfUnmarkedNumbers(lastDrawnNumbers);
  var score = lastDrawnNumbers.last * unmarkedNumberSum;
  print(score);
}
