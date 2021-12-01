import 'dart:io';

main() {
  var list =
      new File('data').readAsLinesSync().map((x) => int.parse(x)).toList();

  var result = 0;

  for (var i = 1; i < list.length; i++) {
    if (list[i - 1] < list[i]) result++;
  }

  print(result);
}
