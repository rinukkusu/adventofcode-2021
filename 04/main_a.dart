import 'dart:io';
import 'board.dart';

main() {
  var input = new File('data').readAsLinesSync();

  var allDrawnNumbers =
      input.first.split(',').map((x) => int.parse(x)).toList();

  input = input.skip(2).toList();

  var boards = new List<Board>();

  int id = 1;
  while (input.isNotEmpty) {
    var boardLines = input.take(Board.boardSize);
    input = input.skip(Board.boardSize + 1).toList();
    boards.add(Board.FromLines(boardLines, id++));
  }

  for (int i = 0; i < allDrawnNumbers.length; i++) {
    var drawnNumbers = allDrawnNumbers.take(i).toList();

    var winningBoards =
        boards.where((board) => board.isWinning(drawnNumbers)).toList();

    if (winningBoards.isNotEmpty) {
      var winningBoard = winningBoards.first;
      var unmarkedNumberSum = winningBoard.sumOfUnmarkedNumbers(drawnNumbers);
      var score = drawnNumbers.last * unmarkedNumberSum;
      print(score);
      break;
    }
  }
}
