import 'dart:collection';
import 'dart:io';
import 'lanternfish_simulator.dart';

main() {
  var input = new File('data').readAsStringSync().split(',');
  var newFishQueue = new Queue<LanternfishSimulator>();

  var lanternFishList = input
      .map((x) => int.parse(x))
      .map((x) => new LanternfishSimulator(newFishQueue, x))
      .toList();

  // simulate 80 days
  for (int i = 0; i < 80; i++) {
    for (var fish in lanternFishList) {
      fish.step();
    }

    while (newFishQueue.isNotEmpty) {
      lanternFishList.add(newFishQueue.removeFirst());
    }
  }

  print(lanternFishList.length);
}
