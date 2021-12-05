import 'dart:io';
import 'floormap.dart';

main() {
  var input = new File('data').readAsLinesSync();
  var floorMap = new FloorMap(1000, false);

  for (var item in input) {
    floorMap.addLine(item);
  }

  print(floorMap.getOverlapCount(2));
}
