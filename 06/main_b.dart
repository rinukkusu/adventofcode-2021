import 'dart:io';
import 'lanternfish_simulator_grouped.dart';

main() {
  var input =
      new File('data').readAsStringSync().split(',').map((x) => int.parse(x));

  var lanternFishSimulator = new LanternfishSimulator(input.toList());

  // simulate 80 days
  for (int i = 0; i < 256; i++) {
    lanternFishSimulator.step();
  }

  print(lanternFishSimulator.fishCount());
}
