import 'dart:io';

main() {
  var list =
      new File('data').readAsLinesSync().map((x) => int.parse(x)).toList();

  var result = 0;
  const windowSize = 3;

  for (var i = 1; i < list.length; i++) {
    var last = list.skip(i - 1).take(windowSize).reduce((a, b) => a + b);
    var now = list.skip(i).take(windowSize).reduce((a, b) => a + b);

    if (last < now) result++;
  }

  print(result);
}
